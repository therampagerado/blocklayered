{**
 * Copyright (C) 2017-2024 thirty bees
 * Copyright (C) 2007-2016 PrestaShop SA
 *
 * thirty bees is an extension to the PrestaShop software by PrestaShop SA.
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@thirtybees.com so we can send you a copy immediately.
 *
 * @author    thirty bees <modules@thirtybees.com>
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2017-2024 thirty bees
 * @copyright 2007-2016 PrestaShop SA
 * @license   Academic Free License (AFL 3.0)
 * PrestaShop is an internationally registered trademark of PrestaShop SA.
 *}

{if isset($message)}{$message}{/if}
<div id="ajax-message-ok" class="conf ajax-message alert alert-success" style="display: none">
	<span class="message"></span>
</div>
<div id="ajax-message-ko" class="error ajax-message alert alert-danger" style="display: none">
	<span class="message"></span>
</div>
{if !empty($limit_warning)}
	<div class="alert alert-danger">
		{if $limit_warning['error_type'] == 'suhosin'}
			{l s='Warning! Your hosting provider is using the Suhosin patch for PHP, which limits the maximum number of fields allowed in a form:'}

			<b>{$limit_warning['post.max_vars']}</b> {l s='for suhosin.post.max_vars.'}<br/>
			<b>{$limit_warning['request.max_vars']}</b> {l s='for suhosin.request.max_vars.'}<br/>
			{l s='Please ask your hosting provider to increase the Suhosin limit to'}
		{else}
			{l s='Warning! Your PHP configuration limits the maximum number of fields allowed in a form:'}<br/>
			<b>{$limit_warning['max_input_vars']}</b> {l s='for max_input_vars.'}<br/>
			{l s='Please ask your hosting provider to increase this limit to'}
		{/if}
		{l s='%s at least, or you will have to edit the translation files manually.' sprintf=$limit_warning['needed_limit']}
	</div>
{/if}
<div class="panel">
	<h3><i class="icon-cogs"></i> {l s='Indexes and caches' mod='blocklayered'}</h3>
	<div id="indexing-warning" class="alert alert-warning" style="display: none">
		{l s='Indexing is in progress. Please do not leave this page' mod='blocklayered'}
	</div>
	<div class="row">
		<p>
			<a class="ajaxcall-recurcive btn btn-default" href="{$price_indexer_url}">{l s='Index all missing prices' mod='blocklayered'}</a>
			<a class="ajaxcall-recurcive btn btn-default" href="{$full_price_indexer_url}">{l s='Rebuild entire price index' mod='blocklayered'}</a>
			<a class="ajaxcall btn btn-default" id="attribute-indexer" rel="attribute" href="{$attribute_indexer_url}">{l s='Build attribute index' mod='blocklayered'}</a>
			<a class="ajaxcall btn btn-default" id="url-indexer" rel="price" href="{$url_indexer_url}">{l s='Build URL index' mod='blocklayered'}</a>
		</p>
	</div>
	<div class="row">
		<div class="alert alert-info">
			{l s='You can set a cron job that will rebuild price index using the following URL:' mod='blocklayered'}
			<br />
			<strong>{$price_indexer_url}</strong>
			<br/>
			<br />
			{l s='You can set a cron job that will rebuild attribute index using the following URL:' mod='blocklayered'}
			<br />
			<strong>{$attribute_indexer_url}</strong>
			<br/>
			<br />
			{l s='You can set a cron job that will rebuild URL index using the following URL:' mod='blocklayered'}
			<br />
			<strong>{$url_indexer_url}</strong>
		</div>
	</div>
	<div class="row">
		<div class="alert alert-info">{l s='A nightly rebuild is recommended.' mod='blocklayered'}</div>
	</div>
