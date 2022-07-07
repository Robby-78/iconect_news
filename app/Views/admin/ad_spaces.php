<div class="row">
    <div class="col-sm-12">
        <?= view('admin/includes/_messages'); ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= trans('ad_spaces'); ?></h3>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label><?= trans('select_ad_spaces'); ?></label>
                    <select class="form-control custom-select" name="parent_id" onchange="window.location.href = '<?= adminUrl(); ?>'+'/ad-spaces?ad_space='+this.value;">
                        <?php foreach ($arrayAdSpaces as $key => $value): ?>
                            <option value="<?= $key; ?>" <?= $key == $adCodes->ad_space ? 'selected' : ''; ?>><?= esc($value); ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <form action="<?= base_url('AdminController/adSpacesPost'); ?>" method="post" enctype="multipart/form-data">
                    <?= csrf_field(); ?>
                    <input type="hidden" name="ad_space" value="<?= esc($adCodes->ad_space); ?>">
                    <?php if ($adCodes->ad_space == 'sidebar_top' || $adCodes->ad_space == 'sidebar_bottom'): ?>
                        <div class="form-group">
                            <?php if (!empty($arrayAdSpaces[$adCodes->ad_space])): ?>
                                <h4><?= trans($adCodes->ad_space . '_ad_space'); ?></h4>
                            <?php endif; ?>

                            <p><strong>300x250 <?= trans('banner'); ?></strong></p>
                            <div class="row row-ad-space">
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('paste_ad_code'); ?></label>
                                    <textarea class="form-control text-area-adspace" name="ad_code_300" placeholder="<?= trans('paste_ad_code'); ?>"><?= $adCodes->ad_code_300; ?></textarea>
                                </div>
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('upload_your_banner'); ?></label>
                                    <input type="text" class="form-control" name="url_ad_code_300" placeholder="<?= trans('paste_ad_url'); ?>">
                                    <div class="row m-t-15">
                                        <div class="col-sm-12">
                                            <a class='btn bg-olive btn-sm btn-file-upload'>
                                                <?= trans('select_image'); ?>
                                                <input type="file" name="file_ad_code_300" size="40" accept=".png, .jpg, .jpeg, .gif" onchange="$('#upload-file-info2').html($(this).val().replace(/.*[\/\\]/, ''));">
                                            </a>
                                        </div>
                                    </div>
                                    <span class='label label-info' id="upload-file-info2"></span>
                                </div>
                            </div>

                            <p class="m-t-15"><strong>234x60 <?= trans('banner'); ?></strong></p>
                            <div class="row row-ad-space">
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('paste_ad_code'); ?></label>
                                    <textarea class="form-control text-area-adspace" name="ad_code_234" placeholder="<?= trans('paste_ad_code'); ?>"><?= $adCodes->ad_code_234; ?></textarea>
                                </div>
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('upload_your_banner'); ?></label>
                                    <input type="text" class="form-control" name="url_ad_code_234" placeholder="<?= trans('paste_ad_url'); ?>">
                                    <div class="row m-t-15">
                                        <div class="col-sm-12">
                                            <a class='btn bg-olive btn-sm btn-file-upload'>
                                                <?= trans('select_image'); ?>
                                                <input type="file" name="file_ad_code_234" size="40" accept=".png, .jpg, .jpeg, .gif" onchange="$('#upload-file-info3').html($(this).val().replace(/.*[\/\\]/, ''));">
                                            </a>
                                        </div>
                                    </div>
                                    <span class='label label-info' id="upload-file-info3"></span>
                                </div>
                            </div>

                            <div class="row row-ad-space row-button">
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary pull-right"><?= trans('save_changes'); ?></button>
                                </div>
                            </div>
                        </div>
                    <?php else: ?>
                        <div class="form-group">
                            <?php if (!empty($arrayAdSpaces[$adCodes->ad_space])): ?>
                                <h4><?= trans($adCodes->ad_space . "_ad_space"); ?></h4>
                            <?php endif; ?>

                            <p><strong>728x90 <?= trans('banner'); ?></strong></p>
                            <div class="row row-ad-space">
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('paste_ad_code'); ?></label>
                                    <textarea class="form-control text-area-adspace" name="ad_code_728" placeholder="<?= trans('paste_ad_code'); ?>"><?= $adCodes->ad_code_728; ?></textarea>
                                </div>
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('upload_your_banner'); ?></label>
                                    <input type="text" class="form-control" name="url_ad_code_728" placeholder="<?= trans('paste_ad_url'); ?>">
                                    <div class="row m-t-15">
                                        <div class="col-sm-12">
                                            <a class='btn bg-olive btn-sm btn-file-upload'>
                                                <?= trans('select_image'); ?>
                                                <input type="file" name="file_ad_code_728" size="40" accept=".png, .jpg, .jpeg, .gif" onchange="$('#upload-file-info1').html($(this).val().replace(/.*[\/\\]/, ''));">
                                            </a>
                                        </div>
                                    </div>
                                    <span class='label label-info' id="upload-file-info1"></span>
                                </div>
                            </div>

                            <p class="m-t-15"><strong>468x60 <?= trans('banner'); ?></strong></p>
                            <div class="row row-ad-space">
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('paste_ad_code'); ?></label>
                                    <textarea class="form-control text-area-adspace" name="ad_code_468" placeholder="<?= trans('paste_ad_code'); ?>"><?= $adCodes->ad_code_468; ?></textarea>
                                </div>
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('upload_your_banner'); ?></label>
                                    <input type="text" class="form-control" name="url_ad_code_468" placeholder="<?= trans('paste_ad_url'); ?>">
                                    <div class="row m-t-15">
                                        <div class="col-sm-12">
                                            <a class='btn bg-olive btn-sm btn-file-upload'>
                                                <?= trans('select_image'); ?>
                                                <input type="file" name="file_ad_code_468" size="40" accept=".png, .jpg, .jpeg, .gif" onchange="$('#upload-file-info2').html($(this).val().replace(/.*[\/\\]/, ''));">
                                            </a>
                                        </div>
                                    </div>
                                    <span class='label label-info' id="upload-file-info2"></span>
                                </div>
                            </div>

                            <p class="m-t-15"><strong>234x60 <?= trans('banner'); ?></strong></p>
                            <div class="row row-ad-space">
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('paste_ad_code'); ?></label>
                                    <textarea class="form-control text-area-adspace" name="ad_code_234" placeholder="<?= trans('paste_ad_code'); ?>"><?= $adCodes->ad_code_234; ?></textarea>
                                </div>
                                <div class="col-sm-6">
                                    <label class="control-label"><?= trans('upload_your_banner'); ?></label>
                                    <input type="text" class="form-control" name="url_ad_code_234" placeholder="<?= trans('paste_ad_url'); ?>">
                                    <div class="row m-t-15">
                                        <div class="col-sm-12">
                                            <a class='btn bg-olive btn-sm btn-file-upload'>
                                                <?= trans('select_image'); ?>
                                                <input type="file" name="file_ad_code_234" size="40" accept=".png, .jpg, .jpeg, .gif" onchange="$('#upload-file-info3').html($(this).val().replace(/.*[\/\\]/, ''));">
                                            </a>
                                        </div>
                                    </div>
                                    <span class='label label-info' id="upload-file-info3"></span>
                                </div>
                            </div>
                            <div class="row row-ad-space row-button">
                                <div class="col-sm-12">
                                    <button type="submit" class="btn btn-primary pull-right"><?= trans('save_changes'); ?></button>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-6 col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= trans('adsense_activation_code'); ?></h3><small class="small-title"><?= trans("custom_footer_codes_exp"); ?></small>
            </div>
            <form action="<?= base_url('AdminController/googleAdsenseCodePost'); ?>" method="post">
                <?= csrf_field(); ?>
                <div class="box-body">
                    <div class="form-group">
                        <textarea name="adsense_activation_code" class="form-control" placeholder="<?= trans('adsense_activation_code'); ?>" style="min-height: 140px;"><?= $generalSettings->adsense_activation_code; ?></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary pull-right"><?= trans('save_changes'); ?></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    textarea {
        height: 100px !important;
    }

    h4 {
        color: #0d6aad;
        text-align: left;
        font-weight: 600;
        margin-bottom: 15px;
        margin-top: 30px;
    }

    .row-ad-space {
        padding: 15px 0;
        background-color: #f7f7f7;
    }

    .row-button {
        background-color: transparent !important;
        min-height: 60px;
    }
</style>
<?php if ($activeLang->text_direction == "rtl"): ?>
    <style>
        h4 {
            text-align: right;
        }
    </style>
<?php endif; ?>
