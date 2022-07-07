<div class="row">
    <div class="col-sm-12">
        <?= view('admin/includes/_messages'); ?>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <form action="<?= base_url('AdminController/generalSettingsPost'); ?>" method="post">
            <?= csrf_field(); ?>
            <div class="form-group">
                <label><?= trans("settings_language"); ?></label>
                <select name="lang_id" class="form-control max-500" onchange="window.location.href = '<?= adminUrl(); ?>'+'/general-settings?lang='+this.value;">
                    <?php foreach ($activeLanguages as $language): ?>
                        <option value="<?= $language->id; ?>" <?= $settingsLangId == $language->id ? 'selected' : ''; ?>><?= $language->name; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true"><?= trans('general_settings'); ?></a></li>
                    <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="false"><?= trans('contact_settings'); ?></a></li>
                    <li class=""><a href="#tab_4" data-toggle="tab" aria-expanded="false"><?= trans('social_media_settings'); ?></a></li>
                    <li class=""><a href="#tab_5" data-toggle="tab" aria-expanded="false"><?= trans('facebook_comments'); ?></a></li>
                    <li class=""><a href="#tab_6" data-toggle="tab" aria-expanded="false"><?= trans('cookies_warning'); ?></a></li>
                    <li class=""><a href="#tab_7" data-toggle="tab" aria-expanded="false"><?= trans('custom_header_codes'); ?></a></li>
                    <li class=""><a href="#tab_8" data-toggle="tab" aria-expanded="false"><?= trans('custom_footer_codes'); ?></a></li>
                </ul>
                <div class="tab-content settings-tab-content">
                    <div class="tab-pane active" id="tab_1">
                        <div class="form-group">
                            <label class="control-label"><?= trans('timezone'); ?></label>
                            <select name="timezone" class="form-control max-600">
                                <?php $timezones = timezone_identifiers_list();
                                if (!empty($timezones)):
                                    foreach ($timezones as $timezone):?>
                                        <option value="<?= $timezone; ?>" <?= $timezone == $generalSettings->timezone ? 'selected' : ''; ?>><?= $timezone; ?></option>
                                    <?php endforeach;
                                endif; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="control-label"><?= trans('app_name'); ?></label>
                            <input type="text" class="form-control" name="application_name" placeholder="<?= trans('app_name'); ?>" value="<?= esc($settings->application_name); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label"><?= trans('footer_about_section'); ?></label>
                            <textarea class="form-control text-area" name="about_footer" placeholder="<?= trans('footer_about_section'); ?>" style="min-height: 140px;"><?= esc($settings->about_footer); ?></textarea>
                        </div>

                        <div class="form-group">
                            <label class="control-label"><?= trans('optional_url_name'); ?></label>
                            <input type="text" class="form-control" name="optional_url_button_name" placeholder="<?= trans('optional_url_name'); ?>" value="<?= esc($settings->optional_url_button_name); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label"><?= trans('copyright'); ?></label>
                            <input type="text" class="form-control" name="copyright" placeholder="<?= trans('copyright'); ?>" value="<?= esc($settings->copyright); ?>">
                        </div>
                    </div>

                    <div class="tab-pane" id="tab_3">
                        <div class="form-group">
                            <label class="control-label"><?= trans('address'); ?></label>
                            <input type="text" class="form-control" name="contact_address" placeholder="<?= trans('address'); ?>" value="<?= esc($settings->contact_address); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label"><?= trans('email'); ?></label>
                            <input type="text" class="form-control" name="contact_email" placeholder="<?= trans('email'); ?>" value="<?= esc($settings->contact_email); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label"><?= trans('phone'); ?></label>
                            <input type="text" class="form-control" name="contact_phone" placeholder="<?= trans('phone'); ?>" value="<?= esc($settings->contact_phone); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label"><?= trans('contact_text'); ?></label>
                            <textarea class="tinyMCE form-control" name="contact_text"><?= $settings->contact_text; ?></textarea>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab_4">
                        <div class="form-group">
                            <label class="control-label">Facebook <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="facebook_url" placeholder="Facebook <?= trans('url'); ?>" value="<?= esc($settings->facebook_url); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Twitter <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="twitter_url" placeholder="Twitter <?= trans('url'); ?>" value="<?= esc($settings->twitter_url); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Instagram <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="instagram_url" placeholder="Instagram <?= trans('url'); ?>" value="<?= esc($settings->instagram_url); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Pinterest <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="pinterest_url" placeholder="Pinterest <?= trans('url'); ?>" value="<?= esc($settings->pinterest_url); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label">LinkedIn <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="linkedin_url" placeholder="LinkedIn <?= trans('url'); ?>" value="<?= esc($settings->linkedin_url); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label">VK <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="vk_url" placeholder="VK <?= trans('url'); ?>" value="<?= esc($settings->vk_url); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Telegram <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="telegram_url" placeholder="Telegram <?= trans('url'); ?>" value="<?= esc($settings->telegram_url); ?>">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Youtube <?= trans('url'); ?></label>
                            <input type="text" class="form-control" name="youtube_url" placeholder="Youtube <?= trans('url'); ?>" value="<?= esc($settings->youtube_url); ?>">
                        </div>
                    </div>

                    <div class="tab-pane" id="tab_5">
                        <div class="form-group">
                            <label class="control-label"><?= trans('facebook_comments_code'); ?></label>
                            <textarea class="form-control text-area" name="facebook_comment" placeholder="<?= trans('facebook_comments_code'); ?>" style="min-height: 140px;"><?= $generalSettings->facebook_comment; ?></textarea>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab_6">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-3 col-xs-12 col-option">
                                    <label><?= trans('show_cookies_warning'); ?></label>
                                </div>
                                <div class="col-md-2 col-sm-4 col-xs-12 col-option">
                                    <input type="radio" name="cookies_warning" value="1" id="cookies_warning_1" class="square-purple" <?= $settings->cookies_warning == 1 ? 'checked' : ''; ?>>
                                    <label for="cookies_warning_1" class="option-label"><?= trans('yes'); ?></label>
                                </div>
                                <div class="col-md-2 col-sm-4 col-xs-12 col-option">
                                    <input type="radio" name="cookies_warning" value="0" id="cookies_warning_2" class="square-purple" <?= $settings->cookies_warning != 1 ? 'checked' : ''; ?>>
                                    <label for="cookies_warning_2" class="option-label"><?= trans('no'); ?></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label"><?= trans('cookies_warning_text'); ?></label>
                            <textarea class="form-control tinyMCE" name="cookies_warning_text"><?= $settings->cookies_warning_text; ?></textarea>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab_7">
                        <div class="form-group">
                            <label class="control-label"><?= trans('custom_header_codes'); ?></label>&nbsp;<small class="small-title-inline">(<?= trans("custom_header_codes_exp"); ?>)</small>
                            <textarea class="form-control text-area" name="custom_header_codes" placeholder="<?= trans('custom_header_codes'); ?>" style="min-height: 200px;"><?= $generalSettings->custom_header_codes; ?></textarea>
                        </div>
                        E.g. <?= esc("<style> body {background-color: #00a65a;} </style>"); ?>
                    </div>

                    <div class="tab-pane" id="tab_8">
                        <div class="form-group">
                            <label class="control-label"><?= trans('custom_footer_codes'); ?></label>&nbsp;<small class="small-title-inline">(<?= trans("custom_footer_codes_exp"); ?>)</small>
                            <textarea class="form-control text-area" name="custom_footer_codes" placeholder="<?= trans('custom_footer_codes'); ?>" style="min-height: 200px;"><?= $generalSettings->custom_footer_codes; ?></textarea>
                        </div>
                        E.g. <?= esc("<script> alert('Hello!'); </script>"); ?>
                    </div>
                </div>

                <div class="box-footer">
                    <button type="submit" class="btn btn-primary pull-right"><?= trans('save_changes'); ?></button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-lg-6 col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= trans('google_recaptcha'); ?></h3>
            </div>
            <form action="<?= base_url('AdminController/recaptchaSettingsPost'); ?>" method="post">
                <?= csrf_field(); ?>
                <div class="box-body">
                    <div class="form-group">
                        <label class="control-label"><?= trans('site_key'); ?></label>
                        <input type="text" class="form-control" name="recaptcha_site_key" placeholder="<?= trans('site_key'); ?>" value="<?= $generalSettings->recaptcha_site_key; ?>">
                    </div>

                    <div class="form-group">
                        <label class="control-label"><?= trans('secret_key'); ?></label>
                        <input type="text" class="form-control" name="recaptcha_secret_key" placeholder="<?= trans('secret_key'); ?>" value="<?= $generalSettings->recaptcha_secret_key; ?>">
                    </div>
                    <div class="box-footer" style="padding-left: 0; padding-right: 0;">
                        <button type="submit" class="btn btn-primary pull-right"><?= trans('save_changes'); ?></button>
                    </div>
            </form>
        </div>
    </div>
