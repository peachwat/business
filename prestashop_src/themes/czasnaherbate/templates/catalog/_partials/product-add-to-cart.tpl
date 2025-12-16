{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * This file is an override of the standard product-add-to-cart.tpl.
 * MODIFIED: Cleaned up structure to be compatible inside a table cell (TD).
 *}

{* Видалено зовнішній div.product-add-to-cart та if-умову, 
   щоб уникнути конфліктів шарів (z-index) та Flexbox/Grid-макетів *}

{* Видалено span.control-label для кількості, оскільки воно є в заголовку таблиці *}

{block name='product_quantity'}
    <div class="product-quantity clearfix" style="position: relative; z-index: 100;"> {* <<< ДОДАНО СТИЛЬ ТУТ *}
        <div class="qty">
          <input
            type="number"
            name="qty"
            id="quantity_wanted"
            inputmode="numeric"
            pattern="[0-9]*"
            {if $product.quantity_wanted}
              value="{$product.quantity_wanted}"
              min="{$product.minimal_quantity}"
            {else}
              value="1"
              min="1"
            {/if}
            class="input-group"
            aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
          >
        </div>

        <div class="add">
          <button
            class="btn btn-primary add-to-cart custom-cart-btn"
            data-button-action="add-to-cart"
            type="submit"
            {if !$product.add_to_cart_url}
              disabled
            {/if}
          >
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M16 6V4C16 2.93913 15.5786 1.92172 14.8284 1.17157C14.0783 0.421427 13.0609 0 12 0C10.9391 0 9.92172 0.421427 9.17157 1.17157C8.42143 1.92172 8 2.93913 8 4V6H2V20C2 21.0609 2.42143 22.0783 3.17157 22.8284C3.92172 23.5786 4.93913 24 6 24H18C19.0609 24 20.0783 23.5786 20.8284 22.8284C21.5786 22.0783 22 21.0609 22 20V6H16ZM10 4C10 3.46957 10.2107 2.96086 10.5858 2.58579C10.9609 2.21071 11.4696 2 12 2C12.5304 2 13.0391 2.21071 13.4142 2.58579C13.7893 2.96086 14 3.46957 14 4V6H10V4ZM17 17C17 17.2652 16.8946 17.5196 16.7071 17.7071C16.5196 17.8946 16.2652 18 16 18C15.7348 18 15.4804 17.8946 15.2929 17.7071C15.1054 17.5196 15 17.2652 15 17V9C15 8.73478 15.1054 8.48043 15.2929 8.29289C15.4804 8.10536 15.7348 8 16 8C16.2652 8 16.5196 8.10536 16.7071 8.29289C16.8946 8.48043 17 8.73478 17 9V17ZM9 17C9 17.2652 8.89464 17.5196 8.70711 17.7071C8.51957 17.8946 8.26522 18 8 18C7.73478 18 7.48043 17.8946 7.29289 17.7071C7.10536 17.5196 7 17.2652 7 17V9C7 8.73478 7.10536 8.48043 7.29289 8.29289C7.48043 8.10536 7.73478 8 8 8C8.26522 8 8.51957 8.10536 8.70711 8.29289C8.89464 8.48043 9 8.73478 9 9V17Z" fill="white"></path>
          </svg>
          </button>
        </div>

        {hook h='displayProductActions' product=$product}
      </div>
    {/block}

    {block name='product_availability'}
      <span id="product-availability" class="js-product-availability">
        {if $product.show_availability && $product.availability_message}
          {if $product.availability == 'available'}
            <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
          {elseif $product.availability == 'last_remaining_items'}
            <i class="material-icons product-last-items">&#xE002;</i>
          {else}
            <i class="material-icons product-unavailable">&#xE14B;</i>
          {/if}
          {$product.availability_message}
        {/if}
      </span>
    {/block}

    {block name='product_minimal_quantity'}
      <p class="product-minimal-quantity js-product-minimal-quantity">
        {if $product.minimal_quantity > 1}
          {l s='The minimum purchase order quantity for the product is %quantity%.' d='Shop.Theme.Checkout' sprintf=['%quantity%' => $product.minimal_quantity]}
        {/if}
      </p>
    {/block}
</div>