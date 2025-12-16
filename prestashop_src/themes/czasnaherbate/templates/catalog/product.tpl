{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE (AFL-3.0)
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license    https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file=$layout}

{block name='head' append}
  <meta property="og:type" content="product">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url|escape:'html':'UTF-8'}">
  {/if}

  {* Екранування для числових мета-тегів *}
  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc|escape:'html':'UTF-8'}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code|escape:'html':'UTF-8'}">
    <meta property="product:price:amount" content="{$product.price_amount|escape:'html':'UTF-8'}">
    <meta property="product:price:currency" content="{$currency.iso_code|escape:'html':'UTF-8'}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight|escape:'html':'UTF-8'}">
    <meta property="product:weight:units" content="{$product.weight_unit|escape:'html':'UTF-8'}">
  {/if}

  {* ========================================================== *}
  {* >>> ІНТЕГРАЦІЯ КАСТОМНОГО CSS ДЛЯ ЦІЄЇ СТОРІНКИ <<< *}
  {* ========================================================== *}
  {block name='product_custom_css'}
  <style>
    /* ---------------------------------------------------- */
    /* ВСТАВТЕ ВАШ CSS ТУТ, НАПРИКЛАД: */
    
    .produkt-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap; /* Для мобільної адаптації */
        margin-bottom: 15px;
    }
    
    /* СТИЛІ ДЛЯ PDFFLA (доставки) */
    .pdfla-cart {
        background: #f8f8f8;
        padding: 15px;
        border: 1px solid #e7e7e7;
        width: 100%;
        margin-top: 10px;
    }
    
    .pdfla-prices {
        font-size: 14px;
    }
    
    .pdfla-delta-price {
        font-weight: bold;
        color: #a60000; /* Червоний колір для "бракує" */
    }

    /* ДОДАНІ СТИЛІ ДЛЯ ТАБЛИЦІ TableCombz */
    .tablecombz-table th, 
    .tablecombz-table td {
        text-align: center;
        vertical-align: middle !important;
    }
    .tablecombz-price .price-lowered {
        text-align: center; /* Центрування вмісту всередині комірки ціни */
    }
    
    /* ---------------------------------------------------- */
  </style>
  {/block}
  {* ========================================================== *}

