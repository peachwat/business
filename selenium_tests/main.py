import random
import logging
import os
import time
import json
from typing import List, Dict
import undetected_chromedriver as uc
from selenium.common import TimeoutException, NoSuchElementException, StaleElementReferenceException
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import csv


def human_wait(base: float = 3.0, variance: float = 2.0):
    """Sleep func with variance to imitate the human behaviour"""
    time.sleep(random.uniform(base - variance, base + variance))


def parse(driver: uc.Chrome, limit_of_categories: int = None, limit_of_subcategories: int = None,
          limit_of_groups: int = None, limit_of_products_in_group: int = None) -> List[Dict]:
    product_categories_data = []
    top_category_elements = driver.find_elements(By.XPATH, "//a[contains(@class, 'dropdown-item') and @data-depth='0']")



    categories_to_skip = ['Herbata premium', 'Herbata', 'Kawa', 'Yerba Mate', 'Akcesoria', 'Zioła']
    groups_to_skip = ['Herbata Biała', 'Herbaty japońskie']

    for id, top_category_element in enumerate(top_category_elements[:limit_of_categories]):
        category_name: str = top_category_element.get_attribute('textContent').strip()
        if (category_name in categories_to_skip):
            logging.info(f"Skipping category: {category_name}")
            continue

        logging.info(f"Fetching category: {category_name}")

        top_category_data = {
            "id": None,
            "name": category_name,
            "link": top_category_element.get_attribute('href'),
            "active": 1,
            "parent": "Home",
            "is_root": 0,
            "subcategories": []
        }

        subcategory_elements = top_category_element.find_elements(By.XPATH,
                                                                  "following-sibling::div//a[contains(@class, 'dropdown-item') and @data-depth='1']")
        for subcategory_element in subcategory_elements[:limit_of_subcategories]:
            subcategory_data = {
                "id": None,
                "name": subcategory_element.get_attribute('textContent').strip(),
                "link": subcategory_element.get_attribute('href'),
                "active": 1,
                "parent": top_category_data["name"],
                "is_root": 0,
            }

            logging.info(f"Fetching subcategory: {subcategory_data['name']}")

            group_elements = subcategory_element.find_elements(By.XPATH,
                                                               "following-sibling::div//a[contains(@class, 'dropdown-item') and @data-depth='2']")

            if group_elements:
                subcategory_data['groups'] = []
                for group_element in group_elements[:limit_of_groups]:
                    group_name = group_element.get_attribute('textContent').strip()
                    if group_name in groups_to_skip:
                        logging.info(f"Skipping group {group_name}")
                        continue

                    logging.info(f"Fetching group: {group_name}")

                    group_data = {
                        "id": None,
                        "name": group_element.get_attribute('textContent').strip(),
                        "link": group_element.get_attribute('href'),
                        "active": 1,
                        "parent": subcategory_data["name"],
                        "is_root": 0,
                        "products": []
                    }
                    subcategory_data["groups"].append(group_data)
            else:
                subcategory_data['products'] = []

            top_category_data["subcategories"].append(subcategory_data)
        product_categories_data.append(top_category_data)

    categories_csv_headers = ["Category ID", "Active (0/1)", "Name *", "Parent category", "Root category (0/1)",
                              "Description", "Meta title", "Meta keywords", "Meta description", "URL rewritten",
                              "Image URL"]

    full_products_csv_headers = ["Product ID", "Active (0/1)", "Name *", "Categories (x,y,z...)", "Price tax excluded",
                                 "Tax rules ID", "Wholesale price", "On sale (0/1)", "Discount amount",
                                 "Discount percent",
                                 "Discount from (yyyy-mm-dd)", "Discount to (yyyy-mm-dd)", "Reference #",
                                 "Supplier reference #", "Supplier", "Manufacturer", "EAN13", "UPC", "Ecotax", "Width",
                                 "Height", "Depth", "Weight", "Delivery time of in-stock products",
                                 "Delivery time of out-of-stock products with allowed orders", "Quantity",
                                 "Minimal quantity", "Low stock level",
                                 "Send me an email when the quantity is under this level", "Visibility",
                                 "Additional shipping cost", "Unity", "Unit price", "Summary", "Description",
                                 "Tags (x,y,z...)", "Meta title", "Meta keywords", "Meta description", "URL rewritten",
                                 "Text when in stock", "Text when backorder allowed",
                                 "Available for order (0 = No, 1 = Yes)", "Product available date",
                                 "Product creation date",
                                 "Show price (0 = No, 1 = Yes)", "Image URLs (x,y,z...)", "Image alt texts (x,y,z...)",
                                 "Delete existing images (0 = No, 1 = Yes)", "Feature(Name:Value:Position)",
                                 "Available online only (0 = No, 1 = Yes)", "Condition",
                                 "Customizable (0 = No, 1 = Yes)",
                                 "Uploadable files (0 = No, 1 = Yes)", "Text fields (0 = No, 1 = Yes)",
                                 "Out of stock action", "Virtual product", "File URL", "Number of allowed downloads",
                                 "Expiration date", "Number of days", "ID / Name of shop", "Advanced stock management",
                                 "Depends On Stock", "Warehouse", "Acessories  (x,y,z...)"]

    products_csv_headers = ["Product ID", "Active (0/1)", "Name *", "Categories (x,y,z...)", "Price tax excluded",
                            "Tax rules ID", "Quantity", "Summary", "Description",
                            "Show price (0 = No, 1 = Yes)", "Image URLs (x,y,z...)",
                            "Usuń istniejące zdjęcia (0 = Nie, 1 = Tak)", "is_new", "discount_percent"]

    unique_product_names = set()
    with open("categories.csv", "w+", newline='') as categories_csv:
        with open("products.csv", "w+", newline='') as products_csv:
            product_writer = csv.writer(products_csv, delimiter=';')
            categories_writer = csv.writer(categories_csv, delimiter=';')
            categories_writer.writerow(categories_csv_headers)
            product_writer.writerow(products_csv_headers)

            def process_and_write_products(product_container, link, limit):
                logging.info(f"Parsing products from {link}")
                product_summaries = parse_products_from_page(driver, link)
                detailed_products = []
                for summary in product_summaries[:limit]:
                    product_link = summary['link']
                    detailed_info = parse_product_page(driver, product_link)
                    summary.update(detailed_info)
                    detailed_products.append(summary)
                product_container["products"] = detailed_products

                for product in detailed_products:
                    if product['name'] not in unique_product_names:
                        unique_product_names.add(product['name'])
                        categories_entry = ','.join([temp_cat['name'] for temp_cat in product["categories"]])
                        images = ["http://localhost/" + img_path for img_path in product["images_path"]]
                        product_writer.writerow(
                            [product["id"],
                             product["active"],
                             product["name"],
                             categories_entry,  # categories
                             product["price_brutto"],  # Price tax excluded
                             1,  # "Tax rules ID"
                             random.randint(0, 10),  # "Quantity",
                             product["short_description"],  # "Summary"
                             product["text_description"],  # "Description"
                             1,  # Show price (0 = No, 1 = Yes)
                             ", ".join(images),  # Image URLs (x,y,z...)
                             1,  # Usuń istniejące zdjęcia (0 = Nie, 1 = Tak)
                             product["is_new"], #is_new
                             product["price_reduction"] #discount percent
                             ]
                        )

            for category in product_categories_data:
                categories_writer.writerow(
                    [category["id"], category["active"], category["name"], category["parent"], category["is_root"]])
                for subcategory in category["subcategories"]:
                    categories_writer.writerow(
                        [subcategory["id"], subcategory["active"], subcategory["name"], subcategory["parent"],
                         subcategory["is_root"]]
                    )
                    if "groups" in subcategory and subcategory["groups"]:
                        for group in subcategory["groups"]:
                            categories_writer.writerow(
                                [group["id"], group["active"], group["name"], group["parent"], group["is_root"]]
                            )
                            process_and_write_products(group, group["link"], limit_of_products_in_group)
                    elif "products" in subcategory:
                        process_and_write_products(subcategory, subcategory["link"], limit_of_products_in_group)

    return product_categories_data


