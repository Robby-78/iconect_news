<div id="wrapper">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 page-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?= langBaseUrl(); ?>"><?= trans("home"); ?></a></li>
                    <li class="breadcrumb-item active"><?= trans("search") . ": " . esc(characterLimiter($q, 150, '...')); ?></li>
                </ol>
            </div>
            <div id="content" class="col-sm-8">
                <div class="row">
                    <div class="col-sm-12">
                        <h1 class="page-title"><span> <?= trans("search"); ?>:</span>&nbsp;<strong><?= esc($q); ?></strong></h1>
                    </div>
                    <div class="col-sm-12 text-right m-b-15">
                        <form action="<?= generateURL('search'); ?>" method="get" id="form_search_in_content">
                            <input type="hidden" name="q" value="<?= esc($q); ?>">
                            <label class="custom-checkbox">
                                <input type="checkbox" class="checkbox_terms_conditions" name="sc" value="1" onclick="document.getElementById('form_search_in_content').submit();" <?= !empty($searchInContent) ? 'checked' : ''; ?>>
                                <span class="checkbox-icon"><i class="icon-check"></i></span>
                                <?= trans("search_in_post_content"); ?>
                            </label>
                        </form>
                    </div>
                    <?php $count = 0;
                    foreach ($posts as $post):
                        if ($count != 0 && $count % 2 == 0): ?>
                            <div class="col-sm-12"></div>
                        <?php endif;
                        echo view("post/_post_item_list", ['post' => $post, 'showLabel' => true]);
                        if ($count == 1):
                            echo view('partials/_ad_spaces', ['adSpace' => 'search_top', 'class' => 'p-b-30']);
                        endif;
                        $count++;
                    endforeach;
                    if ($count == 0): ?>
                        <p class="text-center">
                            <?= trans("search_noresult"); ?>
                        </p>
                    <?php endif;
                    echo view('partials/_ad_spaces', ['adSpace' => 'search_bottom', 'class' => '']); ?>
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