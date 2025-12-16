{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * (Smarty code follows)
 *}

{if $elements}
  <div id="block-reassurance">
    <ul>
      {foreach from=$elements item=element}
        <li>
          <div class="block-reassurance-item">
            <img src="{$element.image}" alt="{$element.text}" loading="lazy">
            <span class="h6">{$element.text}</span>
          </div>
        </li>
      {/foreach}
    </ul>
  </div>
{/if}

