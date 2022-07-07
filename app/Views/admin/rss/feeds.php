<div class="row">
    <div class="col-sm-12">
        <?= view('admin/includes/_messages'); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="box">
            <div class="box-header with-border">
                <div class="left">
                    <h3 class="box-title"><?= trans('rss_feeds'); ?></h3>
                </div>
                <div class="right">
                    <a href="<?= adminUrl('import-feed'); ?>" class="btn btn-success btn-add-new">
                        <i class="fa fa-plus"></i>
                        <?= trans('import_rss_feed'); ?>
                    </a>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped dataTable" id="cs_datatable_lang" role="grid" aria-describedby="example1_info">
                                <thead>
                                <tr role="row">
                                    <th width="20"><?= trans('id'); ?></th>
                                    <th><?= trans('feed_name'); ?></th>
                                    <th><?= trans('feed_url'); ?></th>
                                    <th><?= trans('language'); ?></th>
                                    <th><?= trans('category'); ?></th>
                                    <th><?= trans('posts'); ?></th>
                                    <th><?= trans('author'); ?></th>
                                    <th><?= trans('auto_update'); ?></th>
                                    <th></th>
                                    <th><?= trans('options'); ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if (!empty($feeds)):
                                    foreach ($feeds as $item):
                                        $language = getLanguage($item->lang_id); ?>
                                        <tr>
                                            <td><?= esc($item->id); ?></td>
                                            <td><?= esc($item->feed_name); ?></td>
                                            <td style="white-space: pre-wrap;word-break: break-all;"><?= esc($item->feed_url); ?></td>
                                            <td>
                                                <?php if (!empty($language)) {
                                                    echo esc($language->name);
                                                } ?>
                                            </td>
                                            <td>
                                                <?php $categories = getParentCategoryTree($item->category_id, $baseCategories);
                                                if (!empty($categories)):
                                                    foreach ($categories as $category):
                                                        if (!empty($category)): ?>
                                                            <label class="category-label m-r-5 label-table" style="background-color: <?= esc($category->color); ?>!important;">
                                                                <?= esc($category->name); ?>
                                                            </label>
                                                        <?php endif;
                                                    endforeach;
                                                endif; ?>
                                            </td>
                                            <td><?= $item->num_posts; ?></td>
                                            <td>
                                                <?php $author = getUserById($item->user_id);
                                                if (!empty($author)): ?>
                                                    <a href="<?= generateProfileURL($author->slug); ?>" target="_blank" class="table-user-link">
                                                        <strong><?= esc($author->username); ?></strong>
                                                    </a>
                                                <?php endif; ?>
                                            </td>
                                            <td>
                                                <?php if ($item->auto_update == 1): ?>
                                                    <label class="label bg-olive"><?= trans('yes'); ?></label>
                                                <?php else: ?>
                                                    <label class="label label-default"><?= trans('no'); ?></label>
                                                <?php endif; ?>
                                            </td>
                                            <td>
                                                <form action="<?= base_url('RssController/checkFeedPosts'); ?>" method="post">
                                                    <?= csrf_field(); ?>
                                                    <input type="hidden" name="id" value="<?= $item->id; ?>">
                                                    <button type="submit" class="btn btn-success btn-sm">
                                                        <i class="fa fa-refresh "></i>&nbsp;&nbsp;<?= trans("update"); ?>
                                                    </button>
                                                </form>
                                            </td>
                                            <td>
                                                <div class="dropdown">
                                                    <button class="btn bg-purple dropdown-toggle btn-select-option" type="button" data-toggle="dropdown"><?= trans('select_an_option'); ?>
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu options-dropdown">
                                                        <li>
                                                            <a href="<?= adminUrl('edit-feed/' . $item->id); ?>"><i class="fa fa-edit option-icon"></i><?= trans('edit'); ?></a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0)" onclick="deleteItem('RssController/deleteFeedPost','<?= $item->id; ?>','<?= clrQuotes(trans("confirm_rss")); ?>');"><i class="fa fa-trash option-icon"></i><?= trans('delete'); ?></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php endforeach;
                                endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="alert alert-danger alert-large" style="max-width: 1000px;">
            <strong><?= trans("warning"); ?>!</strong>&nbsp;&nbsp;<?= trans("msg_rss_warning"); ?>
        </div>
    </div>
</div>