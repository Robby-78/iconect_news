<?php if (!empty($baseSettings->facebook_url)) : ?>
    <li><a class="facebook" href="<?= esc($baseSettings->facebook_url); ?>" target="_blank"><i class="icon-facebook"></i></a></li>
<?php endif;
if (!empty($baseSettings->twitter_url)) : ?>
    <li><a class="twitter" href="<?= esc($baseSettings->twitter_url); ?>" target="_blank"><i class="icon-twitter"></i></a></li>
<?php endif;
if (!empty($baseSettings->pinterest_url)) : ?>
    <li><a class="pinterest" href="<?= esc($baseSettings->pinterest_url); ?>" target="_blank"><i class="icon-pinterest"></i></a></li>
<?php endif;
if (!empty($baseSettings->instagram_url)) : ?>
    <li><a class="instagram" href="<?= esc($baseSettings->instagram_url); ?>" target="_blank"><i class="icon-instagram"></i></a></li>
<?php endif;
if (!empty($baseSettings->linkedin_url)) : ?>
    <li><a class="linkedin" href="<?= esc($baseSettings->linkedin_url); ?>" target="_blank"><i class="icon-linkedin"></i></a></li>
<?php endif;
if (!empty($baseSettings->vk_url)) : ?>
    <li><a class="vk" href="<?= esc($baseSettings->vk_url); ?>" target="_blank"><i class="icon-vk"></i></a></li>
<?php endif;
if (!empty($baseSettings->telegram_url)) : ?>
    <li><a class="telegram" href="<?= esc($baseSettings->telegram_url); ?>" target="_blank"><i class="icon-telegram"></i></a></li>
<?php endif;
if (!empty($baseSettings->youtube_url)) : ?>
    <li><a class="youtube" href="<?= esc($baseSettings->youtube_url); ?>" target="_blank"><i class="icon-youtube"></i></a></li>
<?php endif;
if (!empty($generalSettings->show_rss) && $rssHide == false) : ?>
    <li><a class="rss" href="<?= generateURL('rss_feeds'); ?>"><i class="icon-rss"></i></a></li>
<?php endif; ?>