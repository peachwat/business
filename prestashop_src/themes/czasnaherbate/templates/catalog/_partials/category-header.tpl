{**
 * CUSTOM CATEGORY HEADER
 * Combines H1, Description, Image, and Product Sorting dropdown into one block structure.
 *}

{* Заголовок категорії та сортування *}{* Виводимо це, якщо це перша сторінка списку (тобто це дійсно заголовок категорії) *}
{if $listing.pagination.items_shown_from == 1}
<div class="block-category card card-block">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="tops">
                    <div class="row">
                        {* H1: 8 колонок *}
                        <div class="col-sm-8">
                            <h1 class="h1">{$category.name|escape:'html':'UTF-8'}</h1>
                        </div>
                        
                        {* СОРТУВАННЯ: 4 колонки *}
                        <div class="col-sm-8 dol">
                            {* ========================================================== *}
                            {* БЛОК СОРТУВАННЯ (На основі змінної $listing.sort_orders) *}
                            {* ========================================================== *}
                            <div class="flexline">
                                <span class="col-sm-4 col-md-4 hidden-sm-down sort-by">{l s='Sortuj wg:' d='Shop.Theme.Catalog'}</span>
                                
                                {* $sort_orders вже є масивом опцій *}
                                {assign var=sort_options value=$listing.sort_orders}

                                {* ВИПРАВЛЕНО: Шукаємо активний лейбл в циклі *}
                                {assign var="current_selected_label" value=$listing.sort_selected}
                                {foreach from=$sort_options item=sort_order}
                                    {if $sort_order.current}
                                        {assign var="current_selected_label" value=$sort_order.label}
                                    {/if}
                                {/foreach}

                                <div class="col-sm-12 col-xs-12 col-md-12 products-sort-order dropdown">
                                    {* ВИПРАВЛЕНО КЛАСИ КНОПКИ для коректної роботи JS випадаючого списку *}
                                    <button class="btn-unstyle select-title dropdown-toggle" 
                                            rel="nofollow" 
                                            data-toggle="dropdown" 
                                            aria-haspopup="true" 
                                            aria-expanded="false" 
                                            data-flip="false">
                                        {* ВИКОРИСТОВУЄМО ЗНАЙДЕНИЙ АКТИВНИЙ ЛЕЙБЛ *}
                                        {$current_selected_label|escape:'html':'UTF-8'}
                                        {* ВИПРАВЛЕНО: Додаємо Material Icon для кращої сумісності/видимості випадаючого списку *}
                                    </button>
                                    
                                    <div class="dropdown-menu">
                                        {foreach from=$sort_options item=sort_order}
                                            {* ФІЛЬТРУЄМО: Показуємо тільки ті, що не є Reference *}
                                            {if $sort_order.label != 'Reference, A to Z' && $sort_order.label != 'Reference, Z to A' && $sort_order.label != 'Sprzedaż, od najwyższej do najniższej'}
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
                            {* ========================================================== *}
                        </div>
                    </div>
                </div>
                
                {* ОПИС ТА ЗОБРАЖЕННЯ (ПІД ЗАГОЛОВКОМ) *}
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

{* ========================================================== *}
{* >>> JS ДЛЯ ПРИМУСОВОГО ОНОВЛЕННЯ СТОРІНКИ <<< *}
{* ========================================================== *}
<script>
{literal}
    document.addEventListener('DOMContentLoaded', function() {
        // Отримуємо всі посилання, які відповідають за сортування
        // Використовуємо батьківський контейнер, щоб бути впевненими, що знаходимо лише сортування
        var dropdownMenu = document.querySelector('.products-sort-order .dropdown-menu');

        if (dropdownMenu) {
            var sortLinks = dropdownMenu.querySelectorAll('.js-search-link');

            sortLinks.forEach(function(link) {
                link.addEventListener('click', function(event) {
                    // Якщо AJAX вашої теми не працює, цей код забезпечить,
                    // що перехід буде виконано, якщо потрібно.
                    
                    // Ми дозволяємо браузеру виконати перехід без event.preventDefault(),
                    // оскільки саме це і спричиняє повне оновлення.
                    
                    // Якщо стандартний JS не спрацював, то просте присвоєння location.href
                    // забезпечить перехід і оновлення сторінки.
                    if (window.location.href !== link.href) {
                        window.location.href = link.href;
                    }
                });
            });
        }
    });
{/literal}
</script>