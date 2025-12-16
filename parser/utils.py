import random
import re
import os
import requests
import urllib3
import io
from PIL import Image
import csv
import xml.etree.ElementTree as ET

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
API_KEY = "UCNMIE1UWX9IZSRCTCJAQWSBAEXCYGGD"
BASE_URL = "https://localhost/api"


def sanitize_filename(filename: str) -> str:
    """
    Sanitizes a string to be used as a valid filename.
    Removes or replaces characters that are not allowed in most filesystems.
    """
    if not filename:
        return "_unknown_"
    filename = re.sub(r'[\\/]', '_', filename)
    filename = re.sub(r'[^a-zA-Z0-9\._-]', '', filename)
    return filename[:100].lower()


def download_image(image_url: str, base_filename: str, directory: str):
    """
    Downloads an image from a URL, processes it with Pillow, and saves it
    to a specified directory always as JPEG.
    """
    try:
        response = requests.get(image_url, stream=True, verify=False)
        response.raise_for_status()

        image_data = io.BytesIO(response.content)
        img = Image.open(image_data)

        if img.mode != 'RGB':
            img = img.convert('RGB')

        full_save_path = os.path.join(directory, f"{base_filename}.jpg")

        os.makedirs(directory, exist_ok=True)
        img.save(full_save_path, format='JPEG')
        return full_save_path
    except requests.exceptions.RequestException as e:
        print(f"Error downloading {image_url}: {e}")
    except IOError as e:
        print(f"Error processing or saving image to {full_save_path}: {e}")
    return None


def read_csv_to_dicts(file_path):
    """Reads a CSV file and returns a list of dictionaries."""
    with open(file_path, 'r', newline='') as csvfile:
        reader = csv.DictReader(csvfile, delimiter=';')
        return list(reader)


def get_blank_schema(resource):
    """Gets a blank schema for a given resource."""
    url = f"{BASE_URL}/{resource}?schema=blank"
    try:
        response = requests.get(url, auth=(API_KEY, ''), verify=False)
        response.raise_for_status()
        return response.text
    except requests.exceptions.RequestException as e:
        print(f"Error getting blank schema for {resource}: {e}")
        return None


def send_to_api(resource, data, method='POST'):
    """Sends data to the API for a given resource."""
    url = f"{BASE_URL}/{resource}"
    headers = {"Content-Type": "text/xml"}
    try:
        if method == 'POST':
            response = requests.post(url, data=data.encode('utf-8'), auth=(API_KEY, ''), headers=headers, verify=False)
        elif method == 'PUT':
            response = requests.put(url, data=data.encode('utf-8'), auth=(API_KEY, ''), headers=headers, verify=False)
        else:
            raise ValueError(f"Unsupported method: {method}")

        response.raise_for_status()
        print(f"Successfully sent data to {resource}. Status code: {response.status_code}")
        return response
    except requests.exceptions.RequestException as e:
        print(f"Error sending data to {resource}: {e}")
        if e.response is not None:
            print(f"Response content: {e.response.content.decode()}")
        return None


def get_from_api(resource, resource_id=None):
    """Gets data from the API for a given resource, optionally with a specific ID."""
    url = f"{BASE_URL}/{resource}"
    if resource_id:
        url = f"{url}/{resource_id}"
    try:
        response = requests.get(url, auth=(API_KEY, ''), verify=False)
        response.raise_for_status()
        return response.text
    except requests.exceptions.RequestException as e:
        print(f"Error getting data from {resource}: {e}")
        return None


def delete_from_api(resource, resource_id):
    """Deletes a resource from the API by its ID."""
    url = f"{BASE_URL}/{resource}/{resource_id}"
    try:
        response = requests.delete(url, auth=(API_KEY, ''), verify=False)
        response.raise_for_status()
        print(f"Successfully deleted {resource} with ID {resource_id}. Status code: {response.status_code}")
        return response
    except requests.exceptions.RequestException as e:
        print(f"Error deleting {resource} with ID {resource_id}: {e}")
        return None


def clean_resource(resource):
    """Deletes all items of a given resource."""
    response_xml = get_from_api(resource)
    if response_xml:
        root = ET.fromstring(response_xml)
        
        # The resource tag is the plural form of the resource name, e.g., <products> or <categories>
        resource_tag = resource
        
        # Find all direct children of the main resource tag
        ids = [elem.get('id') for elem in root.find(resource_tag)]
        
        if resource == 'categories':
            # For categories, delete in reverse order to handle dependencies
            ids.sort(key=int, reverse=True)
            
        for resource_id in ids:
            # Skip deleting the root and home categories for PrestaShop
            if resource == 'categories' and resource_id in ['1', '2']:
                continue
            delete_from_api(resource, resource_id)


