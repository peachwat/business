import random
import logging
import os
import time
import json
from typing import List, Dict
from utils import sanitize_filename, download_image
import undetected_chromedriver as uc
from selenium.common import TimeoutException, NoSuchElementException, StaleElementReferenceException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import csv


def human_wait(base: float = 3.0, variance: float = 2.0):
    """Sleep func with variance to imitate the human behaviour"""
    time.sleep(random.uniform(base - variance, base + variance))


def accept_cookies(driver: uc.Chrome):
    """Accepts cookies on czasnaherbate page (should be used one time, after first usage)"""
    try:
        wait = WebDriverWait(driver, 10)
        wait.until(EC.element_to_be_clickable((By.CLASS_NAME, "lgcookieslaw-reject-button"))).click()
    except TimeoutException as e:
        logging.error("Timeout while waiting for cookies to become available")
    except NoSuchElementException as e2:
        logging.error("NoSuchElementException while waiting for cookies to become available")


def parse(driver: uc.Chrome, limit_of_categories: int = None, limit_of_subcategories: int = None,
          limit_of_groups: int = None, limit_of_products_in_group: int = None) -> List[Dict]:
    product_categories_data = []
    top_category_elements = driver.find_elements(By.XPATH, "//a[contains(@class, 'dropdown-item') and @data-depth='0']")

    # workaround to not parse premium products with different layout and styling
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
                # Simple retry logic by breaking and letting an outer loop (if any) handle it, or just skipping.
                continue
            except Exception as e:
                logging.error(f"Error parsing a single product miniature on page {driver.current_url}: {e}")
    except Exception as e:
        logging.error(f"Could not parse product miniatures from page {url}: {e}")

    logging.info(f"Group page {url} was parsed successfully")
    return products_on_page


def parse_product_page(driver: uc.Chrome, url: str) -> Dict:
    """
    Parses a single product page
    """
    driver.get(url)
    human_wait(0.5, 0.2)
    product_info = {}

    product_info['id'] = None
    product_info['active'] = 1

    try:
        product_info['name'] = driver.find_element(By.CSS_SELECTOR, 'h1[itemprop="name"]').text
    except NoSuchElementException:
        product_info['name'] = ''
        logging.warning(f"Could not parse product name for {url}")

    try:
        price_element = driver.find_element(By.CLASS_NAME, 'current-price')
        product_info['price_netto'] = price_element.find_element(By.TAG_NAME, 'span').get_attribute("content")
        product_info['price_brutto'] = round((float(product_info['price_netto']) / 0.8130081301), 2)
    except (NoSuchElementException, ValueError):
        product_info['price_brutto'] = None
        product_info['price_netto'] = None
        logging.warning(f"Could not parse product price for {url}")

    try:
        price_reduction = driver.find_element(By.CLASS_NAME, 'price-reduction').get_attribute('innerHTML').replace('–','').replace('%',"").strip()
        product_info['price_reduction'] = price_reduction
        print(f"Found discount for {url}: {price_reduction}")
    except (NoSuchElementException, ValueError):
        product_info['price_reduction'] = 0

    try:
        images_objects = driver.find_elements(By.CSS_SELECTOR, "img.js-thumb")
        product_info['images'] = [img.get_attribute("data-image-large-src") for img in images_objects]
    except NoSuchElementException:
        product_info['main_image_url'] = ''
        product_info['thumbnail_urls'] = []
        logging.warning(f"Could not parse images for {url}")

    product_info["images_path"] = []
    sanitized_product_name = sanitize_filename(product_info.get('name', ''))
    if sanitized_product_name and product_info['images']:
        image_dir = os.path.join('images', 'product_images', sanitized_product_name)
        for i, image_url in enumerate(product_info.get('images', [])):
            try:
                downloaded_path = download_image(image_url.replace("webp", "jpg"), f'img_{i}', image_dir)
                if downloaded_path:
                    product_info['images_path'].append(downloaded_path)
            except Exception as e:
                logging.error(f"Error downloading img {i} for {product_info['name']}: {e}")

    try:
        product_info['code'] = driver.find_element(By.CSS_SELECTOR, 'span[itemprop="sku"]').text
    except NoSuchElementException:
        product_info['code'] = ''
        logging.warning(f"Could not parse SKU for {url}")

    product_info.update({
        'full_description_html': '',
        'text_description': '',
        'ingredients': '',
        'country': '',
        'flavor_profile': '',
        'acidity': '',
        'processing_method': ''
    })
    try:
        description_div = driver.find_element(By.CSS_SELECTOR, 'div.product-description')
        product_info['full_description_html'] = description_div.get_attribute('innerHTML').strip()

        try:
            product_info['text_description'] = description_div.find_element(By.TAG_NAME, 'p').text.strip().replace('\n',
                                                                                                                   ' ')
        except NoSuchElementException:
            pass

        description_paragraphs = description_div.find_elements(By.TAG_NAME, 'p')
        for p in description_paragraphs:
            p_text = p.text
            if "Składniki:" in p_text:
                product_info['ingredients'] = p_text.replace("Składniki:", "").strip()
            elif "Kraj pochodzenia:" in p_text:
                product_info['country'] = p_text.replace("Kraj pochodzenia:", "").strip()
            elif "Profil smakowy:" in p_text:
                product_info['flavor_profile'] = p_text.replace("Profil smakowy:", "").strip()
            elif "Kwasowość:" in p_text:
                product_info['acidity'] = p_text.replace("Kwasowość:", "").strip()
            elif "Metoda obróbki:" in p_text:
                product_info['processing_method'] = p_text.replace("Metoda obróbki:", "").strip()

    except NoSuchElementException:
        logging.warning(f"Could not find product description section for {url}")

    product_info['reviews'] = []
    try:
        script_tag = WebDriverWait(driver, 3).until(
            EC.presence_of_element_located((By.XPATH, '//script[@type="application/ld+json"]'))
        )
        json_text = script_tag.get_attribute('textContent')
        data = json.loads(json_text)
        if 'review' in data:
            for review in data['review']:
                product_info['reviews'].append({
                    'author': review.get('author', {}).get('name'),
                    'date': review.get('datePublished'),
                    'body': review.get('reviewBody'),
                    'rating': review.get('reviewRating', {}).get('ratingValue'),
                    'language': review.get('inLanguage')
                })
    except (TimeoutException, json.JSONDecodeError, NoSuchElementException):
        logging.warning(f"Could not parse reviews for {url}")

    product_info['categories'] = []
    try:
        categories_div = driver.find_element(By.CLASS_NAME, 'productcats')
        category_elements = categories_div.find_elements(By.TAG_NAME, 'a')
        for el in category_elements:
            product_info['categories'].append({
                'name': el.get_attribute('title'),
                'url': el.get_attribute('href')
            })
    except NoSuchElementException:
        logging.warning(f"Could not parse categories section for {url}")

    product_info['variants'] = []

    return product_info


