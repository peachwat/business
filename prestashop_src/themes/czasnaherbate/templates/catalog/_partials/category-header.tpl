{if $listing.pagination.items_shown_from == 1}
<div class="block-category card card-block">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="tops">
                    <div class="row">
                        <div class="col-sm-8">
                            <h1 class="h1">{$category.name|escape:'html':'UTF-8'}</h1>
                        </div>
                        
                        <div class="col-sm-4 dol">
                            <div class="flexline">
                                <span class="col-sm-4 col-md-4 hidden-sm-down sort-by">{l s='Sortuj wg:' d='Shop.Theme.Catalog'}</span>
                                
                                {assign var=sort_options value=$listing.sort_orders}

                                {assign var="current_selected_label" value=$listing.sort_selected}
                                {foreach from=$sort_options item=sort_order}
                                    {if $sort_order.current}
                                        {assign var="current_selected_label" value=$sort_order.label}
                                    {/if}
                                {/foreach}

                                <div class="col-sm-12 col-xs-12 col-md-8 products-sort-order dropdown">
                                    <button class="btn-unstyle select-title dropdown-toggle1" 
                                            rel="nofollow" 
                                            data-toggle="dropdown" 
                                            aria-haspopup="true" 
                                            aria-expanded="false" 
                                            data-flip="false">
                                        {$current_selected_label|escape:'html':'UTF-8'}
                                    <svg width="8" height="8" id="double-chevron-down" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 8.749 10"><path d="M3.932 9.816.183 6.068a.626.626 0 0 1 .885-.885l3.306 3.308 3.307-3.307a.625.625 0 1 1 .885.884L4.817 9.816a.625.625 0 0 1-.885 0Zm4.19-4.191L4.374 9.374l3.749-3.748Zm-4.19-.808L.183 1.067a.625.625 0 0 1 0-.884.625.625 0 0 1 .885 0l3.306 3.308L7.681.184a.626.626 0 0 1 1.068.442.621.621 0 0 1-.184.442L4.817 4.817a.625.625 0 0 1-.885 0ZM8.123.626 4.374 4.375 8.123.626Z"></path></svg>
                                    </button>
                                    
                                    <div class="dropdown-menu">
                                        {foreach from=$sort_options item=sort_order}
                                            {if $sort_order.label != 'Reference, A to Z' && $sort_order.label != 'Reference, Z to A' && $sort_order.label != 'Sprzedaż, od najwyższej do najniższej' && $sort_order.label != 'Trafność'}
                                            <a rel="nofollow" 
                                               href="{$sort_order.url|escape:'html':'UTF-8'}" 
                                               class="select-list js-search-link {if $sort_order.current}current{/if}">
                                                {$sort_order.label}
                                            </a>
                                            {/if}
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="block-category-inner">
                    {if $category.description}
                        <div id="category-description" class="text-muted">{$category.description nofilter}</div>
                    {/if}
                    {if !empty($category.image.large.url)}
                        <div class="category-cover">
                            <img src="{$category.image.large.url}" alt="{if !empty($category.image.legend)}{$category.image.legend|escape:'html':'UTF-8'}{else}{$category.name|escape:'html':'UTF-8'}{/if}" loading="lazy" width="141" height="180">
                        </div>
                    {/if}
                </div>
                
            </div>
        </div>
    </div>
</div>
{/if}

<script>
{literal}
    document.addEventListener('DOMContentLoaded', function() {
        var dropdownMenu = document.querySelector('.products-sort-order .dropdown-menu');

        if (dropdownMenu) {
            var sortLinks = dropdownMenu.querySelectorAll('.js-search-link');

            sortLinks.forEach(function(link) {
                link.addEventListener('click', function(event) {
                    if (window.location.href !== link.href) {
                        window.location.href = link.href;
                    }
                });
            });
        }
    });
{/literal}
</script>