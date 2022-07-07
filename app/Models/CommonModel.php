<?php namespace App\Models;

use CodeIgniter\Model;

class CommonModel extends BaseModel
{
    public function __construct()
    {
        parent::__construct();
        $this->builderContact = $this->db->table('contacts');
        $this->builderComments = $this->db->table('comments');
        $this->builderAds = $this->db->table('ad_spaces');
    }

    /*
    * --------------------------------------------------------------------
    * CONTACT
    * --------------------------------------------------------------------
    */

    //add contact message
    public function addContactMessage()
    {
        $data = [
            'name' => inputPost('name'),
            'email' => inputPost('email'),
            'message' => inputPost('message')
        ];
        $data['created_at'] = date('Y-m-d H:i:s');
        $result = $this->builderContact->insert($data);
        if ($this->generalSettings->mail_contact_status == 1) {
            $emailModel = new EmailModel();
            $emailModel->sendEmailContactMessage($data['name'], $data['email'], $data['message']);
        }
        return $result;
    }

    //get contact messages
    public function getContactMessages($limit = null)
    {
        if ($limit != null) {
            $this->builderContact->limit(cleanNumber($limit));
        }
        return $this->builderContact->orderBy('id DESC')->get()->getResult();
    }

    //get latest comments
    public function getLatestComments($status, $limit)
    {
        return $this->builderComments->join('posts', 'posts.id = comments.post_id')->select('comments.*, posts.title_slug AS post_slug')
            ->where('comments.status', cleanNumber($status))->orderBy('comments.id DESC')->get(cleanNumber($limit))->getResult();
    }

    //get contact message
    public function getContactMessage($id)
    {
        return $this->builderContact->where('id', cleanNumber($id))->get()->getRow();
    }

    //get last contact messages
    public function get_last_contact_messages()
    {
        $query = $this->db->query("SELECT * FROM contacts ORDER BY contacts.id DESC LIMIT 5");
        return $query->result();
    }

    //delete contact message
    public function deleteContactMessage($id)
    {
        $contact = $this->getContactMessage($id);
        if (!empty($contact)) {
            return $this->builderContact->where('id', cleanNumber($id))->delete();
        }
        return false;
    }

    //delete multi contact messages
    public function deleteMultiMessages()
    {
        $messagesIds = inputPost('messages_ids');
        if (!empty($messagesIds)) {
            foreach ($messagesIds as $id) {
                $this->deleteContactMessage($id);
            }
        }
    }

    /*
    * --------------------------------------------------------------------
    * COMMENTS
    * --------------------------------------------------------------------
    */

    //add comment
    public function addComment()
    {
        $data = [
            'parent_id' => inputPost('parent_id'),
            'post_id' => inputPost('post_id'),
            'name' => inputPost('name'),
            'email' => inputPost('email'),
            'comment' => inputPost('comment'),
            'status' => 1,
            'ip_address' => 0,
        ];
        if (empty($data['parent_id'])) {
            $data['parent_id'] = 0;
        }
        if (!empty($data['post_id']) && !empty($data['comment'])) {
            $data['user_id'] = 0;
            if (authCheck()) {
                $data['user_id'] = user()->id;
                $data['name'] = user()->username;
                $data['email'] = user()->email;
            }
            $ip = getIPAddress();
            if (!empty($ip)) {
                $data['ip_address'] = $ip;
            }
            if ($this->generalSettings->comment_approval_system == 1 && !checkUserPermission('comments_contact')) {
                $data['status'] = 0;
            }
            $data['created_at'] = date('Y-m-d H:i:s');
            if ($this->builderComments->insert($data)) {
                $lastId = $this->db->insertID();
                helperSetCookie('added_comment_id_' . $lastId, 1);
            }
        }
    }

    //like comment
    public function likeComment($commentId)
    {
        $comment = $this->getComment($commentId);
        if (!empty($comment)) {
            $likeCount = $comment->like_count;
            //check comment owner
            if (checkCommentOwner($comment)) {
                return $likeCount;
            }
            $cookie = helperGetCookie('comment_voted_' . $comment->id);
            $newCookie = '';
            if (!empty($cookie)) {
                $likeCount = $likeCount - 1;
                $newCookie = '';
            } else {
                $likeCount = $likeCount + 1;
                $newCookie = 1;
            }
            if ($likeCount < 0) {
                $likeCount = 0;
            }
            if ($this->builderComments->where('id', $comment->id)->update(['like_count' => $likeCount])) {
                helperSetCookie('comment_voted_' . $comment->id, $newCookie);
                return $likeCount;
            }
        }
        return 0;
    }

    //get comment
    public function getComment($id)
    {
        return $this->builderComments->where('comments.id', cleanNumber($id))->get()->getRow();
    }

    //comments
    public function getComments($postId, $limit)
    {
        return $this->builderComments->join('users', 'users.id = comments.user_id', 'left')->select('comments.*, users.username AS user_username, users.slug AS user_slug, users.avatar AS user_avatar')
            ->where('comments.post_id', cleanNumber($postId))->where('comments.parent_id = 0')->where('comments.status = 1')->orderBy('comments.id DESC')->get(cleanNumber($limit))->getResult();
    }

