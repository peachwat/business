curl -k -u UCNMIE1UWX9IZSRCTCJAQWSBAEXCYGGD :  "https://localhost/api/products?schema=blank" > product_template.xml


curl -k -v -u UCNMIE1UWX9IZSRCTCJAQWSBAEXCYGGD: \
     -H "Content-Type: text/xml" \
     -X POST \
     -d @product_template.xml \
     "https://localhost/api/products"