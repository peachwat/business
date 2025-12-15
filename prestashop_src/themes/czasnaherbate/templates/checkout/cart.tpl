{extends file=$layout}

{block name='content'}
{literal}
<style>
    /* 1. The Container Box */
    .login-offer-container {
        border: 1px solid rgb(255, 0, 0); 
        padding: 40px 20px;
        margin-top: 30px;
        margin-bottom: 30px;
        text-align: center;       
    }

    /* 2. The Heading */
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
        background-color:rgb(255, 0, 0); 
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
</style>
{/literal}

<section id="main">
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
        {block name='continue_shopping'}
            <a class="label" href="{$urls.pages.index}">
                <i class="material-icons">chevron_left</i>{l s='Continue shopping' d='Shop.Theme.Actions'}
            </a>
        {/block}
    </div>

    <div class="row">
        <div class="col-md-12 text-right">
            {block name='hook_shopping_cart_footer'}
                {hook h='displayShoppingCartFooter'}
            {/block}
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
             <div class="free-shipping-placeholder" style="padding: 1rem; margin: 1rem 0; border: 1px dashed green; color: green; font-weight: bold;">
                <i class="material-icons">local_shipping</i>
                <span>dostawa placeholder</span>
            </div>
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

	{block name='cart_actions'}
              {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}

    {/block}

	<div class="row ">
		<div class="col-md-4">
			<div class="card">
			FORM
				{*TODO: include file='checkout/_partials/steps/adresses.tpl'*}
			</div>
		</div>
	</div>

</section>
{/block}