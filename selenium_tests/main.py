import random
import logging
import time
import undetected_chromedriver as uc
from selenium.common import TimeoutException, NoSuchElementException, StaleElementReferenceException
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from faker import Faker


def human_wait(base: float = 3.0, variance: float = 2.0):
    """Sleep func with variance to imitate the human behaviour"""
    time.sleep(random.uniform(base - variance, base + variance))


BASE_LINK = "https://localhost/"


def test_add_10_products_from_2_categories(driver: uc.Chrome, total_products_to_add: int = 10,
                                           num_categories: int = 3) -> None:
    """
    Adds a total of `total_products_to_add` products from `num_categories` different categories to the shopping cart.
    The products are added in random quantities, respecting stock availability.
    Out-of-stock products are ignored.
    """
    logging.info("Starting test: Add products to cart from different categories.")

    top_category_elements = driver.find_elements(By.XPATH, "//a[contains(@class, 'dropdown-item') and @data-depth='0']")

    categories_to_skip = ['Herbata premium', 'Herbata', 'Kawa', 'Yerba Mate', 'Akcesoria', 'Zioła']
    available_categories = [
        el for el in top_category_elements
        if el.get_attribute('textContent').strip() not in categories_to_skip
    ]

    if len(available_categories) < num_categories:
        logging.error(
            f"Not enough categories to run the test. Found {len(available_categories)}, need {num_categories}.")
        return

    selected_categories_elements = random.sample(available_categories, k=num_categories)

    selected_categories_data = []
    for el in selected_categories_elements:
        selected_categories_data.append({
            'name': el.get_attribute('textContent').strip(),
            'href': el.get_attribute('href')
        })

    logging.info(f"Selected categories: {[cat['name'] for cat in selected_categories_data]}")

    all_product_links = []
    for category_data in selected_categories_data:
        category_link = category_data['href']
        category_name = category_data['name']
        driver.get(category_link)
        product_links_on_page = [el.get_attribute('href') for el in
                                 driver.find_elements(By.CSS_SELECTOR, "article.product-miniature h2.product-title a")]
        all_product_links.extend(product_links_on_page)
        logging.info(f"Found {len(product_links_on_page)} products in category '{category_name}'.")

    all_product_links = list(set(all_product_links))  # Remove duplicates

    if len(all_product_links) == 0:
        logging.error("No  products found in the selected categories.")
        return

    if len(all_product_links) < total_products_to_add:
        logging.warning(
            f"Found only {len(all_product_links)} unique  products across selected categories. Will add all of them.")
        products_to_add_links = all_product_links
    else:
        products_to_add_links = random.sample(all_product_links, k=total_products_to_add)

    logging.info(f"Attempting to add {len(products_to_add_links)} products to the cart.")

    products_added_count = 0
    for product_link in products_to_add_links:
        logging.info(f"Navigating to product: {product_link}")
        driver.get(product_link)

        try:
            stock_span = WebDriverWait(driver, 0.5).until(
                EC.presence_of_element_located((By.CSS_SELECTOR, "span[data-stock]"))
            )
            available_stock = int(stock_span.get_attribute('data-stock'))

            if available_stock <= 0:
                logging.warning(f"Product page indicates out of stock: {product_link}. Skipping.")
                continue

            max_quantity_to_add = min(available_stock, 3)
            quantity_to_add = random.randint(1, max_quantity_to_add)

            logging.info(f"Available stock: {available_stock}. Setting quantity to {quantity_to_add}.")

            if quantity_to_add > 1:
                increment_button = WebDriverWait(driver, 0.3).until(
                    EC.element_to_be_clickable((By.CSS_SELECTOR, ".touchspin-up, .bootstrap-touchspin-up"))
                )
                for _ in range(quantity_to_add - 1):
                    increment_button.click()

        except (TimeoutException, ValueError, NoSuchElementException):
            logging.warning(f"Could not determine stock or set quantity for {product_link}. Using default quantity 1.")

        try:
            add_to_cart_button = WebDriverWait(driver, 0.5).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, ".add-to-cart"))
            )
            add_to_cart_button.click()

            continue_shopping_button = WebDriverWait(driver, 1).until(
                EC.element_to_be_clickable(
                    (By.XPATH, "//button[contains(., 'Kontynuuj zakupy') or contains(., 'Continue shopping')]"))
            )
            continue_shopping_button.click()
            products_added_count += 1
            logging.info(f"Product added. Total so far: {products_added_count}.")

        except TimeoutException:
            logging.error(f"Failed to add product to cart or continue shopping. Product link: {product_link}")

    logging.info(
        f"Test finished. Successfully added {products_added_count}/{len(products_to_add_links)} products to cart.")


