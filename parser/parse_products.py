import random
import logging
import os
import time
import json
import re
from typing import List, Dict

import certifi
import undetected_chromedriver as uc
from selenium.common import TimeoutException, NoSuchElementException, StaleElementReferenceException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import csv


def human_wait(base: float = 3.0, variance: float = 2.0):
    time.sleep(random.uniform(base - variance, base + variance))


def accept_cookies(driver: uc.Chrome):
    try:
        wait = WebDriverWait(driver, 10)
        wait.until(EC.element_to_be_clickable((By.CLASS_NAME, "lgcookieslaw-reject-button"))).click()
    except TimeoutException as e:
        logging.error("Timeout while waiting for cookies to become available")
    except NoSuchElementException as e2:
        logging.error("NoSuchElementException while waiting for cookies to become available")


ID_OFFSET = 2


def parse(driver: uc.Chrome, limit_of_categories: int = None, limit_of_subcategories: int = None,
          limit_of_groups: int = None) -> List[Dict]:
    product_categories_data = []
    top_category_elements = driver.find_elements(By.XPATH, "//a[contains(@class, 'dropdown-item') and @data-depth='0']")

    for id, top_category_element in enumerate(top_category_elements[:limit_of_categories]):
        top_category_data = {
            "id": None,
            "name": top_category_element.get_attribute('textContent').strip(),
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
                "groups": []
            }

            group_elements = subcategory_element.find_elements(By.XPATH,
                                                               "following-sibling::div//a[contains(@class, 'dropdown-item') and @data-depth='2']")
            for group_element in group_elements[:limit_of_groups]:
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
            top_category_data["subcategories"].append(subcategory_data)
        product_categories_data.append(top_category_data)

    categories_csv_headers = ["Category ID", "Active (0/1)", "Name *", "Parent category", "Root category (0/1)",
                              "Description", "Meta title", "Meta keywords", "Meta description", "URL rewritten",
                              "Image URL"]

    full_products_csv_headers = ["Product ID", "Active (0/1)", "Name *", "Categories (x,y,z...)", "Price tax excluded",
                            "Tax rules ID", "Wholesale price", "On sale (0/1)", "Discount amount", "Discount percent",
                            "Discount from (yyyy-mm-dd)", "Discount to (yyyy-mm-dd)", "Reference #",
                            "Supplier reference #", "Supplier", "Manufacturer", "EAN13", "UPC", "Ecotax", "Width",
                            "Height", "Depth", "Weight", "Delivery time of in-stock products",
                            "Delivery time of out-of-stock products with allowed orders", "Quantity",
                            "Minimal quantity", "Low stock level",
                            "Send me an email when the quantity is under this level", "Visibility",
                            "Additional shipping cost", "Unity", "Unit price", "Summary", "Description",
                            "Tags (x,y,z...)", "Meta title", "Meta keywords", "Meta description", "URL rewritten",
                            "Text when in stock", "Text when backorder allowed",
                            "Available for order (0 = No, 1 = Yes)", "Product available date", "Product creation date",
                            "Show price (0 = No, 1 = Yes)", "Image URLs (x,y,z...)", "Image alt texts (x,y,z...)",
                            "Delete existing images (0 = No, 1 = Yes)", "Feature(Name:Value:Position)",
                            "Available online only (0 = No, 1 = Yes)", "Condition", "Customizable (0 = No, 1 = Yes)",
                            "Uploadable files (0 = No, 1 = Yes)", "Text fields (0 = No, 1 = Yes)",
                            "Out of stock action", "Virtual product", "File URL", "Number of allowed downloads",
                            "Expiration date", "Number of days", "ID / Name of shop", "Advanced stock management",
                            "Depends On Stock", "Warehouse", "Acessories  (x,y,z...)"]

    products_csv_headers = ["Product ID", "Active (0/1)", "Name *", "Categories (x,y,z...)", "Price tax excluded",
                            "Tax rules ID",  "Quantity", "Summary", "Description",
                            "Show price (0 = No, 1 = Yes)", "Image URLs (x,y,z...)", "Usuń istniejące zdjęcia (0 = Nie, 1 = Tak)"]

    unique_product_names = set()
    with open("categories.csv", "w+", newline='') as categories_csv:
        with open("products.csv", "w+", newline='') as products_csv:
            product_writer = csv.writer(products_csv, delimiter=';')
            categories_writer = csv.writer(categories_csv, delimiter=';')
            categories_writer.writerow(categories_csv_headers)
            product_writer.writerow(products_csv_headers)
            for category in product_categories_data:
                categories_writer.writerow(
                    [category["id"], category["active"], category["name"], category["parent"], category["is_root"]])
                for subcategory in category["subcategories"]:
                    categories_writer.writerow(
                        [subcategory["id"], subcategory["active"], subcategory["name"], subcategory["parent"],
                         subcategory["is_root"]]
                    )
                    for group in subcategory["groups"]:
                        categories_writer.writerow(
                            [group["id"], group["active"], group["name"], group["parent"], group["is_root"]]
                        )
                        link = group["link"]
                        logging.info(f"Parsing products in group {link}")
                        product_summaries = parse_products_from_page(driver, link)
                        detailed_products = []
                        for summary in product_summaries[:4]: #TODO: Disable limit
                            product_link = summary['link']
                            detailed_info = parse_product_page(driver, product_link)
                            summary.update(detailed_info)
                            detailed_products.append(summary)
                        group["products"] = detailed_products
                        for product in detailed_products:
                            if product['name'] not in unique_product_names:
                                unique_product_names.add(product['name'])
                                categories_entry = ','.join([temp_cat['name'] for temp_cat in product["categories"]])
                                images = ["http://localhost/" + img_path for img_path in product["images_path"]]
                                product_writer.writerow(
                                    [product["id"],
                                     product["active"],
                                     product["name"],
                                     categories_entry, # categories
                                     product["price_netto"], # Price tax excluded
                                     1, #"Tax rules ID"
                                     random.randint(1, 100),# "Quantity",
                                     product["short_description"], #"Summary"
                                     product["text_description"], # "Description"
                                     1, # Show price (0 = No, 1 = Yes)
                                     ", ".join(images),  # Image URLs (x,y,z...)
                                     1, # Usuń istniejące zdjęcia (0 = Nie, 1 = Tak)
                                     ]
                                )


    return product_categories_data


