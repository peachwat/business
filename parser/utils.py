import json
from collections import Counter, defaultdict
from itertools import chain

def find_and_count_duplicates(data):
    print("\n--- Duplicate Product Report ---")
    all_products = []
    for category in data:
        for subcategory in category.get('subcategories', []):
            for group in subcategory.get('groups', []):
                all_products.extend(group.get('products', []))

    if not all_products:
        print("No products found to analyze for duplicates.")
        return

    product_names = [product['name'] for product in all_products if 'name' in product]
    name_counts = Counter(product_names)
    duplicates = {name: count for name, count in name_counts.items() if count > 1}

    if duplicates:
        print(f"Found {len(duplicates)} product(s) with duplicate entries:")
        for name, count in duplicates.items():
            print(f"- '{name}' appears {count} times.")
    else:
        print("No duplicate products found by name.")
    print("-" * 20)


def display_stats(data):
    print("--- Data Statistics ---")
    if not data:
        print("The data is empty.")
        return

    total_products_grand_total = 0
    category_summaries = []
    subcategory_summaries = []

    print(f"Found {len(data)} unique top-level categories.\n")

    for i, category in enumerate(data, 1):
        category_name = category.get('name', 'N/A')
        category_product_count = 0
        print(f"CATEGORY {i}: '{category_name}'")

        subcategories = category.get('subcategories', [])

        if not subcategories:
            print(f"  - No subcategories. Total products: 0")
            category_summaries.append(f"  - Category '{category_name}': 0 products")
            continue

        print(f"  - Contains {len(subcategories)} subcategories:")
        for j, subcategory in enumerate(subcategories, 1):
            subcategory_name = subcategory.get('name', 'N/A')
            subcategory_product_count = 0
            print(f"    SUBCATEGORY {j}: '{subcategory_name}'")

            groups = subcategory.get('groups', [])
            if not groups:
                print("      - No groups. Total products: 0")
                subcategory_summaries.append(f"    - Subcategory '{subcategory_name}': 0 products")
                continue

            print(f"      - Contains {len(groups)} groups:")
            for k, group in enumerate(groups, 1):
                group_name = group.get('name', 'N/A')
                num_products = len(group.get('products', []))
                print(f"        GROUP {k}: '{group_name}' ({num_products} products)")
                subcategory_product_count += num_products

            print(f"    Total products in subcategory '{subcategory_name}': {subcategory_product_count}")
            subcategory_summaries.append(f"    - Subcategory '{subcategory_name}': {subcategory_product_count} products")
            category_product_count += subcategory_product_count

        print(f"Total products in CATEGORY '{category_name}': {category_product_count}")
        category_summaries.append(f"- Category '{category_name}': {category_product_count} products")
        total_products_grand_total += category_product_count

    print("\n" + "="*40)
    print("SUMMARY OF PRODUCT COUNTS:")
    print("="*40)
    for summary in category_summaries:
        print(summary)
    for summary in subcategory_summaries:
        print(summary)

    print("\n" + "="*40)
    print(f"GRAND TOTAL OF ALL PRODUCTS: {total_products_grand_total}")
    print("="*40)
    print("-" * 20)


def update_kawa_category(main_data_file, kawa_data_file, output_file):
    print(f"--- Updating '{main_data_file}' with data from '{kawa_data_file}' ---")
    try:
        with open(main_data_file, 'r', encoding='utf-8') as f:
            main_data = json.load(f)
    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"Error reading main data file '{main_data_file}': {e}")
        return

    try:
        with open(kawa_data_file, 'r', encoding='utf-8') as f:
            kawa_products = json.load(f)
    except (FileNotFoundError, json.JSONDecodeError) as e:
        print(f"Error reading Kawa products file '{kawa_data_file}': {e}")
        return

    grouped_kawa = defaultdict(list)
    for product in kawa_products:
        subcategory_name = "Kawy"
        if len(product.get('categories', [])) > 1:
            subcategory_name = product['categories'][1]['name']
        grouped_kawa[subcategory_name].append(product)


    new_kawa_subcategories = []
    for subcat_name, products in grouped_kawa.items():
        subcat_link = ""
        if products and len(products[0].get('categories', [])) > 1:
            subcat_link = products[0]['categories'][1]['url']

        new_kawa_subcategories.append({
            "name": subcat_name,
            "link": subcat_link,
            "groups": [
                {
                    "name": subcat_name,
                    "link": subcat_link,
                    "products": products
                }
            ]
        })


    kawa_category_obj = None
    for category in main_data:
        if category.get('name') == 'Kawa':
            kawa_category_obj = category
            break

    if kawa_category_obj:
        print("Found 'Kawa' category in main data. Updating its subcategories and products.")
        kawa_category_obj['subcategories'] = new_kawa_subcategories
    else:
        print("'Kawa' category not found in main data. Appending it as a new category.")
        main_data.append({
            "name": "Kawa",
            "link": "https://czasnaherbate.net/11-kawa",
            "subcategories": new_kawa_subcategories
        })


    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(main_data, f, indent=4, ensure_ascii=False)
        print(f"Successfully saved updated data to '{output_file}'")
    except IOError as e:
        print(f"Error writing to output file '{output_file}': {e}")


def main():

    base_file = 'result.json'
    kawa_file = 'kawa_products.json'
    output_file = 'result_modified.json'

    # update_kawa_category(base_file, kawa_file, output_file)

    data = json.load(open(output_file, 'r', encoding='utf-8'))
    display_stats(data)


if __name__ == '__main__':
    main()
