<div class="row">
    <div class="col-sm-12">
        <div class="box box-primary" style="background-color: transparent;border: 0;box-shadow: none;">
            <div class="box-header with-border"></div>
            <div class="box-body">
                <?= view('admin/includes/_messages'); ?>
                <form action="<?= base_url('AdminController/setThemePost'); ?>" method="post">
                    <?= csrf_field(); ?>
                    <div class="row-layout-items">
                        <div class="layout-item <?= $generalSettings->theme_mode == 'light' ? 'active' : ''; ?>" data-val="layout_1" onclick="set_theme('layout_1');">
                            <button type="submit" name="theme_mode" value="light" class="btn btn-block" style="width: 318px;">
                                <div style="width: 308px; height: 360.7px;">
                                    <img src="<?= base_url('assets/admin/img/theme_light.jpg'); ?>" alt="" class="img-responsive">
                                </div>
                                <p><?= $generalSettings->theme_mode == 'light' ? trans("activated") : trans("activate"); ?></p>
                            </button>
                        </div>
                        <div class="layout-item <?= $generalSettings->theme_mode == 'dark' ? 'active' : ''; ?>" data-val="layout_2" onclick="set_theme('layout_2');">
                            <button type="submit" name="theme_mode" value="dark" class="btn btn-block" style="width: 318px;">
                                <div style="width: 308px; height: 360.7px;">
                                    <img src="<?= base_url('assets/admin/img/theme_dark.jpg'); ?>" alt="" class="img-responsive">
                                </div>
                                <p><?= $generalSettings->theme_mode == 'dark' ? trans("activated") : trans("activate"); ?></p>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>