def parse_products_from_page(driver: uc.Chrome, url: str) -> List[Dict]:
    logging.info(f"Parsing group page {url}")
    driver.get(url)
    human_wait(1, 0.2)
    products_on_page = []

    try:
        product_elements = driver.find_elements(By.CSS_SELECTOR, "article.product-miniature")
        num_products = len(product_elements)
        logging.info(f"Found {num_products} products on the page.")

        for product_element in product_elements:
            try:
                name_element = product_element.find_element(By.CSS_SELECTOR, "h2.product-title a")
                product_name = name_element.get_attribute('textContent').strip()
                product_link = name_element.get_attribute('href')

                product_short_description = ""
                try:
                    product_short_description = product_element.find_element(By.CLASS_NAME,
                                                                             "pro_desc_short").get_attribute(
                        'textContent').strip()
                except NoSuchElementException:
                    logging.warning(f"Short description not found for product: {product_name}")


                flags_elements = product_element.find_elements(By.CLASS_NAME,'new');

                product_data = {
                    "name": str(product_name),
                    "link": str(product_link),
                    "is_new": 1 if  len(flags_elements) > 0 else 0,
                    "short_description": str(product_short_description)
                }
                products_on_page.append(product_data)
            except StaleElementReferenceException:
                logging.warning(f"Stale element encountered for a product on page {url}. Re-finding elements.")
                continue
            except Exception as e:
                logging.error(f"Error parsing a single product miniature on page {driver.current_url}: {e}")
    except Exception as e:
        logging.error(f"Could not parse product miniatures from page {url}: {e}")

    logging.info(f"Group page {url} was parsed successfully")
    return products_on_page