def load_categories(clean=False):
    """Loads categories from CSV to the API."""
    if clean:
        clean_resource('categories')

    categories_data = read_csv_to_dicts('categories.csv')
    schema = get_blank_schema('categories')
    if not schema:
        return

    # Create a mapping of parent names to their API IDs
    # The root category 'Home' is assumed to have ID 2 in PrestaShop
    parent_map = {'Home': '2'}

    for category in categories_data:
        root = ET.fromstring(schema)
        name_elem = root.find('.//name/language')
        name_elem.text = category['Name *']

        link_rewrite_elem = root.find('.//link_rewrite/language')
        link_rewrite_elem.text = sanitize_filename(category['Name *'])

        active_elem = root.find('.//active')
        active_elem.text = category['Active (0/1)']

        parent_name = category['Parent category']
        id_parent_elem = root.find('.//id_parent')
        if parent_name in parent_map:
            id_parent_elem.text = parent_map[parent_name]
        else:
            # If parent not in map, try to find it in the API
            # This is a simple approach, a more robust solution would be to order categories by depth
            # and ensure parents are created before children.
            print(f"Parent category '{parent_name}' not found in the current mapping. Defaulting to root.")
            id_parent_elem.text = '2'


        is_root_elem = root.find('.//is_root_category')
        is_root_elem.text = category['Root category (0/1)']

        xml_payload = ET.tostring(root, encoding='unicode')
        response = send_to_api('categories', xml_payload)

        # After successfully creating a category, add its name and new ID to the parent_map
        if response and response.status_code == 201:
            new_category_xml = ET.fromstring(response.text)
            new_id = new_category_xml.find('.//category/id').text
            parent_map[category['Name *']] = new_id
            print(f"Created category '{category['Name *']}' with ID {new_id}")

def get_stock_available_id(product_id):
    """Gets the stock available ID for a given product ID."""
    url = f"{BASE_URL}/stock_availables?filter[id_product]={product_id}&display=full"
    try:
        response = requests.get(url, auth=(API_KEY, ''), verify=False)
        response.raise_for_status()
        root = ET.fromstring(response.text)
        stock_id = root.find('.//stock_available/id')
        if stock_id is not None:
            return stock_id.text
        return None
    except requests.exceptions.RequestException as e:
        print(f"Error getting stock available ID for product {product_id}: {e}")
        return None

def update_stock_for_product(product_id, quantity):
    """Updates the stock for a given product."""
    stock_id = get_stock_available_id(product_id)
    if not stock_id:
        print(f"Could not find stock_available for product {product_id}")
        return

    # Get the schema for stock_availables
    schema_xml = get_from_api('stock_availables', resource_id=stock_id)
    if not schema_xml:
        return
        
    root = ET.fromstring(schema_xml)
    
    # Find and update the quantity field
    quantity_elem = root.find('.//quantity')
    if quantity_elem is not None:
        quantity_elem.text = str(quantity)
    
    # Find and update the id_product field
    id_product_elem = root.find('.//id_product')
    if id_product_elem is not None:
        id_product_elem.text = str(product_id)

    xml_payload = ET.tostring(root, encoding='unicode')
    send_to_api(f'stock_availables', xml_payload, method='PUT')


def add_image_to_product(product_id, image_path):
    """
    Adds an image to a product.
    """
    url = f"{BASE_URL}/images/products/{product_id}"
    try:
        with open(image_path, 'rb') as f:
            files = {'image': (os.path.basename(image_path), f, 'image/jpeg')}
            response = requests.post(url, auth=(API_KEY, ''), files=files, verify=False)
            response.raise_for_status()
            print(f"Successfully added image to product {product_id}. Status code: {response.status_code}")
            return response
    except requests.exceptions.RequestException as e:
        print(f"Error adding image to product {product_id}: {e}")
        if e.response is not None:
            print(f"Response content: {e.response.content.decode()}")
        return None
    except FileNotFoundError:
        print(f"Error: Image file not found at {image_path}")
        return None