def parse_kawa_category(driver: uc.Chrome) -> List[Dict]:
    logging.info("Attempting to parse the coffee category.")
    all_kawa_products = []

    try:
        kawa_category_element = driver.find_element(By.XPATH,
                                                    "//a[contains(@class, 'dropdown-item') and @data-depth='0' and contains(normalize-space(), 'Kawa')]")
        kawa_category_link = kawa_category_element.get_attribute('href')
        logging.info(f"Found 'Kawa' category link: {kawa_category_link}")

        product_summaries = parse_products_from_page(driver, kawa_category_link)

        detailed_products = []
        for summary in product_summaries:
            product_link = summary['link']
            logging.info(f"Parsing product details for: {product_link}")
            detailed_info = parse_product_page(driver, product_link)
            summary.update(detailed_info)
            detailed_products.append(summary)

        all_kawa_products = detailed_products

    except NoSuchElementException:
        logging.error("Could not find the 'Kawa' category link on the main page.")
    except Exception as e:
        logging.error(f"An error occurred during 'Kawa' category parsing: {e}")

    return all_kawa_products


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

                product_data = {
                    "name": str(product_name),
                    "link": str(product_link),
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


from urllib.parse import urlparse
from utils import sanitize_filename, download_image


def parse_product_page(driver: uc.Chrome, url: str) -> Dict:
    """
    Parses a single product page. This version is more robust and handles
    both tea and coffee product page structures.
    """
    driver.get(url)
    human_wait(0.5, 0.2)
    product_info = {}


    product_info['id'] = None
    product_info['active'] = 1
    # Basic Info
    try:
        product_info['name'] = driver.find_element(By.CSS_SELECTOR, 'h1[itemprop="name"]').text
    except NoSuchElementException:
        product_info['name'] = ''
        logging.warning(f"Could not parse product name for {url}")

    try:
        price_element = driver.find_element(By.CLASS_NAME, 'current-price')
        product_info['price_netto'] = price_element.find_element(By.TAG_NAME, 'span').get_attribute("content")
        product_info['price_brutto'] = round((float(product_info['price_netto']) * 1.23), 2)
    except (NoSuchElementException, ValueError):
        product_info['price_brutto'] = None
        product_info['price_netto'] = None
        logging.warning(f"Could not parse product price for {url}")

    # Main Image and Thumbnails

    try:
        images_objects = driver.find_elements(By.CSS_SELECTOR, "img.js-thumb")
        product_info['images'] = [img.get_attribute("data-image-large-src") for img in images_objects]

        # product_info['main_image_url'] = driver.find_element(By.CSS_SELECTOR, 'img.js-qv-product-cover').get_attribute(
        #     'src').replace("home_default", "large_default").replace("webp", "jpg")
        # thumb_elements = driver.find_elements(By.CSS_SELECTOR, 'ul.product-images img')
        #
        # for thumb in thumb_elements:
        #     temp = thumb.get_attribute('src').replace("home_default", "large_default").replace("webp", "jpg")
        #     if temp not in product_info['thumbnail_urls']:
        #         product_info['thumbnail_urls'].append(temp)

        # product_info['thumbnail_urls'] = [thumb.get_attribute('src').replace("home_default", "large_default").replace("webp", "jpg") for thumb in thumb_elements]

    except NoSuchElementException:
        product_info['main_image_url'] = ''
        product_info['thumbnail_urls'] = []
        logging.warning(f"Could not parse images for {url}")


    # Download images
    product_info["images_path"] = []
    sanitized_product_name = sanitize_filename(product_info.get('name', ''))
    if sanitized_product_name and product_info['images']:
        image_dir = os.path.join('images', 'product_images', sanitized_product_name)
        
        # Download main image


        # try:
        #     main_image_url = product_info['main_image_url']
        #     downloaded_path = download_image(main_image_url, 'main_image', image_dir)
        #     if downloaded_path:
        #         product_info['main_image_path'] = downloaded_path
        # except Exception as e:
        #     logging.error(f"Error downloading main image for {product_info['name']}: {e}")

        # Download thumbnail images
        for i,  url in enumerate(product_info.get('images', [])):
            try:
                downloaded_path = download_image(url.replace("webp", "jpg"), f'img_{i}', image_dir)
                if downloaded_path:
                    product_info['images_path'].append(downloaded_path)
            except Exception as e:
                logging.error(f"Error downloading img {i} for {product_info['name']}: {e}")


    try:
        product_info['code'] = driver.find_element(By.CSS_SELECTOR, 'span[itemprop="sku"]').text
    except NoSuchElementException:
        product_info['code'] = ''
        logging.warning(f"Could not parse SKU for {url}")

    # Robust Description Parsing
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

        # Set a default text description from the first paragraph
        try:
            product_info['text_description'] = description_div.find_element(By.TAG_NAME, 'p').text.strip().replace('\n', ' ')
        except NoSuchElementException:
            pass

        # Find all paragraphs and check for keywords
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

    # Initialize empty variants
    product_info['variants'] = []

    return product_info


BASE_LINK = "https://czasnaherbate.net/"

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

    options = uc.ChromeOptions()
    driver = uc.Chrome(options=options, headless=False, use_subprocess=False)

    driver.get(BASE_LINK)
    accept_cookies(driver)

    try:
        result = parse(driver, limit_of_groups=3, limit_of_subcategories=4, limit_of_categories=4)
        print(json.dumps(result, indent=4))


    finally:
        driver.quit()
