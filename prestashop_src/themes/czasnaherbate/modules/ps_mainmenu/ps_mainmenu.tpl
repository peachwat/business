{literal}
<style>
	#top-menu .dropdown-item {
	display: flex;
	align-items: center;       
	justify-content: space-between; 
	width: 100%;
	padding: 4px 3px;
	font-weight: 700;
	text-transform: uppercase;
	text-decoration: none;
	}
	#top-menu .collapse-icons {
	display: flex;            
	align-items: center;       
	justify-content: center;   
	width: 20px;               
	height: 20px;
	}
	.top-menu .sub-menu {
	background-color:hsl(0, 0.00%, 87.80%);
	box-shadow: 0 5px 15px rgba(0,0,0,0.1);
	padding: 20px 0;
	min-width: 200px; 
	}

</style>
{/literal}


{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
{if $nodes|count}
	<ul class="top-menu" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
	{foreach from=$nodes item=node}
		<li class="{$node.type}{if $node.current} current {/if}" id="{$node.page_identifier}">
		{assign var=_counter value=$_counter+1}
		<a class="dropdown-item{if $depth > 0} dropdown-submenu{/if}" href="{$node.url}" data-depth="{$depth}"
		{if $node.open_in_new_window} target="_blank" {/if}
		>
		{$node.label}
		{if $node.children|count}
		{* Generate a unique ID for the collapse toggler *}
		{assign var=_expand_id value=10|mt_rand:100000}
		<span class="float-xs-right"> <span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse" class="navbar-toggler collapse-icons">
		<i class="material-icons add">&#xE313;</i> <i class="material-icons remove">&#xE316;</i>
		</span>
		</span>
	{/if}
	</a>
	{if $node.children|count}
	{* Submenu Container *}
	<div class="{if $depth === 0}popover sub-menu js-sub-menu{/if} collapse" id="top_sub_menu_{$_expand_id}">
		{menu nodes=$node.children depth=$depth+1 parent=$node}
	</div>
	{/if}
</li>
{/foreach}
</ul>
{/if}
{/function}
<div class="menu js-top-menu position-static hidden-sm-down" id="_desktop_top_menu">
	{menu nodes=$menu.children}
	<div class="clearfix"></div>
</div>
