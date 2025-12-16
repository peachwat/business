{extends file=$layout}
{block name='content'}

{literal}
<style>
    /* --- EXISTING STYLES (Login Promo) --- */
    .login-offer-container {
        border: 1px solid rgb(255, 0, 0); 
        padding: 40px 20px;
        margin-top: 30px;
        margin-bottom: 30px;
        text-align: center;       
    }

    .login-offer-container h2 {
        font-family: 'PT Serif', serif;
        color: #421f1d;           
        font-size: 24px;
        margin-top: 0;
        margin-bottom: 20px;
        font-weight: 400;
    }

    .btn-login-promo {
        display: inline-block;
        background-color: rgb(255, 0, 0); 
        color: #fff;
        font-size: 14px;
        font-weight: 700;
        text-transform: uppercase;
        padding: 12px 40px;
        border: none;
        text-decoration: none;
        transition: background-color 0.3s ease;
        cursor: pointer;
    }

    /* --- NEW: Free Shipping Block (Matches CzasNaHerbate / pdfla style) --- */
    .pdfla-cart {
        background: #f8f8f8;
        color: #333;
        padding: 15px 20px;
        border: 1px solid #e7e7e7;
        margin-top: 15px;
        margin-bottom: 15px;
        font-weight: 400;
        display: table; /* Ensures icon and text sit side-by-side */
        width: 100%;
        box-sizing: border-box;
    }

    /* The Icon Cell */
    .pdfla-cart .pdfla-icon {
        display: table-cell;
        vertical-align: middle;
        width: 40px;
        padding-right: 15px;
        color: #421f1d; /* Dark Brown branding */
    }

    .pdfla-cart .pdfla-icon i {
        font-size: 32px; /* Large Icon */
    }

    /* The Text Cell */
    .pdfla-cart .pdfla-prices {
        display: table-cell;
        vertical-align: middle;
        text-align: left;
        font-size: 14px;
        line-height: 1.4;
    }

    /* The Price Amount */
    .pdfla-cart .pdfla-delta-price {
        font-weight: 700;
        color: #a60000; /* Red emphasis color like the original site */
        font-size: 16px;
    }

    .pdfla-cart .free-shipping-success {
        color: #005C32; /* Green for success */
        font-weight: 700;
    }
</style>
{/literal}

<div class="cart-grid-body">
    <div class="card cart-container">
        <div class="card-block">
            <h1 class="h1">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
        </div>
        <hr class="separator">
        {block name='cart_overview'}
            {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
        {/block}
        {block name='cart_totals'}
            {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
        {/block}
    </div>

</div>


<div class="row">
    <div class="col-md-12">
        {if isset($shipping_free_price) && $shipping_free_price > 0}
            {* Calculate the missing amount logic *}
            {assign var=cart_products_total value=$cart.subtotals.products.amount}
            {if isset($cart.subtotals.discounts)}
                {assign var=cart_products_total value=$cart_products_total - $cart.subtotals.discounts.amount}
            {/if}
            <div class="pdfla-cart clearfix">
                <div class="pdfla-icon">
                    <i class="material-icons">local_shipping</i>
                </div>
                <div class="pdfla-prices">
                    {if $shipping_free_price <= $cart_products_total}
                        <span class="free-shipping-success">
                            {l s='Masz darmową dostawę!' d='Shop.Theme.Checkout'}
                        </span>
                    {else}
                        {assign var="missing_amount" value=$shipping_free_price - $cart_products_total}
                        {l s='Do darmowej dostawy brakuje' d='Shop.Theme.Global'}
                        <span class="pdfla-delta-price">
                            {$missing_amount|string_format:"%.2f"} {$currency.sign}
                        </span>
                    {/if}
                </div>
            </div>
        {/if}

    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="login-offer-container">
            <h2>Posiadasz już konto?</h2>
            {* Use proper link to authentication page *}
            <a href="{$urls.pages.authentication}" class="btn-login-promo">
            Zaloguj się!
            </a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        {* This wrapper is key for our CSS Grid layout *}
        <div id="custom-one-page-checkout" class="checkout-grid">
            {block name='checkout_process'}
                {render file='checkout/checkout-process.tpl' ui=$checkout_process}
            {/block}
        </div>
    </div>
</div>

{/block}

{block name='footer'}
    {include file='checkout/_partials/footer.tpl'}
{/block}