</div>
<div class="panel">
	<h3><i class="icon-cogs"></i> {l s='Filters templates' mod='blocklayered'}<span class="badge">{$filters_templates|count}</span></h3>
	{if $filters_templates|count > 0}
	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th class="fixed-width-xs center"><span class="title_box">{l s='ID' mod='blocklayered'}</span></th>
					<th><span class="title_box text-left">{l s='Name' mod='blocklayered'}</span></th>
					<th class="fixed-width-sm center"><span class="title_box">{l s='Categories' mod='blocklayered'}</span></th>
					<th class="fixed-width-lg"><span class="title_box">{l s='Created on' mod='blocklayered'}</span></th>
					<th class="fixed-width-sm"><span class="title_box text-right">{l s='Actions' mod='blocklayered'}</span></th>
				</tr>
			</thead>
			<tbody>
				{foreach $filters_templates as $template}
				<tr>
					<td class="center">{(int)$template['id_layered_filter']}</td>
					<td class="text-left">{$template['name']}</td>
					<td class="center">{(int)$template['n_categories']}</td>
					<td>{Tools::displayDate($template['date_add'],null , true)}</td>
					<td>
						{if empty($limit_warning)}
						<div class="btn-group-action">
							<div class="btn-group pull-right">
								<a href="{$current_url}&amp;edit_filters_template=1&amp;id_layered_filter={(int)$template['id_layered_filter']}" class="btn btn-default">
									<i class="icon-pencil"></i> {l s='Edit' mod='blocklayered'}
								</a>
								<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									<span class="caret"></span>&nbsp;
								</button>
								<ul class="dropdown-menu">
									<li>
										<a href="{$current_url}&amp;deleteFilterTemplate=1&amp;id_layered_filter={(int)$template['id_layered_filter']}"
						onclick="return confirm('{l s='Do you really want to delete this filter template?' mod='blocklayered'}');">
											<i class="icon-trash"></i> {l s='Delete' mod='blocklayered'}
										</a>
									</li>
								</ul>
							</div>
						</div>
						{/if}
					</td>
				</tr>
				{/foreach}
			</tbody>
		</table>
		<div class="clearfix">&nbsp;</div>
	</div>
	{else}
		<div class="row alert alert-warning">{l s='No filter template found.' mod='blocklayered'}</div>
	{/if}
	{if empty($limit_warning)}
	<div class="panel-footer">
		<a class="btn btn-default pull-right" href="{$current_url}&amp;add_new_filters_template=1"><i class="process-icon-plus"></i> {l s='Add new template' mod='blocklayered'}</a>
	</div>
	{/if}
