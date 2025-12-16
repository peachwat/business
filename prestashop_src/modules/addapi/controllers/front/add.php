1 <?php

 class AddApiAddModuleFrontController extends ModuleFrontController
 {
     /**
      * @var bool This controller does not require authentication.
      */
     public $auth = false;
     /**
      * !!! IMPORTANT: CHANGE THIS to a long, random, secret string.
      * This is your private API key.
      */
     private const SECRET_TOKEN = 'YourSecretTokenHere';
   
        public function postProcess()
        {
            // --- 1. SECURITY CHECK ---
            $token = Tools::getValue('secret_token'); // Or get from a header
            if (!$token || !hash_equals(self::SECRET_TOKEN, $token)) {
                header('HTTP/1.1 403 Forbidden');
                $this->ajaxDie(json_encode([
                    'success' => false,
                    'message' => 'Forbidden: Invalid or missing secret token.'
                ]));
            }
   
            // --- 2. GATHER PRODUCT DATA from the POST request ---
            $name = Tools::getValue('name');
            $price = (float)Tools::getValue('price');
            $id_category_default = (int)Tools::getValue('id_category_default');
            // You can add more fields here, like 'description', 'reference', etc.
   
            // --- 3. VALIDATE DATA ---
            if (empty($name) || $price <= 0 || $id_category_default <= 0) {
                $this->ajaxDie(json_encode([
                    'success' => false,
                    'message' => 'Error: Missing or invalid required fields (name, price,
 id_category_default).'
                ]));
            }
   
            // --- 4. CREATE and SAVE the new product ---
            try {
                $product = new Product();
                // Set required fields (name must be an array for each language)
                $product->name = array(Configuration::get('PS_LANG_DEFAULT') => $name);
                $product->link_rewrite = array(Configuration::get('PS_LANG_DEFAULT') => Too
 ::link_rewrite($name));
                $product->price = $price;
                $product->id_category_default = $id_category_default;
                $product->id_tax_rules_group = 0; // Set a specific tax rule group ID if
 needed
                $product->active = 1; // Make the product active
   
                // Save the product to the database
                if (!$product->add()) {
                    throw new Exception('Failed to save the product.');
                }
   
                // Associate the product with its default category
                $product->addToCategories(array($id_category_default));
   
                // Set the initial stock quantity (e.g., 100 items)
                StockAvailable::setQuantity($product->id, null, 100);
   
            } catch (Exception $e) {
                $this->ajaxDie(json_encode([
                    'success' => false,
                    'message' => 'An error occurred: ' . $e->getMessage()
                ]));
            }
   
            // --- 5. RETURN SUCCESS RESPONSE ---
            $this->ajaxDie(json_encode([
                'success' => true,
                'message' => 'Product successfully created.',
                'product_id' => $product->id
            ]));
        }
   
        // Helper to send a JSON response
        protected function ajaxDie($value = null)
        {
            header('Content-Type: application/json');
            die($value);
        }
   
        // This controller is API-only, it should not display a template.
        public function display() { die(); }
    }