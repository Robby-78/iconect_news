<div class="sidebar-widget">
    <div class="widget-head"><h4 class="title"><?= esc($widget->title); ?></h4></div>
    <div class="widget-body">
        <div class="random-slider-container">
            <div id="random-slider" class="random-slider">
                <?php $num = 6;
                $totalNum = countItems($baseLatestCategoryPosts);
                if ($totalNum < 6) {
                    $num = $totalNum;
                }
                if (!empty($baseLatestCategoryPosts) && $totalNum > 1):
                    $randomKeys = @array_rand($baseLatestCategoryPosts, $num);
                    if (!empty($randomKeys)):
                        $i = 1;
                        foreach ($randomKeys as $key):
                            if (isset($baseLatestCategoryPosts[$key])):
                                $post = $baseLatestCategoryPosts[$key];
                                if ($i <= 5): ?>
                                    <div class="post-item<?= checkPostImg($post, 'class'); ?>">
                                        <a href="<?= generateCategoryURLById($post->category_id, $baseCategories); ?>">
                                            <span class="category-label category-label-random-slider" style="background-color: <?= esc($post->category_color); ?>"><?= esc($post->category_name); ?></span>
                                        </a>
                                        <?php if (checkPostImg($post)): ?>
                                            <div class="post-item-image">
                                                <a href="<?= generatePostURL($post); ?>"<?php postURLNewTab($post); ?>>
                                                    <?= view('post/_post_image', ['postItem' => $post, 'type' => 'random_slider']); ?>
                                                </a>
                                            </div>
                                        <?php endif; ?>
                                        <h3 class="title title-random-slider">
                                            <a href="<?= generatePostURL($post); ?>"<?php postURLNewTab($post); ?>>
                                                <?= esc(characterLimiter($post->title, 55, '...')); ?>
                                            </a>
                                        </h3>
                                        <p class="post-meta">
                                            <?= view("post/_post_meta", ['post' => $post]); ?>
                                        </p>
                                        <p class="description">
                                            <?= esc(characterLimiter($post->summary, 80, '...')); ?>
                                        </p>
                                    </div>
                                <?php endif;
                                $i++;
                            endif;
                        endforeach;
                    endif;
                endif; ?>
            </div>
            <div id="random-slider-nav" class="slider-nav random-slider-nav">
                <button class="prev"><i class="icon-arrow-left"></i></button>
                <button class="next"><i class="icon-arrow-right"></i></button>
            </div>
        </div>
    </div>
</div>