BASE_LINK = "https://localhost/"








def test_add_10_products_from_2_categories(driver: uc.Chrome, total_products_to_add: int = 10, num_categories: int = 3) -> None:
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
        logging.error(f"Not enough categories to run the test. Found {len(available_categories)}, need {num_categories}.")
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

    all_product_links = list(set(all_product_links)) # Remove duplicates

    if len(all_product_links) == 0:
        logging.error("No  products found in the selected categories.")
        return

    if len(all_product_links) < total_products_to_add:
        logging.warning(f"Found only {len(all_product_links)} unique  products across selected categories. Will add all of them.")
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
            
            continue_shopping_button = WebDriverWait(driver, 0.5).until(
                EC.element_to_be_clickable((By.XPATH, "//button[contains(., 'Kontynuuj zakupy') or contains(., 'Continue shopping')]"))
            )
            continue_shopping_button.click()
            products_added_count += 1
            logging.info(f"Product added. Total so far: {products_added_count}.")

        except TimeoutException:
            logging.error(f"Failed to add product to cart or continue shopping. Product link: {product_link}")

    logging.info(f"Test finished. Successfully added {products_added_count}/{len(products_to_add_links)} products to cart.")


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
            EC.element_to_be_clickable((By.XPATH, "//button[contains(., 'Kontynuuj zakupy') or contains(., 'Continue shopping')]"))
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


if __name__ == '__main__':
    options = uc.ChromeOptions()
    options.add_argument('--ignore-certificate-errors')
    driver = uc.Chrome(options=options, headless=False, use_subprocess=False)
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

    driver.get(BASE_LINK)
    test_add_10_products_from_2_categories(driver)
    # test_search_and_add_to_cart(driver)
    test_remove_products_from_cart(driver)
    input("Press ENTER to exit.")




