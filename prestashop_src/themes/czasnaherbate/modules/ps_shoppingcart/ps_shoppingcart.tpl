{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<div id="_desktop_cart">
  <div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
    <div class="header">
        <a rel="nofollow" style ="display: flex; color: white; justify-content: center; align-items: center;" aria-label="{l s='Shopping cart link containing %nbProducts% product(s)' sprintf=['%nbProducts%' => $cart.products_count] d='Shop.Theme.Checkout'}" href="{$urls.pages.order}">
        <i class="material-icons shopping-cart"><svg style="vertical-align: middle;" width="22" color = "white" height="22"><use href="#cart-icon"><svg id="cart-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 17.947" fill="currentColor"><path d="M3.382 6.447H0v2h1.189l2 9.5h13.622l2-9.5H20v-2h-3.382L13.394 0l-1.788.894 2.776 5.553H5.618L8.394.894 6.606 0Zm13.386 2H3.232l1.579 7.5h10.378Z" fill-rule="evenodd"></path></svg></use></svg></i>
        <span class="hidden-sm-down">{l s='Cart' d='Shop.Theme.Checkout'}</span>
        <span class="cart-products-count">({$cart.products_count})</span>
        </a>
    </div>
  </div>
</div>
