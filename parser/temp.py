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





def parse_products_from_page(driver: uc.Chrome, url: str) -> List[Dict]:
    logging.info(f"Parsing group page {url}")
    driver.get(url)
    human_wait(1, 0.2)
    products_on_page = []

    num_products = len(driver.find_elements(By.CSS_SELECTOR, "article.product-miniature"))

    for i in range(num_products):
        try:
            product_element = driver.find_elements(By.CSS_SELECTOR, "article.product-miniature")[i]
            name_element = product_element.find_element(By.CSS_SELECTOR, "h2.product-title a")
            product_name = name_element.get_attribute('textContent').strip()
            product_link = name_element.get_attribute('href')
            product_short_description = product_element.find_element(By.CLASS_NAME, "pro_desc_short").get_attribute(
                'textContent').strip()

            product_data = {
                "name": str(product_name),
                "link": str(product_link),
                "short_description": str(product_short_description)
            }
            products_on_page.append(product_data)
        except StaleElementReferenceException:
            logging.warning(f"Stale element in parse_products_from_page on url {url} at index {i}. Skipping product.")
            continue
        except Exception as e:
            logging.error(f"Error parsing a product on page {driver.current_url}: {e}")

    logging.info(f"Group page {url} was parsed successfully")
    return products_on_page


def parse_product_page(driver: uc.Chrome, url: str) -> Dict:
    driver.get(url)
    human_wait(0.5, 0.2)

    product_info = {}

    try:
        product_info['name'] = driver.find_element(By.CSS_SELECTOR, 'h1[itemprop="name"]').text
    except Exception as e:
        logging.warning(f"Could not parse product name: {e}")
        product_info['name'] = ''

    # Price
    try:
        price_element = driver.find_element(By.CLASS_NAME, 'current-price')
        product_info['price_netto'] = price_element.find_element(By.TAG_NAME, 'span').get_attribute("content")
        product_info['price_brutto'] = round((float(product_info['price_netto']) * 1.23), 2)
    except Exception as e:
        logging.warning(f"Could not parse product price {e}")
        product_info['price'] = ''
        product_info['price_brutto'] = None
        product_info['price_netto'] = None

    # Full Description
    try:
        product_info['full_description_html'] = driver.find_element(By.CSS_SELECTOR,
                                                                    'div.product-description').get_attribute(
            'innerHTML').strip()
    except Exception as e:
        logging.warning(f"Could not parse full description: {e}")
        product_info['full_description'] = ''

    # Text Description (user's new field)
    try:
        product_info['text_description'] = driver.find_element(By.CSS_SELECTOR,
                                                               'div.product-description:nth-child(1)>p:nth-child(1)').text.strip()
    except Exception as e:
        logging.warning(f"Could not parse text description: {e}")
        product_info['text_description'] = ''

    # Ingredients (user's new field)
    try:
        product_info['ingredients'] = driver.find_element(By.CSS_SELECTOR,
                                                          'div.product-description:nth-child(1)>p:nth-child(2)').text.replace(
            "Składniki:", '').strip()
    except Exception as e:
        logging.warning(f"Could not parse ingredients: {e}")
        product_info['ingredients'] = ''

    try:
        product_info['country'] = driver.find_element(By.CSS_SELECTOR,
                                                      'div.product-description:nth-child(1)>p:nth-child(3)').text.replace(
            "Krajpochodzenia:", '').strip()
    except Exception as e:
        logging.warning(f"Could not parse country of origin: {e}")
        product_info['country'] = ''

    # SKU/Code
    try:
        product_info['code'] = driver.find_element(By.CSS_SELECTOR, 'span[itemprop="sku"]').text
    except Exception as e:
        logging.warning(f"Could not parse product code/SKU: {e}")
        product_info['code'] = ''

    # Main Image
    try:
        main_image = driver.find_element(By.CSS_SELECTOR, 'img.js-qv-product-cover')
        product_info['main_image_url'] = main_image.get_attribute('src')
    except Exception as e:
        logging.warning(f"Could not parse main image URL: {e}")
        product_info['main_image_url'] = ''

    # Thumbnail Images
    try:
        thumb_elements = driver.find_elements(By.CSS_SELECTOR, 'ul.product-images img')
        product_info['thumbnail_urls'] = [thumb.get_attribute('src') for thumb in thumb_elements]
    except Exception as e:
        logging.warning(f"Could not parse thumbnail URLs: {e}")
        product_info['thumbnail_urls'] = []

    product_info['variants'] = []

    try:
        rating_element = driver.find_element(By.CLASS_NAME, 'hydra-grade__reviews')
        product_info['rating'] = rating_element.find_element(By.CLASS_NAME, 'hydra-grade__value').text
        product_info['rating_count'] = rating_element.find_element(By.CLASS_NAME,
                                                                   'hydra-grade__reviews-count').get_attribute(
            'data-reviews')
    except Exception as e:
        logging.warning(f"Could not parse product rating of {url}")
        product_info['rating'] = None

    product_info['reviews'] = []
    try:
        wait = WebDriverWait(driver, 3)
        script_tag = wait.until(
            EC.presence_of_element_located((By.XPATH, '//script[@type="application/ld+json"]'))
        )

        json_text = script_tag.get_attribute('textContent')
        data = json.loads(json_text)

        if 'review' in data:
            for review in data['review']:
                review_info = {
                    'author': review.get('author', {}).get('name'),
                    'date': review.get('datePublished'),
                    'body': review.get('reviewBody'),
                    'rating': review.get('reviewRating', {}).get('ratingValue'),
                    'language': review.get('inLanguage')
                }
                product_info['reviews'].append(review_info)
    except Exception as e:
        logging.warning(f"Could not parse reviews section: {e}")
        product_info['reviews'] = []

    product_info['categories'] = []
    try:
        categories_div = driver.find_element(By.CLASS_NAME, 'productcats')
        cateroies = categories_div.find_elements(By.TAG_NAME, 'a')
        for cateroy in cateroies:
            product_info['categories'].append({
                'name': cateroy.get_attribute('title'),
                'url': cateroy.get_attribute('href')
            })


    except Exception as e:
        logging.warning(f"Could not parse categories section: {e}")

    return product_info


PRODUCT_EXAMPLE_LINK = "https://czasnaherbate.net/herbata-czarna/933-assam-dikom-stgfopi.html"


def parse_categories(driver: uc.Chrome, category_urls: List[str]):
    all_products = []
    for category_url in category_urls:
        logging.info(f"Navigating to category page: {category_url}")
        driver.get(category_url)
        logging.info("Parsing products from page...")
        products = parse_products_from_page(driver)

        for index, product in enumerate(products):
            products[index].update(parse_product_page(driver, product["link"]))

        all_products.extend(products)

    print("\n--- Parsed Products ---")
    print(json.dumps(all_products, indent=2, ensure_ascii=False))
    with open("multiple_categories_products.json", "w+", encoding="utf-8") as f:
        f.write(json.dumps(all_products, indent=2, ensure_ascii=False))


BASE_LINK = "https://czasnaherbate.net/"

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

    options = uc.ChromeOptions()
    driver = uc.Chrome(options=options, headless=False, use_subprocess=False)
    driver.get(BASE_LINK)
    accept_cookies(driver)

    data = parse_all_products(driver, limit_of_categories=2, limit_of_subcategories=2, limit_of_groups=2)
    with open("result.json", "w+", encoding="utf-8") as f:
        f.write(json.dumps(data, indent=2, ensure_ascii=False))

    driver.quit()