</div>

<div class="col-lg-6 col-md-12">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title"><?= trans('maintenance_mode'); ?></h3>
        </div>
        <form action="<?= base_url('AdminController/maintenanceModePost'); ?>" method="post">
            <?= csrf_field(); ?>
            <div class="box-body">
                <div class="form-group">
                    <label class="control-label"><?= trans('title'); ?></label>
                    <input type="text" class="form-control" name="maintenance_mode_title" placeholder="<?= trans('title'); ?>" value="<?= $generalSettings->maintenance_mode_title; ?>">
                </div>

                <div class="form-group">
                    <label class="control-label"><?= trans('description'); ?></label>
                    <textarea class="form-control text-area" name="maintenance_mode_description" placeholder="<?= trans('description'); ?>" style="min-height: 100px;"><?= esc($generalSettings->maintenance_mode_description); ?></textarea>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-4 col-xs-12">
                            <label><?= trans('status'); ?></label>
                        </div>
                        <div class="col-sm-4 col-xs-12 col-option">
                            <input type="radio" name="maintenance_mode_status" value="1" id="maintenance_mode_status_1" class="square-purple" <?= $generalSettings->maintenance_mode_status == 1 ? 'checked' : ''; ?>>
                            <label for="maintenance_mode_status_1" class="option-label"><?= trans('enable'); ?></label>
                        </div>
                        <div class="col-sm-4 col-xs-12 col-option">
                            <input type="radio" name="maintenance_mode_status" value="0" id="maintenance_mode_status_2" class="square-purple" <?= $generalSettings->maintenance_mode_status != 1 ? 'checked' : ''; ?>>
                            <label for="maintenance_mode_status_2" class="option-label"><?= trans('disable'); ?></label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label><?= trans('image'); ?></label>: assets/img/maintenance_bg.jpg
                </div>
            </div>

            <div class="box-footer">
                <button type="submit" class="btn btn-primary pull-right"><?= trans('save_changes'); ?></button>
            </div>
        </form>
    </div>
</div>

<style>
    .tox-tinymce {
        height: 340px !important;
    }
</style>