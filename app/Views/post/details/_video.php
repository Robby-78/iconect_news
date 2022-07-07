<link href="<?= base_url('assets/vendor/plyr/plyr.css'); ?>" rel="stylesheet"/>
<div class="show-on-page-load">
    <?php if (!empty($post->video_path)):
        $videoBaseURL = getBaseURLByStorage($post->video_storage); ?>
        <div class="video-player">
            <video id="player" playsinline controls>
                <source src="<?= $videoBaseURL . $post->video_path; ?>" type="video/mp4">
                <source src="<?= $videoBaseURL . $post->video_path; ?>" type="video/webm">
            </video>
        </div>
    <?php elseif (strpos($post->video_url, 'www.facebook.com') !== false): ?>
        <div class="post-image post-video">
            <div id="fb-root"></div>
            <script async defer src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2"></script>
            <div class="fb-video" data-href="<?= $post->video_url; ?>" data-allowfullscreen="true" data-autoplay="false" data-show-captions="true"></div>
        </div>
    <?php elseif (!empty($post->video_embed_code)): ?>
        <div class="post-image post-video">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="<?= $post->video_embed_code; ?>" allowfullscreen></iframe>
            </div>
        </div>
    <?php endif; ?>
</div>