<?php

class CartController extends CartControllerCore
{
    public function initContent()
    {
        parent::initContent();
        $shipping_free_price = (float) Configuration::get('PS_SHIPPING_FREE_PRICE');
        $this->context->smarty->assign([
            'shipping_free_price' => $shipping_free_price
        ]);
    }
}