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
<div id="_desktop_user_info">
  <div class="user-info">
    {if $logged}
      <a
        class="logout hidden-sm-down"
        href="{$urls.actions.logout}"
        rel="nofollow"
      >
        <i class="material-icons">&#xE7FF;</i>
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
      <a
        class="account"
        href="{$urls.pages.my_account}"
        title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow"
      >
        <i class="material-icons hidden-md-up logged">&#xE7FF;</i>
        <span class="hidden-sm-down">{$customerName}</span>
      </a>
    {else}
      <a
        href="{$urls.pages.my_account}"
        title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
        rel="nofollow">
        
        <span class="hidden-sm-down">{l s='Sign in' d='Shop.Theme.Actions'}</span>
        <svg id="account" xmlns="http://www.w3.org/2000/svg" style="vertical-align: middle;" width="24" height="24" viewBox="0 0 95 95" fill="currentColor">
        <path d="M47.5 95A47.513 47.513 0 0 1 29.011 3.732a47.513 47.513 0 0 1 36.978 87.535A47.183 47.183 0 0 1 47.5 95Zm1-40.55c-10.013 0-17.953 2.647-22.961 7.654-3.911 3.911-5.3 8.47-5.3 11.185a4.507 4.507 0 0 0 1.23 3.318 2.715 2.715 0 0 0 .336.353A38.493 38.493 0 0 0 48.5 87a40.679 40.679 0 0 0 26.565-9.993 4.347 4.347 0 0 0 1.694-3.718c0-2.716-1.388-7.275-5.3-11.185-5.006-5.004-12.946-7.653-22.959-7.653Zm0-32.97a14.13 14.13 0 1 0 14.13 14.13A14.146 14.146 0 0 0 48.5 21.481Z"></path>
     </svg>
      </a>
    {/if}
  </div>
</div>