    //get approved comments count
    public function getCommentsCount($status)
    {
        return $this->builderComments->join('posts', 'posts.id = comments.post_id')->select('comments.*, posts.title_slug AS post_slug')
            ->where('comments.status', cleanNumber($status))->countAllResults();
    }

    //get approved comments
    public function getCommentsPaginated($status, $perPage, $offset)
    {
        return $this->builderComments->join('posts', 'posts.id = comments.post_id')->select('comments.*, posts.title AS post_title, posts.title_slug AS post_slug, posts.lang_id AS post_lang_id')
            ->where('comments.status', cleanNumber($status))->orderBy('comments.id DESC')->limit($perPage, $offset)->get()->getResult();
    }

    //subomments
    public function getSubComments($parentId)
    {
        return $this->builderComments->join('users', 'users.id = comments.user_id', 'left')->select('comments.*, users.username AS user_username, users.slug AS user_slug, users.avatar AS user_avatar')
            ->where('comments.parent_id', cleanNumber($parentId))->where('comments.status = 1')->orderBy('comments.id DESC')->get()->getResult();
    }

    //get comment count by post id
    public function getCommentCountByPostId($postId)
    {
        return $this->builderComments->where('comments.post_id', cleanNumber($postId))->where('parent_id = 0')->where('status = 1')->countAllResults();
    }

    //approve comment
    public function approveComment($id)
    {
        $comment = $this->getComment($id);
        if (!empty($comment)) {
            return $this->builderComments->where('id', $comment->id)->update(['status' => 1]);
        }
        return false;
    }

    //approve multi comments
    public function approveMultiComments()
    {
        $commentIds = inputPost('comment_ids');
        if (!empty($commentIds)) {
            foreach ($commentIds as $id) {
                $this->approveComment($id);
            }
        }
    }

    //delete comment
    public function deleteComment($id)
    {
        $comment = $this->getComment($id);
        if (!empty($comment)) {
            $this->builderComments->where('parent_id', $comment->id)->delete();
            return $this->builderComments->where('id', $comment->id)->delete();
        }
        return false;
    }

    //delete multi comments
    public function deleteMultiComments()
    {
        $commentIds = inputPost('comment_ids');
        if (!empty($commentIds)) {
            foreach ($commentIds as $id) {
                $this->deleteComment($id);
            }
        }
    }

    /*
    * --------------------------------------------------------------------
    * AD SPACES
    * --------------------------------------------------------------------
    */

    public function updateAdSpaces($adSpace)
    {
        $uploadModel = new UploadModel();
        $data = [
            'ad_code_728' => inputPost('ad_code_728'),
            'ad_code_468' => inputPost('ad_code_468'),
            'ad_code_234' => inputPost('ad_code_234'),
        ];
        if ($adSpace == 'sidebar_top' || $adSpace == 'sidebar_bottom') {
            $data["ad_code_300"] = inputPost('ad_code_300');
            $adURL = inputPost('url_ad_code_300');
            $file = $uploadModel->uploadAd('file_ad_code_300');
            if (!empty($file) && !empty($file['path'])) {
                $data["ad_code_300"] = $this->createAdCode($adURL, $file['path']);
            }
        } else {
            $adURL = inputPost('url_ad_code_728');
            $file = $uploadModel->uploadAd('file_ad_code_728');
            if (!empty($file) && !empty($file['path'])) {
                $data["ad_code_728"] = $this->createAdCode($adURL, $file['path']);
            }
            $adURL = inputPost('url_ad_code_468');
            $file = $uploadModel->uploadAd('file_ad_code_468');
            if (!empty($file) && !empty($file['path'])) {
                $data["ad_code_468"] = $this->createAdCode($adURL, $file['path']);
            }
        }
        $adURL = inputPost('url_ad_code_234');
        $file = $uploadModel->uploadAd('file_ad_code_234');
        if (!empty($file) && !empty($file['path'])) {
            $data["ad_code_234"] = $this->createAdCode($adURL, $file['path']);
        }
        return $this->builderAds->where('ad_space', $adSpace)->update($data);
    }

    //get ad spaces
    public function getAdSpaces()
    {
        return $this->builderAds->get()->getResult();
    }

    //get ad codes
    public function getAdCodes($adSpace)
    {
        return $this->builderAds->where('ad_space', cleanStr($adSpace))->get()->getRow();
    }

    //create ad code
    public function createAdCode($url, $imgPath)
    {
        return '<a href="' . $url . '"><img src="' . base_url($imgPath) . '" alt=""></a>';
    }

    //update google adsense code
    public function updateGoogleAdsenseCode()
    {
        return $this->db->table('general_settings')->where('id', 1)->update(['adsense_activation_code' => inputPost('adsense_activation_code')]);
    }

    public function fixNullRecords()
    {
        $builderCategory = $this->db->table('categories');
        if ($builderCategory->where('parent_id', null)->get()->getResult()) {
            $builderCategory->where('parent_id', null)->update(['parent_id' => 0]);
        }
        $builderPages = $this->db->table('pages');
        if ($builderPages->where('parent_id', null)->get()->getResult()) {
            $builderPages->where('parent_id', null)->update(['parent_id' => 0]);
        }
    }
}
