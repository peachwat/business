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


def parse_kawa_category(driver: uc.Chrome) -> List[Dict]:
    logging.info("Attempting to parse the coffee category.")
    all_kawa_products = []

    try:
        kawa_category_element = driver.find_element(By.XPATH, "//a[contains(@class, 'dropdown-item') and @data-depth='0' and contains(normalize-space(), 'Kawa')]")
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


def parse_products_from_page(driver: uc.Chrome, url : str) -> List[Dict]:
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
                    product_short_description = product_element.find_element(By.CLASS_NAME, "pro_desc_short").get_attribute('textContent').strip()
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


def parse_product_page(driver: uc.Chrome, url : str) -> Dict:
    """
    Parses a single product page. This version is more robust and handles
    both tea and coffee product page structures.
    """
    driver.get(url)
    human_wait(0.5, 0.2)
    product_info = {}

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
        product_info['main_image_url'] = driver.find_element(By.CSS_SELECTOR, 'img.js-qv-product-cover').get_attribute('src')
        thumb_elements = driver.find_elements(By.CSS_SELECTOR, 'ul.product-images img')
        product_info['thumbnail_urls'] = [thumb.get_attribute('src') for thumb in thumb_elements]
    except NoSuchElementException:
        product_info['main_image_url'] = ''
        product_info['thumbnail_urls'] = []
        logging.warning(f"Could not parse images for {url}")

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
            product_info['text_description'] = description_div.find_element(By.TAG_NAME, 'p').text.strip()
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

    try:
        kawa_link = "https://czasnaherbate.net/11-kawa"
        driver.get(kawa_link)
        accept_cookies(driver)


        kawa_data = parse_kawa_category(driver)


        output_filename = "kawa_products.json"
        with open(output_filename, "w", encoding="utf-8") as f:
            f.write(json.dumps(kawa_data, indent=2, ensure_ascii=False))
        logging.info(f"Successfully parsed {len(kawa_data)} coffee products and saved to '{output_filename}'")

    finally:
        driver.quit()