def test_search_and_add_to_cart(driver: uc.Chrome, search_term: str = "herbata"):
    """
    Searches for a product by name, picks a random in-stock product from the results,
    and adds it to the cart.
    """
    logging.info(f"Starting test: Search for '{search_term}' and add a random product to cart.")
    driver.get(BASE_LINK)

    try:
        search_input = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "input[name='s']"))
        )
        search_input.send_keys(search_term)
        search_input.send_keys(Keys.ENTER)
        logging.info(f"Performed search for '{search_term}'.")
    except TimeoutException:
        logging.error("Could not find the search input field.")
        return

    try:

        product_elements = driver.find_elements(By.CSS_SELECTOR, "article.product-miniature h2.product-title a")

        if not product_elements:
            logging.warning(f"No in-stock products found for search term '{search_term}'.")
            return

        logging.info(f"Found {len(product_elements)} in-stock products in search results.")

        random_product_element = random.choice(product_elements)
        product_link = random_product_element.get_attribute('href')
        logging.info(f"Selected random product: {product_link}")

    except TimeoutException:
        logging.error("Search results page did not load or no products found.")
        return

    driver.get(product_link)

    try:
        stock_span = WebDriverWait(driver, 2).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "span[data-stock]"))
        )
        available_stock = int(stock_span.get_attribute('data-stock'))
        if available_stock <= 0:
            logging.warning(f"Selected random product is out of stock on its page: {product_link}. Aborting.")
            return

        add_to_cart_button = WebDriverWait(driver, 5).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, ".add-to-cart"))
        )
        add_to_cart_button.click()

        continue_shopping_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable(
                (By.XPATH, "//button[contains(., 'Kontynuuj zakupy') or contains(., 'Continue shopping')]"))
        )
        continue_shopping_button.click()
        logging.info(f"Successfully added product to cart.")

    except (TimeoutException, ValueError, NoSuchElementException):
        logging.error(f"Failed to add product to cart or product is out of stock. Product link: {product_link}")

    logging.info("Test finished: Search and add to cart.")


def test_remove_products_from_cart(driver: uc.Chrome, products_to_setup: int = 4, products_to_remove: int = 3):
    """
    removes a specified number of items from the cart.
    """

    logging.info("Navigating to the cart page.")
    cart_link = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, "div#_desktop_cart"))
    )
    cart_link.click()

    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".cart-overview")))

    logging.info(f"Attempting to remove {products_to_remove} products.")

    items_removed = 0
    for i in range(products_to_remove):
        try:
            remove_buttons = driver.find_elements(By.CSS_SELECTOR, "a.remove-from-cart")
            if not remove_buttons:
                logging.warning("No 'remove' buttons found in cart. Stopping removal.")
                break

            initial_item_count = len(driver.find_elements(By.CSS_SELECTOR, ".cart-item"))

            remove_buttons[0].click()

            WebDriverWait(driver, 10).until(
                lambda d: len(d.find_elements(By.CSS_SELECTOR, ".cart-item")) < initial_item_count
            )
            items_removed += 1
            logging.info(f"Removed product {items_removed}/{products_to_remove}.")

        except (TimeoutException, IndexError):
            logging.error("Failed to remove an item from the cart or no items left to remove.")
            break

    final_items = len(driver.find_elements(By.CSS_SELECTOR, ".cart-item"))
    logging.info(f"Test finished. Removed {items_removed} products. {final_items} items remaining in cart.")


