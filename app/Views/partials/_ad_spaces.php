<?php if (!empty($adSpace)):
    $adCodes = null;
    if (!empty($adSpaces)) {
        foreach ($adSpaces as $item) {
            if ($item->ad_space == $adSpace) {
                $adCodes = $item;
            }
        }
    }
    if (!empty($adCodes)):
        if ($adSpace == 'sidebar_top' || $adSpace == 'sidebar_bottom'):
            if (strTrim($adCodes->ad_code_300) != ''):?>
                <div class="col-sm-12 col-xs-12 bn-lg-sidebar <?= isset($class) ? $class : ''; ?>">
                    <div class="row">
                        <?= strTrim($adCodes->ad_code_300); ?>
                    </div>
                </div>
            <?php endif;
        else:
            if (strTrim($adCodes->ad_code_728) != ''):?>
                <section class="col-sm-12 col-xs-12 bn-lg <?= isset($class) ? $class : ''; ?>">
                    <div class="row">
                        <?= strTrim($adCodes->ad_code_728); ?>
                    </div>
                </section>
            <?php endif;
            if (strTrim($adCodes->ad_code_468) != ''): ?>
                <section class="col-sm-12 col-xs-12 bn-md <?= isset($class) ? $class : ''; ?>">
                    <div class="row">
                        <?= strTrim($adCodes->ad_code_468); ?>
                    </div>
                </section>
            <?php endif;
        endif;
        if (strTrim($adCodes->ad_code_234) != ''): ?>
            <section class="col-sm-12 col-xs-12 bn-sm <?= isset($class) ? $class : ''; ?>">
                <div class="row">
                    <?= strTrim($adCodes->ad_code_234); ?>
                </div>
            </section>
        <?php endif;
    endif;
endif; ?>


