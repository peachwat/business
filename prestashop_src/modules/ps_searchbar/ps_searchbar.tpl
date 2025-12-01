{**
 * 2007-2020 PrestaShop SA and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
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
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}



{**
*  <div id="search_widget" class="search-widget" data-search-controller-url="">
*	    <form method="get" action="https://czasnaherbate.net/module/ambjolisearch/jolisearch">
*				<span class="search_word">SZUKAJ: </span>
*		    <span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span>
*       <input class="text_input ui-autocomplete-input" type="text" name="s" value="" placeholder="" aria-label="Szukaj" data-autocomplete-mode="2" data-autocomplete="https://czasnaherbate.net/module/ambjolisearch/jolisearch" data-lang="1" data-manufacturer="Producenci" data-supplier="Suppliers" data-product="Produkty" data-category="Kategorie" data-minwordlen="3" data-no-results-found="Nie znaleziono wyników" data-more-results="Więcej wyników" autocomplete="off">
*		    <button aria-label="Szukaj" type="submit">
*			    <svg width="20" height="20"><use href="#search"></use></svg>
*      		<span class="hidden-xl-down">Szukaj</span>
*		    </button>
*	</form>
*</div>
*
*}

 


<div id="search_widget" class="search-widgets" data-search-controller-url="{$search_controller_url}">
  <form method="get" action="{$search_controller_url}">
  <span class="search_word">{l s='Search our catalog' d='Shop.Theme.Catalog'}</span>
    <input type="hidden" name="controller" value="search">
    <input type="text" name="s" value="{$search_string}" placeholder="" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
    <i class="material-icons clear" aria-hidden="true">clear</i>
    <span class="hidden-xl-down">Szukaj</span>

    <button aria-label="Search" type="submit">
    <i class="material-icons search" >search</i>
		</button>
  </form>
</div>
