<div class="post-item-small<?= checkPostImg($post, 'class'); ?>">
    <?php if (checkPostImg($post)): ?>
        <div class="left">
            <a href="<?= generatePostURL($post); ?>"<?php postURLNewTab($post); ?>><?= view("post/_post_image", ["postItem" => $post, "type" => "small"]); ?></a>
        </div>
    <?php endif; ?>
    <div class="right">
        <h3 class="title"><a href="<?= generatePostURL($post); ?>"<?php postURLNewTab($post); ?>><?= esc(characterLimiter($post->title, 55, '...')); ?></a></h3>
        <p class="small-post-meta"><?= view("post/_post_meta", ["post" => $post]); ?></p>
    </div>
</div>