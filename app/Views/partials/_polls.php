<div class="sidebar-widget">
    <div class="widget-head"><h4 class="title"><?= esc($widget->title); ?></h4></div>
    <div class="widget-body">
        <?php $polls = getPollsByActiveLang();
        if (!empty($polls)):
            foreach ($polls as $poll):
                if ($poll->status == 1):
                    if ($poll->vote_permission == "all"): ?>
                        <div id="poll_<?= $poll->id; ?>" class="poll">
                            <div class="question">
                                <form data-form-id="<?= $poll->id; ?>" class="poll-form" method="post">
                                    <input type="hidden" name="poll_id" value="<?= $poll->id; ?>">
                                    <h5 class="title"><?= esc($poll->question); ?></h5>
                                    <?php for ($i = 1; $i <= 10; $i++):
                                        $option = "option" . $i;
                                        if (!empty($poll->$option)): ?>
                                            <p class="option">
                                                <label class="custom-checkbox custom-radio">
                                                    <input type="radio" name="option" id="option<?= $poll->id; ?>-<?= $i; ?>" value="<?= $option; ?>">
                                                    <span class="checkbox-icon"><i class="icon-check"></i></span>
                                                    <span class="label-poll-option"><?= esc($poll->$option); ?></span>
                                                </label>
                                            </p>
                                        <?php endif;
                                    endfor; ?>
                                    <p class="button-cnt">
                                        <button type="submit" class="btn btn-sm btn-custom"><?= trans("vote"); ?></button>
                                        <a onclick="viewPollResults('<?= $poll->id; ?>');" class="a-view-results"><?= trans("view_results"); ?></a>
                                    </p>
                                    <div id="poll-required-message-<?= $poll->id; ?>" class="poll-error-message">
                                        <?= trans("please_select_option"); ?>
                                    </div>
                                    <div id="poll-error-message-<?= $poll->id; ?>" class="poll-error-message">
                                        <?= trans("voted_message"); ?>
                                    </div>
                                </form>
                            </div>
                            <div class="result" id="poll-results-<?= $poll->id; ?>">
                                <h5 class="title"><?= esc($poll->question); ?></h5>
                                <?php $totalVote = calculateTotalVotePollOption($poll); ?>
                                <p class="total-vote"><?= trans("total_vote"); ?>&nbsp;<?= $totalVote; ?></p>
                                <?php for ($i = 1; $i <= 10; $i++):
                                    $option = "option" . $i;
                                    $paramVoteCount = "option" . $i . "_vote_count";
                                    $percent = 0;
                                    if (!empty($poll->$option)):
                                        $optionVote = $poll->$paramVoteCount;
                                        if ($totalVote > 0):
                                            $percent = round(($optionVote * 100) / $totalVote, 1);
                                        endif; ?>
                                        <span class="m-b-10 display-block"><?= esc($poll->$option); ?></span>
                                        <?php if ($percent == 0): ?>
                                        <div class="progress">
                                            <span><?= $percent; ?>&nbsp;%</span>
                                            <div class="progress-bar progress-bar-0" role="progressbar" aria-valuenow="<?= $totalVote; ?>" aria-valuemin="0" aria-valuemax="100" style="width:<?= $percent; ?>%"></div>
                                        </div>
                                    <?php else: ?>
                                        <div class="progress">
                                            <span><?= $percent; ?>&nbsp;%</span>
                                            <div class="progress-bar" role="progressbar" aria-valuenow="<?= $totalVote; ?>" aria-valuemin="0" aria-valuemax="100" style="width:<?= $percent; ?>%"></div>
                                        </div>
                                    <?php endif;
                                    endif;
                                endfor; ?>
                                <p><a onclick="viewPollOptions('<?= $poll->id; ?>');" class="a-view-results m-0"><?= trans("view_options"); ?></a></p>
                            </div>
                        </div>
                    <?php else: ?>
                        <div id="poll_<?= $poll->id; ?>" class="poll">
                            <div class="question">
                                <form data-form-id="<?= $poll->id; ?>" class="poll-form" method="post">
                                    <input type="hidden" name="poll_id" value="<?= $poll->id; ?>">
                                    <h5 class="title"><?= esc($poll->question); ?></h5>
                                    <?php for ($i = 1; $i <= 10; $i++):
                                        $option = "option" . $i;
                                        if (!empty($poll->$option)): ?>
                                            <p class="option">
                                                <label class="custom-checkbox custom-radio">
                                                    <input type="radio" name="option" id="option<?= $poll->id; ?>-<?= $i; ?>" value="<?= $option; ?>">
                                                    <span class="checkbox-icon"><i class="icon-check"></i></span>
                                                    <span class="label-poll-option"><?= esc($poll->$option); ?></span>
                                                </label>
                                            </p>
                                        <?php
                                        endif;
                                    endfor; ?>
                                    <?php if (authCheck()): ?>
                                        <p class="button-cnt">
                                            <button type="submit" class="btn btn-sm btn-custom"><?= trans("vote"); ?></button>
                                            <a onclick="viewPollResults('<?= $poll->id; ?>');" class="a-view-results"><?= trans("view_results"); ?></a>
                                        </p>
                                    <?php else: ?>
                                        <p class="button-cnt">
                                            <button type="button" class="btn btn-sm btn-custom" data-toggle="modal" data-target="#modal-login"><?= trans("vote"); ?></button>
                                            <a href="#" class="a-view-results" data-toggle="modal" data-target="#modal-login"><?= trans("view_results"); ?></a>
                                        </p>
                                    <?php endif; ?>
                                    <div id="poll-required-message-<?= $poll->id; ?>" class="poll-error-message">
                                        <?= trans("please_select_option"); ?>
                                    </div>
                                    <div id="poll-error-message-<?= $poll->id; ?>" class="poll-error-message">
                                        <?= trans("voted_message"); ?>
                                    </div>
                                </form>
                            </div>
                            <div class="result" id="poll-results-<?= $poll->id; ?>">
                                <h5 class="title"><?= esc($poll->question); ?></h5>
                                <?php $totalVote = calculateTotalVotePollOption($poll); ?>
                                <p class="total-vote"><?= trans("total_vote"); ?>&nbsp;<?= $totalVote; ?></p>
                                <?php for ($i = 1; $i <= 10; $i++):
                                    $option = "option" . $i;
                                    $paramVoteCount = "option" . $i . "_vote_count";
                                    $percent = 0;
                                    if (!empty($poll->$option)):
                                        $optionVote = $poll->$paramVoteCount;
                                        if ($totalVote > 0):
                                            $percent = round(($optionVote * 100) / $totalVote, 1);
                                        endif; ?>
                                        <span class="m-b-10 display-block"><?= esc($poll->$option); ?></span>
                                        <?php if ($percent == 0): ?>
                                        <div class="progress">
                                            <span><?= $percent; ?>&nbsp;%</span>
                                            <div class="progress-bar progress-bar-0" role="progressbar" aria-valuenow="<?= $totalVote; ?>" aria-valuemin="0" aria-valuemax="100" style="width:<?= $percent; ?>%"></div>
                                        </div>
                                    <?php else: ?>
                                        <div class="progress">
                                            <span><?= $percent; ?>&nbsp;%</span>
                                            <div class="progress-bar" role="progressbar" aria-valuenow="<?= $totalVote; ?>" aria-valuemin="0" aria-valuemax="100" style="width:<?= $percent; ?>%"></div>
                                        </div>
                                    <?php endif;
                                    endif;
                                endfor; ?>
                                <p><a onclick="viewPollOptions('<?= $poll->id; ?>');" class="a-view-results m-0"><?= trans("view_options"); ?></a></p>
                            </div>
                        </div>
                    <?php endif;
                endif;
            endforeach;
        endif; ?>
    </div>
</div>