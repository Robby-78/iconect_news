<div class="row">
    <div class="col-sm-12">
        <?= view('admin/includes/_messages'); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-12 col-xs-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <div class="left">
                    <h3 class="box-title"><?= trans('add_widget'); ?></h3>
                </div>
                <div class="right">
                    <a href="<?= adminUrl('widgets'); ?>" class="btn btn-success btn-add-new"><i class="fa fa-bars"></i><?= trans('widgets'); ?>
                    </a>
                </div>
            </div>
            <form action="<?= base_url('AdminController/addWidgetPost'); ?>" method="post">
                <?= csrf_field(); ?>
                <input type="hidden" name="is_custom" value="1">
                <div class="box-body">
                    <div class="form-group">
                        <label class="control-label"><?= trans('title'); ?></label>
                        <input type="text" class="form-control" name="title" placeholder="<?= trans('title'); ?>" value="<?= old('title'); ?>" required>
                    </div>

                    <div class="form-group">
                        <label><?= trans("language"); ?></label>
                        <select name="lang_id" class="form-control max-600">
                            <?php foreach ($activeLanguages as $language): ?>
                                <option value="<?= $language->id; ?>" <?= $activeLang->id == $language->id ? 'selected' : ''; ?>><?= $language->name; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="control-label"><?= trans('order_1'); ?></label>
                        <input type="number" class="form-control max-600" name="widget_order" min="1" max="3000" placeholder="<?= trans('order_1'); ?>" value="1" required>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-3 col-xs-12">
                                <label><?= trans('visibility'); ?></label>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-12 col-option">
                                <input type="radio" id="rb_visibility_1" name="visibility" value="1" class="square-purple" <?= old('visibility') != "0" ? 'checked' : ''; ?>>
                                <label for="rb_visibility_1" class="cursor-pointer"><?= trans('show'); ?></label>
                            </div>
                            <div class="col-md-2 col-sm-4 col-xs-12 col-option">
                                <input type="radio" id="rb_visibility_2" name="visibility" value="0" class="square-purple" <?= old('visibility') == "0" ? 'checked' : ''; ?>>
                                <label for="rb_visibility_2" class="cursor-pointer"><?= trans('hide'); ?></label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div id="main_editor">
                            <label><?= trans('content'); ?></label>
                            <div class="row">
                                <div class="col-sm-12 editor-buttons">
                                    <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#file_manager_image" data-image-type="editor"><i class="fa fa-image"></i>&nbsp;&nbsp;&nbsp;<?= trans("add_image"); ?></button>
                                </div>
                            </div>
                            <textarea class="tinyMCE form-control" name="content"><?= old('content'); ?></textarea>
                        </div>
                    </div>
                </div>

                <div class="box-footer">
                    <button type="submit" class="btn btn-primary pull-right"><?= trans('add_widget'); ?></button>
                </div>
            </form>
        </div>
    </div>
</div>

<?= view('admin/file-manager/_load_file_manager', ['loadImages' => true, 'loadFiles' => false, 'loadVideos' => false, 'loadAudios' => false]); ?>