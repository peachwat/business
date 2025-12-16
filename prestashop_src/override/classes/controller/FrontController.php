<?php
// override/classes/controller/FrontController.php

class FrontController extends FrontControllerCore
{
    protected function getSubcategoriesForChildren($id_category)
    {
        if (!class_exists('Category')) {
            include_once(_PS_ROOT_DIR_ . '/classes/Category.php');
        }

        $subcategories_raw = Category::getChildren(
            (int) $id_category, 
            $this->context->language->id, 
            true, 
            $this->context->shop->id
        );

        $subcategories = [];
        foreach ($subcategories_raw as $sub) {
            $subcategories[] = [
                'title' => $sub['name'],
                'url' => $this->context->link->getCategoryLink($sub['id_category'], $sub['link_rewrite']),
            ];
        }

        return $subcategories;
    }

    protected function getBreadcrumbLinks()
    {
        $breadcrumb = [];

        $breadcrumb['links'][] = [
            'title' => $this->getTranslator()->trans('Home', [], 'Shop.Theme.Global'),
            'url' => $this->context->link->getPageLink('index', true),
            'subcategories' => $this->getSubcategoriesForChildren(
                (int) Configuration::get('PS_ROOT_CATEGORY')
            )
        ];

        if (isset($this->category) && Validate::isLoadedObject($this->category)) {
            
            $path = $this->category->getParentsCategories($this->context->language->id);

            foreach (array_reverse($path) as $category) {
                if ($category['id_parent'] == 0) {
                    continue; 
                }
                
                $link = $this->context->link->getCategoryLink($category['id_category'], $category['link_rewrite']);
                $title = $category['name'];
                
                $subcategories = $this->getSubcategoriesForChildren($category['id_category']);

                $breadcrumb['links'][] = [
                    'title' => $title,
                    'url' => $link,
                    'subcategories' => $subcategories
                ];
            }
        }
        
        if ('index' != $this->page_name) {
            $title = '';
            $url = '';

            if (method_exists($this->context->controller, 'getPageTitle')) {
                $title = $this->context->controller->getPageTitle();
            } elseif (isset($this->php_self)) {
                $title = $this->getTranslator()->trans(ucfirst($this->php_self), [], 'Shop.Theme.Global');
            }

             $breadcrumb['links'][] = [
                'title' => $title,
                'url' => $url, 
            ];
            
        }

        return $breadcrumb;
    }
}