def add_discount_to_product(product_id, discount_percent):
    """Adds a discount to a product."""
    schema = get_blank_schema('specific_prices')
    if not schema:
        return

    root = ET.fromstring(schema)
    root.find('.//id_product').text = str(product_id)
    root.find('.//id_cart').text = '0'
    root.find('.//id_shop').text = '1'
    root.find('.//id_currency').text = '0'
    root.find('.//id_country').text = '0'
    root.find('.//id_group').text = '0'
    root.find('.//id_customer').text = '0'
    root.find('.//price').text = '-1'
    root.find('.//from_quantity').text = '1'
    root.find('.//reduction').text = str(float(discount_percent) / 100)
    root.find('.//reduction_tax').text = '1'
    root.find('.//reduction_type').text = 'percentage'
    root.find('.//from').text = '0000-00-00 00:00:00'
    root.find('.//to').text = '0000-00-00 00:00:00'

    xml_payload = ET.tostring(root, encoding='unicode')
    send_to_api('specific_prices', xml_payload)


def load_products(clean=False):
    """Loads products from CSV to the API."""
    if clean:
        clean_resource('products')
        clean_resource('stock_availables')
        clean_resource('specific_prices')

    products_data = read_csv_to_dicts('products.csv')
    with open('product_template_local.xml', 'r') as f:
        schema = f.read()
    
    if not schema:
        return

    # Get category mapping from the API
    print("Getting categories")
    categories_xml = get_from_api('categories')
    category_map = {}
    if categories_xml:
        root = ET.fromstring(categories_xml)
        for cat in root.findall('.//category'):
            cat_id = cat.get('id')
            if cat_id in ['1', '2']: # Skip root and home categories
                continue
            
            category_details_xml = get_from_api('categories', cat_id)
            if category_details_xml:
                cat_root = ET.fromstring(category_details_xml)
                cat_name_elem = cat_root.find('.//name/language')
                if cat_name_elem is not None:
                    cat_name = cat_name_elem.text
                    category_map[cat_name] = cat_id

    for i, product in enumerate(products_data):
        print(f"Processing product {i+1}/{len(products_data)}: {product.get('Name *', 'N/A')}")
        root = ET.fromstring(schema)

        # Set product fields
        try:
            price = float(product.get('Price tax excluded', 0))
            if price <= 0:
                print(f"  [!] Skipping product with invalid price: {price}")
                continue
        except (ValueError, TypeError):
            print(f"  [!] Skipping product with invalid price: {product.get('Price tax excluded', 'N/A')}")
            continue

        root.find('.//name/language').text = product.get('Name *')
        root.find('.//link_rewrite/language').text = sanitize_filename(product.get('Name *'))
        root.find('.//price').text = str(price)
        root.find('.//active').text = product.get('Active (0/1)', '0')
        root.find('.//description_short/language').text = product.get('Summary', '')
        root.find('.//available_for_order').text = '1'
        root.find('.//description/language').text = product.get('Description', '')

        discount = int(product.get('discount_percent', 0))
        if discount > 0:
            root.find('.//on_sale').text = '0'

        root.find('.//new').text =  str(product.get('is_new', 0))
        root.find('.//weight').text = '0.005'


        category_names = [cat.strip() for cat in product.get('Categories (x,y,z...)', '').split(',')]
        if category_names:
            default_category_name = category_names[0]
            default_category_id = category_map.get(default_category_name, '2') # Default to 'Home'
            root.find('.//id_category_default').text = default_category_id

            associations = root.find('.//associations/categories')
            associations.clear()
            for cat_name in category_names:
                cat_id = category_map.get(cat_name)
                if cat_id:
                    category_elem = ET.SubElement(associations, 'category')
                    id_elem = ET.SubElement(category_elem, 'id')
                    id_elem.text = cat_id

        xml_payload = ET.tostring(root, encoding='unicode')
        response = send_to_api('products', xml_payload)

        if response and response.status_code == 201:
            new_product_xml = ET.fromstring(response.text)
            new_id = new_product_xml.find('.//product/id').text
            print(f"Created product '{product.get('Name *')}' with ID {new_id}")
            
            # Update stock
            quantity = product.get('Quantity')
            if quantity:
                update_stock_for_product(new_id, quantity)
                print(f"Updated quantity for product '{product.get('Name *')}'")

            # Add image
            image_urls = product.get('Image URLs (x,y,z...)')
            if image_urls:
                for j, image_url in enumerate(image_urls.split(',')):
                    image_url = image_url.strip()
                    image_path = download_image(image_url, f"product_{new_id}_{j}", "images")
                    if image_path:
                        add_image_to_product(new_id, image_path)
                        print(f"Images added for product '{product.get('Name *')}'")

            # Add discount
            if discount > 0:
                root.find('.//new').text = '0'
                add_discount_to_product(new_id, discount)
                print(f"Added discount for product '{product.get('Name *')}'")


