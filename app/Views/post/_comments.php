<input type="hidden" value="<?= $commentLimit; ?>" id="post_comment_limit">
<div class="row">
    <div class="col-sm-12">
        <div class="comments">
            <?php if ($commentCount > 0): ?>
                <div class="row-custom comment-total">
                    <label class="label-comment"><?= trans("comments"); ?> (<?= $commentCount; ?>)</label>
                </div>
            <?php endif; ?>
            <ul class="comment-list">
                <?php if (!empty($comments)):
                    foreach ($comments as $comment):?>
                        <li>
                            <div class="left">
                                <?php if (!empty($comment->user_slug)): ?>
                                    <a href="<?= generateProfileURL($comment->user_slug); ?>"><img src="<?= getUserAvatar($comment->user_avatar); ?>" alt="<?= esc($comment->name); ?>"></a>
                                <?php else: ?>
                                    <img src="<?= getUserAvatar($comment->user_avatar); ?>" alt="<?= esc($comment->name); ?>">
                                <?php endif; ?>
                            </div>
                            <div class="right">
                                <div class="row-custom">
                                    <?php if (!empty($comment->user_slug)): ?>
                                        <a href="<?= generateProfileURL($comment->user_slug); ?>" class="username"><?= esc($comment->name); ?></a>
                                    <?php else: ?>
                                        <span class="username"><?= esc($comment->name); ?></span>
                                    <?php endif; ?>
                                </div>
                                <div class="row-custom comment">
                                    <?= esc($comment->comment); ?>
                                </div>
                                <div class="row-custom">
                                    <div class="comment-meta">
                                        <span class="date"><?= timeAgo($comment->created_at); ?></span>
                                        <a href="javascript:void(0)" class="btn-reply" data-parent="<?= $comment->id; ?>"><i class="icon-reply"></i><?= trans('btn_reply'); ?></a>
                                        <a href="javascript:void(0)" class="btn-comment-like<?= isCommentVoted($comment->id) ? ' comment-liked' : ''; ?><?= checkCommentOwner($comment) ? ' comment-own' : ''; ?>" data-comment-id="<?= $comment->id; ?>"><i class="icon-like"></i>&nbsp;<?= trans("like"); ?>&nbsp;(<span id="lbl_comment_like_count_<?= $comment->id; ?>"><?= $comment->like_count; ?></span>)</a>
                                        <?php if (authCheck()):
                                            if ($comment->user_id == user()->id || user()->role == 'admin'): ?>
                                                <a href="javascript:void(0)" class="btn-delete-comment" onclick="deleteComment('<?= $comment->id; ?>','<?= $post->id; ?>','<?= clrQuotes(trans("confirm_comment")); ?>');">&nbsp;<i class="icon-trash"></i>&nbsp;<?= trans("delete"); ?></a>
                                            <?php endif;
                                        endif; ?>
                                    </div>
                                </div>
                                <div id="sub_comment_form_<?= $comment->id; ?>" class="row-custom row-sub-comment visible-sub-comment"></div>
                                <div class="row-custom row-sub-comment">
                                    <?= view('post/_subcomments', ['parentComment' => $comment]); ?>
                                </div>
                            </div>
                        </li>
                    <?php endforeach;
                endif; ?>
            </ul>
        </div>
    </div>
    <?php if ($commentCount > $commentLimit): ?>
        <div id="load_comment_spinner" class="col-sm-12 load-more-spinner">
            <div class="row">
                <div class="spinner">
                    <div class="bounce1"></div>
                    <div class="bounce2"></div>
                    <div class="bounce3"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <button type="button" class="btn-load-more" onclick="loadMoreComments('<?= $post->id; ?>');">
                <?= trans("load_more_comments"); ?>
            </button>
        </div>
    <?php endif; ?>
</div>