</div>
<div class="panel">
	<h3><i class="icon-cogs"></i> {l s='Configuration' mod='blocklayered'}</h3>
	<form action="{$current_url}" method="post" class="form-horizontal">
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Hide filter values when no product is matching' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_hide_0_values" id="ps_layered_hide_0_values_on" value="1"{if $hide_values} checked="checked"{/if}>
					<label for="ps_layered_hide_0_values_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_hide_0_values" id="ps_layered_hide_0_values_off" value="0"{if !$hide_values} checked="checked"{/if}>
					<label for="ps_layered_hide_0_values_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Show the number of matching products' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_show_qties" id="ps_layered_show_qties_on" value="1"{if $show_quantities} checked="checked"{/if}>
					<label for="ps_layered_show_qties_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_show_qties" id="ps_layered_show_qties_off" value="0"{if !$show_quantities} checked="checked"{/if}>
					<label for="ps_layered_show_qties_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Show products from subcategories' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_full_tree" id="ps_layered_full_tree_on" value="1"{if $full_tree} checked="checked"{/if}>
					<label for="ps_layered_full_tree_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_full_tree" id="ps_layered_full_tree_off" value="0"{if !$full_tree} checked="checked"{/if}>
					<label for="ps_layered_full_tree_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Category filter depth (0 for no limits, 1 by default)' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<input type="text" name="ps_layered_filter_category_depth" value="{if $category_depth !== false}{$category_depth}{else}1{/if}" class="fixed-width-sm" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Use tax to filter price' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_filter_price_usetax" id="ps_layered_filter_price_usetax_on" value="1"{if $price_use_tax} checked="checked"{/if}>
					<label for="ps_layered_filter_price_usetax_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_filter_price_usetax" id="ps_layered_filter_price_usetax_off" value="0"{if !$price_use_tax} checked="checked"{/if}>
					<label for="ps_layered_filter_price_usetax_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Use rounding to filter price' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_filter_price_rounding" id="ps_layered_filter_price_rounding_on" value="1"{if $price_use_rounding} checked="checked"{/if}/>
					<label for="ps_layered_filter_price_rounding_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_filter_price_rounding" id="ps_layered_filter_price_rounding_off" value="0"{if !$price_use_rounding} checked="checked"{/if}/>
					<label for="ps_layered_filter_price_rounding_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Allow indexing robots (Google, Yahoo!, Bing, etc.) to use the Condition filter' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_filter_index_condition" id="ps_layered_filter_index_condition_on" value="1"{if $index_cdt} checked="checked"{/if}>
					<label for="ps_layered_filter_index_condition_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_filter_index_condition" id="ps_layered_filter_index_condition_off" value="0"{if !$index_cdt} checked="checked"{/if}>
					<label for="ps_layered_filter_index_condition_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Allow indexing robots (Google, Yahoo!, Bing, etc.) to use the Availability filter' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_filter_index_availability" id="ps_layered_filter_index_availability_on" value="1"{if $index_qty} checked="checked"{/if}>
					<label for="ps_layered_filter_index_availability_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_filter_index_availability" id="ps_layered_filter_index_availability_off" value="0"{if !$index_qty} checked="checked"{/if}>
					<label for="ps_layered_filter_index_availability_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Allow indexing robots (Google, Yahoo!, Bing, etc.) to use the Manufacturer filter' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_filter_index_manufacturer" id="ps_layered_filter_index_manufacturer_on" value="1"{if $index_mnf} checked="checked"{/if}>
					<label for="ps_layered_filter_index_manufacturer_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_filter_index_manufacturer" id="ps_layered_filter_index_manufacturer_off" value="0"{if !$index_mnf} checked="checked"{/if}>
					<label for="ps_layered_filter_index_manufacturer_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-3 control-label">{l s='Allow indexing robots (Google, Yahoo!, Bing, etc.) to use the Category filter' mod='blocklayered'}</label>
			<div class="col-lg-9">
				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="ps_layered_filter_index_category" id="ps_layered_filter_index_category_on" value="1"{if $index_cat} checked="checked"{/if}>
					<label for="ps_layered_filter_index_category_on" class="radioCheck">
						<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
					</label>
					<input type="radio" name="ps_layered_filter_index_category" id="ps_layered_filter_index_category_off" value="0"{if !$index_cat} checked="checked"{/if}>
					<label for="ps_layered_filter_index_category_off" class="radioCheck">
						<i class="color_danger"></i> {l s='No' mod='blocklayered'}
					</label>
					<a class="slide-button btn"></a>
				</span>
			</div>
		</div>
		<div class="panel-footer">
			<button type="submit" class="btn btn-default pull-right" name="submitLayeredSettings"><i class="process-icon-save"></i> {l s='Save' mod='blocklayered'}</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	{if isset($PS_LAYERED_INDEXED)}var PS_LAYERED_INDEXED = {$PS_LAYERED_INDEXED};{/if}
	var token = '{$token}';
	var id_lang = {$id_lang};
	var base_folder = '{$base_folder}';
	var translations = new Array();

	translations['in_progress'] = '{l s='(in progress)' js=1 mod='blocklayered'}';
	translations['url_indexation_finished'] = '{l s='URL indexing finished' js=1 mod='blocklayered'}';
	translations['attribute_indexation_finished'] = '{l s='Attribute indexing finished' js=1 mod='blocklayered'}';
	translations['url_indexation_failed'] = '{l s='URL indexing failed' js=1 mod='blocklayered'}';
	translations['attribute_indexation_failed'] = '{l s='Attribute indexing failed' js=1 mod='blocklayered'}';
	translations['price_indexation_finished'] = '{l s='Price indexing finished' js=1 mod='blocklayered'}';
	translations['price_indexation_failed'] = '{l s='Price indexing failed' js=1 mod='blocklayered'}';
	translations['price_indexation_in_progress'] = '{l s='(in progress, %s products price to index)' js=1 mod='blocklayered'}';
	translations['loading'] = '{l s='Loading...' js=1 mod='blocklayered'}';
	translations['delete_all_filters_templates'] = '{l s='You selected -All categories-: all existing filter templates will be deleted. Is it OK?' js=1 mod='blocklayered'}';
	translations['no_selected_categories'] = '{l s='You must select at least one category' js=1 mod='blocklayered'}';
</script>