{/block}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta content="{$product.url|escape:'html':'UTF-8'}">

    {* ВСТАВКА ХЛІБНИХ КРИШТІВ (PSHOWBREADCRUMB) *}
    {hook h='displayWrapperTop'}

    <div id="content-wrapper">
        
        {* ========================================================== *}
        {* 2.1 ЗАГОЛОВОК ТА TRUSTMATE *}
        {* ========================================================== *}
        <div class="row clearfix">
            <div class="col-sm-12">
                
                {block name='page_header_container'}
                    {block name='page_header'}
                        <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name|escape:'html':'UTF-8'}{/block}</h1>
                    {/block}
                {/block}
                
                {* ХУК: Trustmate Widget *}
                {hook h='displayProductExtraContent'}
                
            </div>
        </div>
        {* ========================================================== *}
        
        
        <div class="row product-container js-product-container clearfix">
          
            {** 1. ЛІВА КОЛОНКА: ЗОБРАЖЕННЯ (col-md-4) **}
            <div class="col-md-4">
                {block name='page_content_container'}
                    <section class="page-content" id="content">
                        {block name='page_content'}
                            {* Прапори продукту *}
                            {include file='catalog/_partials/product-flags.tpl'}

                            {block name='product_cover_thumbnails'}
                                {* Головне зображення та мініатюри *}
                                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                            {/block} 
                            
                            {* Стрілки прокрутки *}
                            <div class="scroll-box-arrows scroll">
                                <i class="material-icons">&#xE314;</i>
                                <i class="material-icons">&#xE315;</i>
                            </div>

                        {/block}
                    </section>
                {/block}
            </div>


            {** 2. ПРАВА КОЛОНКА: ІНФОРМАЦІЯ, ЦІНА, КУПІВЛЯ (col-md-8) **}
            <div class="col-md-8">
                
                
                {* 2.2 БЛОК ДІЙ та ЦІН (produkt-top) *}
                <div class="produkt-top clearfix">
                    
                    {* ВСТАВКА: PRODUCT DISCOUNT TOP (PROMOCJA) *}
                    {if $product.has_discount}
                        <div class="product-discount-top"><div>{l s='PROMOCJA' d='Shop.Theme.Catalog'}</div></div>
                    {/if}
                    
                    {* Оцінка *}
                    <div class="produkt-ocena-top">
                        {hook h='displayProductListReviews' product=$product}
                    </div>

                    {* ========================================================= *}
                    {* БЛОК З СОЦМЕРЕЖАМИ ТА ДОСТАВКОЮ (product-additional-info) *}
                    {* ========================================================= *}
                    {block name='product_additional_info'}
                        <div class="product-additional-info">
                            
                            {* Social Sharing (Динамічні посилання) *}
                            <div class="social-sharing">
                                <span>{l s='Udostępnij' d='Shop.Theme.Catalog'}</span>
                                <ul>
                                    <li class="facebook icon-gray">
                                        <a href="https://www.facebook.com/sharer.php?u={$product.url|urlencode}" title="{l s='Udostępnij' d='Shop.Theme.Catalog'}" target="_blank">
                                            <svg width="22" height="22"><use href="#facebook"></use></svg>
                                        </a>
                                    </li>
                                    <li class="pinterest icon-gray">
                                        <a href="https://www.pinterest.com/pin/create/button/?media={$product.cover.large.url|urlencode}&amp;url={$product.url|urlencode}" title="{l s='Pinterest' d='Shop.Theme.Catalog'}" target="_blank">
                                            <svg width="22" height="22"><use href="#pinterest"></use></svg>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            
                            {* EDRONE Tracking Script - ОБГОРНУТИ В LITERAL *}
                            <script>
                            {literal}
                            if (document.getElementById('add_to_cart')) {
                                document.getElementById('add_to_cart').addEventListener('click', function(event) {
                                    if (typeof(ajaxCart) !== 'object') {
                                        _edrone.action_type = 'add_to_cart';
                                        _edrone.init()
                                    };
                                }, false);
                            } else {
                                document.body.addEventListener('click', function _func(e) {
                                    if (e.srcElement.classList.contains('add-to-cart')) {
                                        if (typeof(ajaxCart) !== 'object') {
                                            _edrone.action_type = 'add_to_cart';
                                            _edrone.init()
                                        };
                                    };
                                    document.body.removeEventListener('click', _func)
                                })
                            }
                            {/literal}
                            </script>
                            
                            {* --- ІНТЕГРАЦІЯ ЛОГІКИ ПРОГРЕСУ PDFFLA --- *}
                            {assign var="shipping_free_price" value=2000.00} {* Порогове значення 2000 zł *}
                            {assign var=cart_products_total value=$cart.subtotals.products.amount}
                            
                            {if $cart_products_total > 0} {* Виводимо лише якщо в кошику є товари *}
                                {if isset($cart.subtotals.discounts)}
                                    {assign var=cart_products_total value=$cart_products_total - $cart.subtotals.discounts.amount}
                                {/if}
                                
                                <div class="pdfla-cart clearfix">
                                    <div class="pdfla-icon">
                                        <i class="material-icons">local_shipping</i>
                                    </div>
                                    <div class="pdfla-prices">
                                        {if $shipping_free_price <= $cart_products_total}
                                            <span class="pdfla-delta-price free-shipping-success">
                                                {l s='Masz darmową dostawę!' d='Shop.Theme.Global'}
                                            </span>
                                        {else}
                                            {assign var="missing_amount" value=$shipping_free_price - $cart_products_total}
                                            {l s='Do darmowej dostawy brakuje' d='Shop.Theme.Global'}
                                            <span class="pdfla-delta-price">
                                                {Tools::displayPrice(max(0, $missing_amount), $currency) nofilter}
                                            </span> 
                                        {/if}
                                        
                                        {l s='Darmowa dostawa obowiązuje od' d='Shop.Theme.Global'}
                                        <span class="pdfla-start-from-price">
                                            {Tools::displayPrice($shipping_free_price, $currency) nofilter}
                                        </span>
                                    </div>
                                </div>
                            {/if}
                            {* ------------------------------------------------------------------- *}
                            
                        </div>
                    {/block}
                    {* ========================================================= *}
                </div>
                
                {* 2.3 ЦІНИ (product-prices) *}
                <div class="product-prices clearfix">
                    {block name='product_prices'}
                        {include file='catalog/_partials/product-prices.tpl'}
                    {/block}
                    
                    {* Додатковий текст про податки/найнижча ціна/доставка *}
                    {* ВПЕВНЮЄМОСЯ, ЩО НЕМАЄ ЗНИЖКИ, ПЕРЕД ТИМ ЯК ВИВОДИТИ БЛОК *}
                    {if !$product.has_discount}
                        <div class="tax-shipping-delivery-label schowaj">
                            {l s='Brutto' d='Shop.Theme.Catalog'}
                            {hook h='displayOmniversePricingNotice' product=$product}
                            <span class="delivery-information">{$product.delivery_information|escape:'html':'UTF-8'}</span>
                        </div>
                    {/if}
                </div>

                {* 2.4 ВАРІАНТИ та КНОПКА КУПІВЛІ (product-actions) - ІНТЕГРАЦІЯ TABLECOMBZ СТРУКТУРИ *}
                <div class="product-information">
                    
                    <div class="product-actions js-product-actions">
                        {block name='product_buy'}
                            <form action="{$urls.pages.cart|escape:'html':'UTF-8'}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token|escape:'html':'UTF-8'}">
                                <input type="hidden" name="id_product" value="{$product.id|intval}" id="product_page_product_id">
                                <input type="hidden" name="id_customization" value="{$product.id_customization|intval}" id="product_customization_id" class="js-product-customization-id">

                                {* ВАРІАНТИ (TableCombz) *}
                                {block name='product_variants'}
                                    {* TABLECOMBZ OVERRIDE - ЦЕЙ БЛОК МИ ЗАЛИШАЄМО ПУСТИМ, АЛЕ ВИКЛИКАЄМО ХУК,
                                       ЯКЩО ВИ ПЛАНУЄТЕ НАЙБЛИЖЧИМ ЧАСОМ ІНТЕГРУВАТИ TABLECOMBZ *}{/block}

                                {* ЗНИЖКИ (Стандартний блок) - залишаємо, якщо його не було в TableCombz *}
                                {block name='product_discounts'}
                                    {include file='catalog/_partials/product-discounts.tpl'}
                                {/block}

                                {* ====================================================================================== *}
                                {* ПОВЕРНЕННЯ СТАНДАРТНОГО product-add-to-cart (КІЛЬКІСТЬ + КНОПКА) ВНУТРІ ФОРМИ TABLECOMBZ *}
                                {* ====================================================================================== *}
                                {block name='product_add_to_cart'}
                                    <div id="tablecombz-wrapper"> {* Обгортаємо в той самий ID, що був у TableCombz *}
                                        <div id="tablecombz-box-due">
                                            <div class="tablecombz-legend-row">
                                                <div class="tablecombz-legend-item">
                                                    <div class="tablecombz-legend-dot available"></div>
                                                    <div class="tablecombz-legend-text">{l s='Produkt dostępny' d='Shop.Theme.Catalog'}</div>
                                                </div>
                                                <div class="tablecombz-legend-item">
                                                    <div class="tablecombz-legend-dot unavailable"></div>
                                                    <div class="tablecombz-legend-text">{l s='Produkt niedostępny' d='Shop.Theme.Catalog'}</div>
                                                </div>
                                            </div>
                                            <table class="table table-bordered tablecombz-table" id="tablecombz-table">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 130px; text-align: center; vertical-align: middle;" class="first_item">{l s='Cena' d='Shop.Theme.Catalog'}</th>
                                                        <th style="text-align: center; vertical-align: middle;" class="item in-stock-availability"></th>
                                                        <th style="width: 150px; text-align: center; vertical-align: middle;" class="itemquantity">{l s='Ilość' d='Shop.Theme.Catalog'}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="tablecombz-price tablecombz-discount" style="text-align: center; vertical-align: middle;">
                                                            <div class="price price-lowered">
                                                                <div>
                                                                    {if $product.has_discount}
                                                                        <s>{$product.regular_price}</s>
                                                                    {/if}
                                                                </div>
                                                                {if $product.discount_percentage}
                                                                    <div class="price-reduction">{$product.discount_percentage}</div>
                                                                {/if}
                                                                {$product.price}
                                                                <span class="omniversepricing-notice">
                                                                    {* ВИКЛИК ХУКА ДЛЯ НАЙНИЖЧОЇ ЦІНИ ЗА 30 ДНІВ *}
                                                                    {hook h='displayProductPriceBlock' product=$product type="price_min_30_days"}
                                                                </span>
                                                            </div>
                                                        </td>
                                                        <td class="tablecombz-avail" style="text-align: center; vertical-align: middle;"><div class="dot {$product.availability}"></div></td>
                                                        <td class="tablecombz-quantity-wanted" style="width: 150px; text-align: center; vertical-align: middle;">
                                                            {* ВСТАВЛЯЄМО СТАНДАРТНИЙ UI КОШИКА ТУТ *}
                                                            {include file='catalog/_partials/product-add-to-cart.tpl'}
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <p class="tablecombz-desc">
                                                {l s='Produkt dostępny w sklepie internetowym' d='Shop.Theme.Catalog'} {$shop.name} {l s='oraz w wybranych salonach' d='Shop.Theme.Catalog'}
                                            </p>
                                        </div>
                                    </div>
                                {/block}
                                {* ====================================================================================== *}
                                

                                {block name='product_refresh'}{/block}
                            </form>
                        {/block}
                    </div>
                    
                    {* 2.5 КОРОТКИЙ ОПИС *}
                    <div class="produkt-opis clearfix">
                        {block name='product_description_short'}
                            <div id="product-description-short-{$product.id|intval}" class="product-description">{$product.description_short nofilter}</div>
                        {/block}
                    </div>

                    {* 2.6 ХАРАКТЕРИСТИКИ / ДОСТАВКА / КОД ПРОДУКТУ *}
                    <div class="produkt-szczegoly clearfix">
                        {block name='product_details_features'}
                            <section class="product-features">
                                {include file='catalog/_partials/product-details.tpl'}
                            </section>
                        {/block}
                        
                        {* Доступність та код продукту *}
                        <div class="dostepnosc">
                            <label>{l s='Czas wysyłki:' d='Shop.Theme.Catalog'}</label>
                            <span>{$product.delivery_in_stock|escape:'html':'UTF-8'}</span>
                        </div>
                        <div class="dostepnosc">
                            <label>{l s='Koszt wysyłki:' d='Shop.Theme.Catalog'}</label><span>{l s='od 15,00 zł' d='Shop.Theme.Catalog'}</span>
                        </div>
                        <div class="product-reference">
                            <label class="label">{l s='Kod produktu:' d='Shop.Theme.Catalog'}</label><span itemprop="sku">{$product.reference|escape:'html':'UTF-8'}</span>
                        </div>
                    </div>

                    {* 2.7 ДОДАТКОВІ ПОСИЛАННЯ (Zapytaj/Send2fr) *}
                    <div class="box3pola clearfix">
                        <div class="zapytaj-o-produkt">
                            <a href="{$urls.pages.contact|escape:'html':'UTF-8'}">
                                <svg width="19" height="14" style="vertical-align: middle;position: relative;top: -2px;"><use href="#envelope"></use></svg>
                                {l s='Zapytaj o produkt' d='Shop.Theme.Catalog'}
                            </a>
                        </div>
                        <div class="send2fr">
                            {hook h='displaySendToFriend'}
                        </div>
                    </div>
                    
                    {* 2.8 Категорії продукту *}
                    <div class="lista-kategorii clearfix"><div class="tytulkat">{l s='Kategorie:' d='Shop.Theme.Catalog'}</div>
                        <div class="productcats">
                            {assign var="defaultCategoryLink" value=$link->getCategoryLink($product.id_category_default)}
                            {if $product.category_name}
                                <span class="pole">
                                    <a href="{$defaultCategoryLink|escape:'html':'UTF-8'}" title="{$product.category_name|escape:'html':'UTF-8'}">{$product.category_name|escape:'html':'UTF-8'}</a>
                                </span>
                            {/if}
                        </div>
                    </div>
                
                </div> {* /.product-information *}
                
                {* Кнопка повернення до категорії *}
                <div class="extrabutton">
                    <a href="{$defaultCategoryLink|escape:'html':'UTF-8'}">
                        <svg width="16" height="16" style="vertical-align: middle;position: relative;top: -1px; margin-right: 1rem;"><use href="#arrow-right"></use></svg>
                        {l s='POWRÓT DO LISTY PRODUKTÓW' d='Shop.Theme.Catalog'}
                    </a>
                </div>

            </div> {* /.col-md-8 *}
            
        </div> {* /.row.product-container *}

        {* 3. НИЖНІЙ БЛОК: АКСЕСУАРИ/КАРУСЕЛЬ *}
        {block name='product_accessories'}
            {if $accessories}
                <section class="product-accessories clearfix">
                    <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
                    <div class="products row">
                        {foreach from=$accessories item="product_accessory" key="position"}
                            {block name='product_miniature'}
                                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses="col-xs-12 col-sm-6 col-lg-4 col-xl-3"}
                            {/block}
                        {/foreach}
                    </div>
                </section>
            {/if}
        {/block}

        {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
        {/block}

        {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        {block name='page_footer_container'}
            <footer class="page-footer">
                {block name='page_footer'}
                    <!-- Footer content -->
                {/block}
            </footer>
        {/block}
    
    </div> {* /#content-wrapper *}
    
  </section>

{/block}