def test_register_new_account(driver: uc.Chrome):
    """
    Tests the new user registration process.
    It uses fake data for registration details.
    """
    logging.info("Starting test: Register new account.")
    fake = Faker('pl_PL')  # Using Polish locale

    driver.get(BASE_LINK)

    try:
        sign_in_link = WebDriverWait(driver, 5).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "div#_desktop_user_info a"))
        )
        sign_in_link.click()
        create_account_link = WebDriverWait(driver, 5).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "div.no-account a"))
        )
        create_account_link.click()
        logging.info("Navigated to the account creation page.")

    except TimeoutException:
        logging.error("Could not find the link to the registration page.")
        register_url = BASE_LINK + 'login?create_account=1'
        logging.info(f"Attempting to navigate directly to {register_url}")
        driver.get(register_url)
        WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.CSS_SELECTOR, "form#customer-form")))

    try:

        driver.find_element(By.CSS_SELECTOR, "span.custom-radio").click()

        first_name = fake.first_name()
        last_name = fake.last_name()
        email = fake.email()
        password = fake.password(length=10, special_chars=True, upper_case=True, lower_case=True, digits=True)

        logging.info(f"Registering user: {first_name} {last_name} with email: {email}")

        driver.find_element(By.CSS_SELECTOR, "input[name='firstname']").send_keys(first_name)
        driver.find_element(By.CSS_SELECTOR, "input[name='lastname']").send_keys(last_name)
        driver.find_element(By.CSS_SELECTOR, "form#customer-form input[name='email']").send_keys(email)
        driver.find_element(By.CSS_SELECTOR, "input[name='password']").send_keys(password)

        driver.find_element(By.CSS_SELECTOR, "input[name='psgdpr']").click()

        driver.find_element(By.CSS_SELECTOR, "input[name='customer_privacy']").click()

        submit_button = driver.find_element(By.CSS_SELECTOR, "button[data-link-action='save-customer']")
        submit_button.click()
        logging.info("Registration form submitted.")

        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "a.account span.hidden-sm-down"))
        )
        user_name_element = driver.find_element(By.CSS_SELECTOR, "a.account span.hidden-sm-down")
        displayed_name = user_name_element.text
        expected_name = f"{first_name} {last_name}"

        if displayed_name.lower() == expected_name.lower():
            logging.info(f"Successfully registered and logged in as {displayed_name}.")
        else:
            logging.warning(
                f"Registration might have succeeded, but displayed name '{displayed_name}' does not match expected '{expected_name}'.")

    except (TimeoutException, NoSuchElementException) as e:
        logging.error(f"An error occurred during the registration process: {e}")
        driver.save_screenshot('registration_error.png')
        logging.info("Saved screenshot to registration_error.png")
        raise

    logging.info("Test finished: Register new account.")


def test_checkout(driver: uc.Chrome):
    driver.get(BASE_LINK)

    logging.info("Navigating to the cart page.")
    cart_link = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, "div#_desktop_cart"))
    )
    cart_link.click()

    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, ".cart-overview")))

    fake = Faker('pl_PL')
    street_addr = fake.street_address()
    city = fake.city()
    postal_code = fake.postcode()

    driver.find_element(By.CSS_SELECTOR, "input[name='address1']").send_keys(street_addr)
    driver.find_element(By.CSS_SELECTOR, "input[name='postcode']").send_keys(postal_code)
    driver.find_element(By.CSS_SELECTOR, "input[name='city']").send_keys(city)
    driver.find_element(By.CSS_SELECTOR, "button[name='confirm-addresses']").click()
    logging.info("Successfully filled addresses")
    human_wait(0.5, 0.1)

    driver.find_element(By.XPATH, "//span[contains(., 'ORLEN Paczka')]").click()
    driver.find_element(By.CSS_SELECTOR, "button[name='confirmDeliveryOption']").click()
    driver.find_element(By.CSS_SELECTOR, "input[id='payment-option-2']").click()
    logging.info("Successfully filled payments")
    human_wait(0.5, 0.1)

    driver.find_element(By.CSS_SELECTOR, "input[name='conditions_to_approve[terms-and-conditions]']").click()
    driver.find_element(By.XPATH, "//button[contains(., 'Złóż zamówienie')]").click()
    logging.info("Successfully ordered")
    human_wait(0.5, 0.1)

    number_entry = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, "input[name='number']"))
    )

    number_entry.send_keys("4444333322221111")
    driver.find_element(By.CSS_SELECTOR, "input[name='date']").send_keys("1229")
    driver.find_element(By.CSS_SELECTOR, "input[name='cvv']").send_keys("123")
    driver.find_element(By.CSS_SELECTOR, "input[name='submit']").click()
    logging.info("Card details filled")

    go_back_button = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//a[text()='Zamknij i wróć']"))
    )
    go_back_button.click()

    account_button = WebDriverWait(driver, 15).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, "a.account"))
    )
    account_button.click()

    history_button = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, "a#history-link"))
    )
    history_button.click()

    invoice_button = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//*[@id='content']/table/tbody/tr/td[5]/a"))
    )
    invoice_button.click()


if __name__ == '__main__':
    options = uc.ChromeOptions()
    options.add_argument('--ignore-certificate-errors')
    driver = uc.Chrome(options=options, headless=False, use_subprocess=False)
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

    driver.get(BASE_LINK)

    test_pipeline = [
        test_add_10_products_from_2_categories,
        # test_search_and_add_to_cart,
        # test_remove_products_from_cart,
        test_register_new_account,
        test_checkout,
    ]

    for test_func in test_pipeline:
        try:
            logging.info(f"--- Starting test: {test_func.__name__} ---")
            test_func(driver)
            logging.info(f"--- Test {test_func.__name__} passed ---")
        except Exception as e:
            logging.error(f"--- Test {test_func.__name__} failed: {e} ---")
            # To stop the pipeline on the first failure, uncomment the line below
            # break

    logging.info("--- Test pipeline finished ---")
    input("Press ENTER to close the browser and exit.")
    driver.quit()