BASE_LINK = "https://czasnaherbate.net/"

if __name__ == "__main__":
    import argparse
    from utils import load_categories, load_products, clean_resource, get_from_api

    parser = argparse.ArgumentParser(description="Parser for czasnaherbate.net")
    parser.add_argument('command', choices=['parse', 'load_categories', 'load_products', 'clean_db', 'view'], help="Command to execute")
    parser.add_argument('--resource', choices=['products', 'categories'], help="Resource to view")
    parser.add_argument('--clean', action='store_true', help="Clean the database before loading data")
    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

    if args.command == 'parse':
        options = uc.ChromeOptions()
        driver = uc.Chrome(options=options, headless=False, use_subprocess=False)
        driver.get(BASE_LINK)
        accept_cookies(driver)
        try:
            result = parse(driver)
            with open('products.json', "w+") as f:
                f.write(json.dumps(result, indent=4))

        finally:
            driver.quit()

    elif args.command == 'load_categories':
        load_categories(args.clean)

    elif args.command == 'load_products':
        clean_resource('products')
        print("Products cleaned")
        load_products(args.clean)

    elif args.command == 'clean_db':
        print("Cleaning the database...")
        print("-"*30)
        print("Cleaning categories...")
        clean_resource('categories')
        print("Categories cleaned")
        print(f"Viewing categories...")
        data = get_from_api('categories')
        if data:
            print(data)


        print("-" * 30)
        print("Cleaning products...")
        clean_resource('products')
        print("Products cleaned")
        print(f"Viewing products...")
        data = get_from_api('products')
        if data:
            print(data)
        print("Database cleaning complete")

    elif args.command == 'view':
        if args.resource:
            print(f"Viewing {args.resource}...")
            data = get_from_api(args.resource)
            if data:
                print(data)
        else:
            print("Please specify a resource to view with --resource [products|categories]")
