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

<div class="form-group">
	<label class="control-label col-lg-3">
		<span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="{l s='Invalid characters: <>;=#{}_' mod='blocklayered'}">{l s='URL' mod='blocklayered'}</span>
	</label>
	<div class="col-lg-9">
		<div class="row">
			{foreach $languages as $language}
			<div class="translatable-field lang-{$language['id_lang']}" style="display: {if $language['id_lang'] == $default_form_language}block{else}none{/if};">
				<div class="col-lg-9">
					<input type="text" size="64" name="url_name_{$language['id_lang']}" value="{if isset($values[$language['id_lang']]) && isset($values[$language['id_lang']]['url_name'])}{$values[$language['id_lang']]['url_name']|escape:'htmlall':'UTF-8'}{/if}" />
				</div>
				<div class="col-lg-2">
					<button type="button" class="btn btn-default dropdown-toggle" tabindex="-1" data-toggle="dropdown">
						{$language['iso_code']}
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						{foreach $languages as $language}
						<li><a href="javascript:hideOtherLanguage({$language['id_lang']});" tabindex="-1">{$language['name']}</a></li>
						{/foreach}
					</ul>
				</div>
			</div>
			{/foreach}
			<div class="col-lg-9">
				<p class="help-block">{l s='When the Layered Navigation Block module is enabled, you can get more detailed URLs by choosing the word that best represent this attribute. By default, thirty bees uses the attribute\'s name, but you can change that setting using this field.' mod='blocklayered'}</p>
			</div>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-3">{l s='Meta title' mod='blocklayered'}</label>
	<div class="col-lg-9">
		<div class="row">
			{foreach $languages as $language}
			<div class="translatable-field lang-{$language['id_lang']}" style="display: {if $language['id_lang'] == $default_form_language}block{else}none{/if};">
				<div class="col-lg-9">
					<input type="text" size="70" name="meta_title_{$language['id_lang']}" value="{if isset($values[$language['id_lang']]) && isset($values[$language['id_lang']]['meta_title'])}{$values[$language['id_lang']]['meta_title']|escape:'htmlall':'UTF-8'}{/if}" />
				</div>
				<div class="col-lg-2">
					<button type="button" class="btn btn-default dropdown-toggle" tabindex="-1" data-toggle="dropdown">
						{$language['iso_code']}
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						{foreach $languages as $language}
						<li><a href="javascript:hideOtherLanguage({$language['id_lang']});" tabindex="-1">{$language['name']}</a></li>
						{/foreach}
					</ul>
				</div>
			</div>
			{/foreach}
			<div class="col-lg-9">
				<p class="help-block">{l s='When the Layered Navigation Block module is enabled, you can get more detailed page titles by choosing the word that best represent this attribute. By default, thirty bees uses the attribute\'s name, but you can change that setting using this field.' mod='blocklayered'}</p>
			</div>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-lg-3" for="">{l s='Indexable' mod='blocklayered'}</label>
	<div class="col-lg-9">
		<span class="switch prestashop-switch fixed-width-lg">
			<input type="radio" name="layered_indexable" id="indexable_on" value="1"{if $is_indexable} checked="checked"{/if}>
			<label for="indexable_on" class="radioCheck">
				<i class="color_success"></i> {l s='Yes' mod='blocklayered'}
			</label>
			<input type="radio" name="layered_indexable" id="indexable_off" value="0"{if !$is_indexable} checked="checked"{/if}>
			<label for="indexable_off" class="radioCheck">
				<i class="color_danger"></i> {l s='No' mod='blocklayered'}
			</label>
			<a class="slide-button btn"></a>
		</span>
	</div>
	<div class="col-lg-9 col-lg-push-3">
		<p class="help-block">{l s='Use this attribute in URL generated by the layered navigation module.' mod='blocklayered'}</p>
	</div>
</div>
