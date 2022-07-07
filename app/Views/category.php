<div id="wrapper">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 page-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= langBaseUrl(); ?>"><?= trans("home"); ?></a></li>
                    <?php $categories = getParentCategoryTree($category->id, $baseCategories);
                    $i = 0;
                    if (!empty($categories)):
                        foreach ($categories as $item):
                            if ($i == 0 && count($categories) > 1): ?>
                                <li class="breadcrumb-item active"><a href="<?= generateCategoryURL($item); ?>"><?= esc($item->name); ?></a></li>
                            <?php else: ?>
                                <li class="breadcrumb-item"><span><?= esc($item->name); ?></span></li>
                            <?php endif;
                            $i++;
                        endforeach;
                    endif; ?>
                </ol>
            </div>
            <div id="content" class="col-sm-8">
                <div class="row">
                    <div class="col-sm-12"><h1 class="page-title"><?= esc($category->name); ?></h1></div>
                    <?php $count = 0;
                    foreach ($posts as $post):
                        if ($count != 0 && $count % 2 == 0): ?>
                            <div class="col-sm-12"></div>
                        <?php endif;
                        echo view("post/_post_item_list", ["post" => $post]);
                        if ($count == 1):
                            echo view('partials/_ad_spaces', ['adSpace' => 'category_top', 'class' => 'p-b-30']);
                        endif;
                        $count++;
                    endforeach;
                    echo view('partials/_ad_spaces', ['adSpace' => 'category_bottom', 'class' => '']); ?>
                    <div class="col-sm-12 col-xs-12">
                        <?= view('partials/_pagination'); ?>
                    </div>
                </div>
            </div>
            <div id="sidebar" class="col-sm-4">
                <?= view('partials/_sidebar'); ?>
            </div>
        </div>
    </div>
</div>