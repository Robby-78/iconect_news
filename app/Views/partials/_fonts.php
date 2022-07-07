<?php if(!empty($activeFonts)):
foreach ($activeFonts as $font):
if($font->font_source == 'local' && $font->font_key=='open-sans'):?>
<style>@font-face {font-family: 'Open Sans'; font-style: normal; font-weight: 400; font-display: swap; src: local(''), url('<?= base_url('assets/fonts/open-sans/open-sans-regular.woff2'); ?>') format('woff2'), url('<?= base_url('assets/fonts/open-sans/open-sans-regular.woff'); ?>') format('woff')} @font-face {font-family: 'Open Sans'; font-style: normal; font-weight: 600; font-display: swap; src: local(''), url('<?= base_url('assets/fonts/open-sans/open-sans-semi-bold.woff2'); ?>') format('woff2'), url('<?= base_url('assets/fonts/open-sans/open-sans-semi-bold.woff'); ?>') format('woff')} @font-face {font-family: 'Open Sans'; font-style: normal; font-weight: 700; font-display: swap; src: local(''), url('<?= base_url('assets/fonts/open-sans/open-sans-bold.woff2'); ?>') format('woff2'), url('<?= base_url('assets/fonts/open-sans/open-sans-bold.woff'); ?>') format('woff')}</style>
<?php endif;
if($font->font_source == 'local' && $font->font_key=='roboto'):?>
    <style>@font-face {font-family: 'Roboto'; font-style: normal; font-weight: 400; font-display: swap; src: local(''), url('<?= base_url('assets/fonts/roboto/roboto-regular.woff2'); ?>') format('woff2'), url('<?= base_url('assets/fonts/roboto/roboto-regular.woff'); ?>') format('woff')} @font-face {font-family: 'Roboto'; font-style: normal; font-weight: 500; font-display: swap; src: local(''), url('<?= base_url('assets/fonts/roboto/roboto-semi-bold.woff2'); ?>') format('woff2'), url('<?= base_url('assets/fonts/roboto/roboto-semi-bold.woff'); ?>') format('woff')} @font-face {font-family: 'Roboto'; font-style: normal; font-weight: 700; font-display: swap; src: local(''), url('<?= base_url('assets/fonts/roboto/roboto-bold.woff2'); ?>') format('woff2'), url('<?= base_url('assets/fonts/roboto/roboto-bold.woff'); ?>') format('woff')}</style>
<?php endif; endforeach;
endif; ?>
<?= getFontURL($activeFonts,'primary'); ?>
<?= getFontURL($activeFonts,'secondary'); ?>
<?= getFontURL($activeFonts,'tertiary'); ?>