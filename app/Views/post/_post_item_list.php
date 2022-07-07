<?php if ($generalSettings->post_list_style == "vertical"): ?>
<div class="col-sm-6 col-xs-12">
<?= view("post/_post_item"); ?>
</div>
<?php else:
echo view("post/_post_item_horizontal");
endif; ?>