<?php if (!empty($parentComment)):
    $subComments = getSubComments($parentComment->id);
    if (!empty($subComments)): ?>
        <div class="col-12">
            <div class="comments">
                <ul class="comment-list">
                    <?php foreach ($subComments as $subComment): ?>
                        <li>
                            <div class="left">
                                <?php if (!empty($subComment->user_slug)): ?>
                                    <a href="<?= generateProfileURL($subComment->user_slug); ?>"><img src="<?= getUserAvatar($subComment->user_avatar); ?>" alt="<?= esc($subComment->name); ?>"></a>
                                <?php else: ?>
                                    <img src="<?= getUserAvatar($subComment->user_avatar); ?>" alt="<?= esc($subComment->name); ?>">
                                <?php endif; ?>
                            </div>
                            <div class="right">
                                <div class="row-custom">
                                    <?php if (!empty($subComment->user_slug)): ?>
                                        <a href="<?= generateProfileURL($subComment->user_slug); ?>" class="username"><?= esc($subComment->name); ?></a>
                                    <?php else: ?>
                                        <span class="username"><?= esc($subComment->name); ?></span>
                                    <?php endif; ?>
                                </div>
                                <div class="row-custom comment">
                                    <?= esc($subComment->comment); ?>
                                </div>
                                <div class="row-custom">
                                    <div class="comment-meta">
                                        <span class="date"><?= timeAgo($subComment->created_at); ?></span>
                                        <a href="javascript:void(0)" class="btn-comment-like<?= isCommentVoted($subComment->id) ? ' comment-liked' : ''; ?><?= checkCommentOwner($subComment) ? ' comment-own' : ''; ?>" data-comment-id="<?= $subComment->id; ?>"><i class="icon-like"></i>&nbsp;<?= trans("like"); ?>&nbsp;(<span id="lbl_comment_like_count_<?= $subComment->id; ?>"><?= $subComment->like_count; ?></span>)</a>
                                        <?php if (authCheck()):
                                            if ($subComment->user_id == user()->id || user()->role == 'admin'): ?>
                                                <a href="javascript:void(0)" class="btn-delete-comment" onclick="deleteComment('<?= $subComment->id; ?>','<?= $post->id; ?>','<?= clrQuotes(trans("confirm_comment")); ?>');">&nbsp;<i class="icon-trash"></i>&nbsp;<?= trans("delete"); ?></a>
                                            <?php endif;
                                        endif; ?>
                                    </div>
                                </div>
                            </div>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>
    <?php endif;
endif; ?>