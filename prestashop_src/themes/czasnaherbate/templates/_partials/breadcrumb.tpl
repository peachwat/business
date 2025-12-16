{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * This file contains the custom PSHOWBREADCRUMB structure integration.
 *}

{include file='_partials/helpers.tpl'}

 <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

{block name='breadcrumb'}
    <div class="category-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    
                    <style>
    {literal}
        .pshowbreadcrumb .items .btn-group {
    position: relative;
    overflow: visible;
}
    {/literal}
                    </style>
                    
                    <div class="container">
                        <div class="pshowbreadcrumb pshowbreadcrumb-hook-hookDisplayWrapperTop">
                            <div itemscope itemtype="http://schema.org/BreadcrumbList" class="items content">

{foreach from=$breadcrumb.links item=path name=breadcrumb}

    {assign var='link_title' value=$path.title|escape:'html':'UTF-8'}
    
    {assign var='is_dropdown_link' value=!$smarty.foreach.breadcrumb.first && !$smarty.foreach.breadcrumb.last}
    {assign var='has_subcategories' value=isset($path.subcategories) && is_array($path.subcategories) && count($path.subcategories) > 0}


    {if $is_dropdown_link && $has_subcategories}
        <div itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="item">
            
            <div class="btn-group">
                
                <a itemprop="item" href="{$path.url|escape:'html':'UTF-8'}" class="btn btn-default btn-xs btn-link-placeholder" title="{$link_title}">
                    <span itemprop="name">{$link_title}</span>
                </a>
                
                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="caret"></span> {* Стрілка Bootstrap *}
                </button>
                
                <ul class="dropdown-menu">
                    {foreach from=$path.subcategories item=subcategory}
                        <li><a href="{$subcategory.url|escape:'html':'UTF-8'}" title="{$subcategory.title|escape:'html':'UTF-8'}">{$subcategory.title|escape:'html':'UTF-8'}</a></li>
                    {/foreach}
                </ul>
            </div>
            
            <meta itemprop="position" content="{$smarty.foreach.breadcrumb.index + 1}">
        </div>

    {else}
        <div itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="item">
            {if !$smarty.foreach.breadcrumb.last}
                <a itemprop="item" href="{$path.url|escape:'html':'UTF-8'}" class="btn btn-default btn-xs pshow-category-button" title="{$link_title}">
                    <span itemprop="name">{$link_title}</span>
                </a>
            {else}
                <span class="btn btn-default btn-xs pshow-last-element btn-link-placeholder btn-link-only">
                        <span itemprop="name">{$link_title}</span>
                    </span>
            {/if}
            <meta itemprop="position" content="{$smarty.foreach.breadcrumb.index + 1}">
        </div>
    {/if}

    {if !$smarty.foreach.breadcrumb.last}
        <div class="item arrow">
            <svg style="vertical-align: middle;" width="10" height="10" id="chevron-right" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 8.002 14.001"><path d="M.002 1a.993.993 0 0 0 .294.708L5.587 7 .294 12.292a1.0005561 1.0005561 0 1 0 1.415 1.415l6-6a1 1 0 0 0 0-1.416l-6-6A1 1 0 0 0 .002 1Zm7 6-6-6 6 6Z"></path></svg>
        </div>
    {/if}

{/foreach}
                                
                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </div>
                    <script>
    var mobile_device = 0;
    var wrap_lines = 1;

    $(document).ready(function() {
        $('.pshowbreadcrumb').on('click', '.dropdown-toggle', function(e) {
            e.preventDefault(); 
            e.stopPropagation(); 

            var $parentGroup = $(this).closest('.btn-group');

            $('.pshowbreadcrumb .btn-group').not($parentGroup).removeClass('open');

            $parentGroup.toggleClass('open');
        });

        $(document).on('click', function(e) {
            if (!$(e.target).closest('.pshowbreadcrumb .btn-group').length) {
                $('.pshowbreadcrumb .btn-group').removeClass('open');
            }
        });
        
    });
</script>
                </div>
            </div>
        </div>
    </div>
    {/block}