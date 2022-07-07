-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2022 at 12:03 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

--
-- Database: `install_varient`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_spaces`
--

CREATE TABLE `ad_spaces` (
  `id` int(11) NOT NULL,
  `ad_space` text DEFAULT NULL,
  `ad_code_728` text DEFAULT NULL,
  `ad_code_468` text DEFAULT NULL,
  `ad_code_300` text DEFAULT NULL,
  `ad_code_234` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_spaces`
--

INSERT INTO `ad_spaces` (`id`, `ad_space`, `ad_code_728`, `ad_code_468`, `ad_code_300`, `ad_code_234`) VALUES
(1, 'index_top', NULL, NULL, NULL, NULL),
(2, 'index_bottom', NULL, NULL, NULL, NULL),
(3, 'post_top', NULL, NULL, NULL, NULL),
(4, 'post_bottom', NULL, NULL, NULL, NULL),
(5, 'category_top', NULL, NULL, NULL, NULL),
(6, 'category_bottom', NULL, NULL, NULL, NULL),
(7, 'tag_top', NULL, NULL, NULL, NULL),
(8, 'tag_bottom', NULL, NULL, NULL, NULL),
(9, 'search_top', NULL, NULL, NULL, NULL),
(10, 'search_bottom', NULL, NULL, NULL, NULL),
(11, 'profile_top', NULL, NULL, NULL, NULL),
(12, 'profile_bottom', NULL, NULL, NULL, NULL),
(13, 'reading_list_top', NULL, NULL, NULL, NULL),
(14, 'reading_list_bottom', NULL, NULL, NULL, NULL),
(15, 'sidebar_top', NULL, NULL, NULL, NULL),
(16, 'sidebar_bottom', NULL, NULL, NULL, NULL),
(17, 'header', NULL, NULL, NULL, NULL),
(18, 'posts_top', NULL, NULL, NULL, NULL),
(19, 'posts_bottom', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audios`
--

CREATE TABLE `audios` (
  `id` int(11) NOT NULL,
  `audio_name` varchar(255) DEFAULT NULL,
  `audio_path` varchar(255) DEFAULT NULL,
  `download_button` tinyint(1) DEFAULT 1,
  `storage` varchar(20) DEFAULT 'local',
  `user_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `name_slug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `block_type` varchar(255) DEFAULT NULL,
  `category_order` int(11) DEFAULT 0,
  `show_at_homepage` tinyint(1) DEFAULT 1,
  `show_on_menu` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(5000) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(5000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `following_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fonts`
--

CREATE TABLE `fonts` (
  `id` int(11) NOT NULL,
  `font_name` varchar(255) DEFAULT NULL,
  `font_key` varchar(255) DEFAULT NULL,
  `font_url` varchar(2000) DEFAULT NULL,
  `font_family` varchar(500) DEFAULT NULL,
  `font_source` varchar(50) DEFAULT 'google',
  `has_local_file` tinyint(1) DEFAULT 0,
  `is_default` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fonts`
--

INSERT INTO `fonts` (`id`, `font_name`, `font_key`, `font_url`, `font_family`, `font_source`, `has_local_file`, `is_default`) VALUES
(1, 'Arial', 'arial', NULL, 'font-family: Arial, Helvetica, sans-serif', 'local', 0, 1),
(2, 'Arvo', 'arvo', '<link href=\"https://fonts.googleapis.com/css?family=Arvo:400,700&display=swap\" rel=\"stylesheet\">\r\n', 'font-family: \"Arvo\", Helvetica, sans-serif', 'google', 0, 0),
(3, 'Averia Libre', 'averia-libre', '<link href=\"https://fonts.googleapis.com/css?family=Averia+Libre:300,400,700&display=swap\" rel=\"stylesheet\">\r\n', 'font-family: \"Averia Libre\", Helvetica, sans-serif', 'google', 0, 0),
(4, 'Bitter', 'bitter', '<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,400i,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Bitter\", Helvetica, sans-serif', 'google', 0, 0),
(5, 'Cabin', 'cabin', '<link href=\"https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Cabin\", Helvetica, sans-serif', 'google', 0, 0),
(6, 'Cherry Swash', 'cherry-swash', '<link href=\"https://fonts.googleapis.com/css?family=Cherry+Swash:400,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Cherry Swash\", Helvetica, sans-serif', 'google', 0, 0),
(7, 'Encode Sans', 'encode-sans', '<link href=\"https://fonts.googleapis.com/css?family=Encode+Sans:300,400,500,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Encode Sans\", Helvetica, sans-serif', 'google', 0, 0),
(8, 'Helvetica', 'helvetica', NULL, 'font-family: Helvetica, sans-serif', 'local', 0, 1),
(9, 'Hind', 'hind', '<link href=\"https://fonts.googleapis.com/css?family=Hind:300,400,500,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">', 'font-family: \"Hind\", Helvetica, sans-serif', 'google', 0, 0),
(10, 'Josefin Sans', 'josefin-sans', '<link href=\"https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Josefin Sans\", Helvetica, sans-serif', 'google', 0, 0),
(11, 'Kalam', 'kalam', '<link href=\"https://fonts.googleapis.com/css?family=Kalam:300,400,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Kalam\", Helvetica, sans-serif', 'google', 0, 0),
(12, 'Khula', 'khula', '<link href=\"https://fonts.googleapis.com/css?family=Khula:300,400,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Khula\", Helvetica, sans-serif', 'google', 0, 0),
(13, 'Lato', 'lato', '<link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">', 'font-family: \"Lato\", Helvetica, sans-serif', 'google', 0, 0),
(14, 'Lora', 'lora', '<link href=\"https://fonts.googleapis.com/css?family=Lora:400,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Lora\", Helvetica, sans-serif', 'google', 0, 0),
(15, 'Merriweather', 'merriweather', '<link href=\"https://fonts.googleapis.com/css?family=Merriweather:300,400,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Merriweather\", Helvetica, sans-serif', 'google', 0, 0),
(16, 'Montserrat', 'montserrat', '<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Montserrat\", Helvetica, sans-serif', 'google', 0, 0),
(17, 'Mukta', 'mukta', '<link href=\"https://fonts.googleapis.com/css?family=Mukta:300,400,500,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Mukta\", Helvetica, sans-serif', 'google', 0, 0),
(18, 'Nunito', 'nunito', '<link href=\"https://fonts.googleapis.com/css?family=Nunito:300,400,600,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Nunito\", Helvetica, sans-serif', 'google', 0, 0),
(19, 'Open Sans', 'open-sans', '<link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap\" rel=\"stylesheet\">', 'font-family: \"Open Sans\", Helvetica, sans-serif', 'google', 1, 0),
(20, 'Oswald', 'oswald', '<link href=\"https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext,vietnamese\" rel=\"stylesheet\">', 'font-family: \"Oswald\", Helvetica, sans-serif', 'google', 0, 0),
(21, 'Oxygen', 'oxygen', '<link href=\"https://fonts.googleapis.com/css?family=Oxygen:300,400,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Oxygen\", Helvetica, sans-serif', 'google', 0, 0),
(22, 'Poppins', 'poppins', '<link href=\"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap&subset=devanagari,latin-ext\" rel=\"stylesheet\">', 'font-family: \"Poppins\", Helvetica, sans-serif', 'google', 0, 0),
(23, 'PT Sans', 'pt-sans', '<link href=\"https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap&subset=cyrillic,cyrillic-ext,latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"PT Sans\", Helvetica, sans-serif', 'google', 0, 0),
(24, 'Raleway', 'raleway', '<link href=\"https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">\r\n', 'font-family: \"Raleway\", Helvetica, sans-serif', 'google', 0, 0),
(25, 'Roboto', 'roboto', '<link href=\"https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">', 'font-family: \"Roboto\", Helvetica, sans-serif', 'google', 1, 0),
(26, 'Roboto Condensed', 'roboto-condensed', '<link href=\"https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Roboto Condensed\", Helvetica, sans-serif', 'google', 0, 0),
(27, 'Roboto Slab', 'roboto-slab', '<link href=\"https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,500,600,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Roboto Slab\", Helvetica, sans-serif', 'google', 0, 0),
(28, 'Rokkitt', 'rokkitt', '<link href=\"https://fonts.googleapis.com/css?family=Rokkitt:300,400,500,600,700&display=swap&subset=latin-ext,vietnamese\" rel=\"stylesheet\">\r\n', 'font-family: \"Rokkitt\", Helvetica, sans-serif', 'google', 0, 0),
(29, 'Source Sans Pro', 'source-sans-pro', '<link href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese\" rel=\"stylesheet\">', 'font-family: \"Source Sans Pro\", Helvetica, sans-serif', 'google', 0, 0),
(30, 'Titillium Web', 'titillium-web', '<link href=\"https://fonts.googleapis.com/css?family=Titillium+Web:300,400,600,700&display=swap&subset=latin-ext\" rel=\"stylesheet\">', 'font-family: \"Titillium Web\", Helvetica, sans-serif', 'google', 0, 0),
(31, 'Ubuntu', 'ubuntu', '<link href=\"https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700&display=swap&subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext\" rel=\"stylesheet\">', 'font-family: \"Ubuntu\", Helvetica, sans-serif', 'google', 0, 0),
(32, 'Verdana', 'verdana', NULL, 'font-family: Verdana, Helvetica, sans-serif', 'local', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `title` varchar(500) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `path_big` varchar(255) DEFAULT NULL,
  `path_small` varchar(255) DEFAULT NULL,
  `is_album_cover` tinyint(1) DEFAULT 0,
  `storage` varchar(20) DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_albums`
--

CREATE TABLE `gallery_albums` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categories`
--

CREATE TABLE `gallery_categories` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `site_lang` int(11) NOT NULL DEFAULT 1,
  `multilingual_system` tinyint(1) DEFAULT 1,
  `theme_mode` varchar(25) DEFAULT 'light',
  `post_list_style` varchar(50) DEFAULT 'vertical',
  `site_color` varchar(50) DEFAULT '#1abc9c',
  `site_block_color` varchar(50) DEFAULT '#161616',
  `logo` varchar(255) DEFAULT NULL,
  `logo_footer` varchar(255) DEFAULT NULL,
  `logo_email` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `show_hits` tinyint(1) DEFAULT 1,
  `show_rss` tinyint(1) DEFAULT 1,
  `rss_content_type` varchar(50) DEFAULT '''summary''',
  `show_newsticker` tinyint(1) DEFAULT 1,
  `pagination_per_page` smallint(6) DEFAULT 10,
  `google_analytics` text DEFAULT NULL,
  `mail_library` varchar(100) DEFAULT 'swift',
  `mail_protocol` varchar(100) DEFAULT 'smtp',
  `mail_encryption` varchar(100) DEFAULT 'tls',
  `mail_host` varchar(255) DEFAULT NULL,
  `mail_port` varchar(255) DEFAULT '587',
  `mail_username` varchar(255) DEFAULT NULL,
  `mail_password` varchar(255) DEFAULT NULL,
  `mail_title` varchar(255) DEFAULT NULL,
  `mail_reply_to` varchar(255) DEFAULT 'noreply@domain.com',
  `google_client_id` varchar(500) DEFAULT NULL,
  `google_client_secret` varchar(500) DEFAULT NULL,
  `vk_app_id` varchar(500) DEFAULT NULL,
  `vk_secure_key` varchar(500) DEFAULT NULL,
  `facebook_app_id` varchar(500) DEFAULT NULL,
  `facebook_app_secret` varchar(500) DEFAULT NULL,
  `facebook_comment` text DEFAULT NULL,
  `facebook_comment_active` tinyint(1) DEFAULT 1,
  `show_featured_section` tinyint(1) DEFAULT 1,
  `show_latest_posts` tinyint(1) DEFAULT 1,
  `pwa_status` tinyint(1) DEFAULT 0,
  `registration_system` tinyint(1) DEFAULT 1,
  `post_url_structure` varchar(50) DEFAULT '''slug''',
  `comment_system` tinyint(1) DEFAULT 1,
  `comment_approval_system` tinyint(1) DEFAULT 1,
  `show_post_author` tinyint(1) DEFAULT 1,
  `show_post_date` tinyint(1) DEFAULT 1,
  `menu_limit` tinyint(4) DEFAULT 8,
  `custom_header_codes` mediumtext DEFAULT NULL,
  `custom_footer_codes` mediumtext DEFAULT NULL,
  `adsense_activation_code` text DEFAULT NULL,
  `recaptcha_site_key` varchar(255) DEFAULT NULL,
  `recaptcha_secret_key` varchar(255) DEFAULT NULL,
  `emoji_reactions` tinyint(1) DEFAULT 1,
  `mail_contact_status` tinyint(1) DEFAULT 0,
  `mail_contact` varchar(255) DEFAULT NULL,
  `cache_system` tinyint(1) DEFAULT 0,
  `cache_refresh_time` int(11) DEFAULT 1800,
  `refresh_cache_database_changes` tinyint(1) DEFAULT 0,
  `email_verification` tinyint(1) DEFAULT 0,
  `file_manager_show_files` tinyint(1) DEFAULT 1,
  `audio_download_button` tinyint(1) DEFAULT 1,
  `approve_added_user_posts` tinyint(1) DEFAULT 1,
  `approve_updated_user_posts` tinyint(1) DEFAULT 1,
  `timezone` varchar(255) DEFAULT 'America/New_York',
  `show_latest_posts_on_slider` tinyint(1) DEFAULT 0,
  `show_latest_posts_on_featured` tinyint(1) DEFAULT 0,
  `sort_slider_posts` varchar(100) DEFAULT 'by_slider_order',
  `sort_featured_posts` varchar(100) DEFAULT 'by_featured_order',
  `newsletter_status` tinyint(1) DEFAULT 1,
  `newsletter_popup` tinyint(1) DEFAULT 0,
  `show_home_link` tinyint(1) DEFAULT 1,
  `post_format_article` tinyint(1) DEFAULT 1,
  `post_format_gallery` tinyint(1) DEFAULT 1,
  `post_format_sorted_list` tinyint(1) DEFAULT 1,
  `post_format_video` tinyint(1) DEFAULT 1,
  `post_format_audio` tinyint(1) DEFAULT 1,
  `post_format_trivia_quiz` tinyint(1) DEFAULT 1,
  `post_format_personality_quiz` tinyint(1) DEFAULT 1,
  `maintenance_mode_title` varchar(500) DEFAULT 'Coming Soon!',
  `maintenance_mode_description` varchar(5000) DEFAULT NULL,
  `maintenance_mode_status` tinyint(1) DEFAULT 0,
  `sitemap_frequency` varchar(30) DEFAULT 'monthly',
  `sitemap_last_modification` varchar(30) DEFAULT 'server_response',
  `sitemap_priority` varchar(30) DEFAULT 'automatically',
  `show_user_email_on_profile` tinyint(1) DEFAULT 1,
  `reward_system_status` tinyint(1) DEFAULT 0,
  `reward_amount` double DEFAULT 1,
  `currency_name` varchar(100) DEFAULT 'US Dollar',
  `currency_symbol` varchar(10) DEFAULT '$',
  `currency_format` varchar(10) DEFAULT 'us',
  `currency_symbol_format` varchar(10) DEFAULT 'left',
  `payout_paypal_status` tinyint(1) DEFAULT 1,
  `payout_iban_status` tinyint(1) DEFAULT 1,
  `payout_swift_status` tinyint(1) DEFAULT 1,
  `storage` varchar(20) DEFAULT 'local',
  `aws_key` varchar(255) DEFAULT NULL,
  `aws_secret` varchar(255) DEFAULT NULL,
  `aws_bucket` varchar(255) DEFAULT NULL,
  `aws_region` varchar(255) DEFAULT NULL,
  `auto_post_deletion` tinyint(1) DEFAULT 0,
  `auto_post_deletion_days` smallint(6) DEFAULT 30,
  `auto_post_deletion_delete_all` tinyint(1) DEFAULT 0,
  `redirect_rss_posts_to_original` tinyint(1) DEFAULT 0,
  `allowed_file_extensions` varchar(500) DEFAULT '''jpg,jpeg,png,gif,svg,csv,doc,docx,pdf,ppt,psd,mp4,mp3,zip''',
  `last_cron_update` timestamp NULL DEFAULT NULL,
  `version` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_lang`, `multilingual_system`, `theme_mode`, `post_list_style`, `site_color`, `site_block_color`, `logo`, `logo_footer`, `logo_email`, `favicon`, `show_hits`, `show_rss`, `rss_content_type`, `show_newsticker`, `pagination_per_page`, `google_analytics`, `mail_library`, `mail_protocol`, `mail_encryption`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_title`, `mail_reply_to`, `google_client_id`, `google_client_secret`, `vk_app_id`, `vk_secure_key`, `facebook_app_id`, `facebook_app_secret`, `facebook_comment`, `facebook_comment_active`, `show_featured_section`, `show_latest_posts`, `pwa_status`, `registration_system`, `post_url_structure`, `comment_system`, `comment_approval_system`, `show_post_author`, `show_post_date`, `menu_limit`, `custom_header_codes`, `custom_footer_codes`, `adsense_activation_code`, `recaptcha_site_key`, `recaptcha_secret_key`, `emoji_reactions`, `mail_contact_status`, `mail_contact`, `cache_system`, `cache_refresh_time`, `refresh_cache_database_changes`, `email_verification`, `file_manager_show_files`, `audio_download_button`, `approve_added_user_posts`, `approve_updated_user_posts`, `timezone`, `show_latest_posts_on_slider`, `show_latest_posts_on_featured`, `sort_slider_posts`, `sort_featured_posts`, `newsletter_status`, `newsletter_popup`, `show_home_link`, `post_format_article`, `post_format_gallery`, `post_format_sorted_list`, `post_format_video`, `post_format_audio`, `post_format_trivia_quiz`, `post_format_personality_quiz`, `maintenance_mode_title`, `maintenance_mode_description`, `maintenance_mode_status`, `sitemap_frequency`, `sitemap_last_modification`, `sitemap_priority`, `show_user_email_on_profile`, `reward_system_status`, `reward_amount`, `currency_name`, `currency_symbol`, `currency_format`, `currency_symbol_format`, `payout_paypal_status`, `payout_iban_status`, `payout_swift_status`, `storage`, `aws_key`, `aws_secret`, `aws_bucket`, `aws_region`, `auto_post_deletion`, `auto_post_deletion_days`, `auto_post_deletion_delete_all`, `redirect_rss_posts_to_original`, `allowed_file_extensions`, `last_cron_update`, `version`) VALUES
(1, 1, 1, 'light', 'vertical', '#1abc9c', '#161616', NULL, NULL, NULL, NULL, 1, 1, 'summary', 1, 16, NULL, 'swift', 'smtp', 'tls', NULL, '587', NULL, NULL, 'Varient', 'noreply@domain.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, 'slug', 1, 1, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, 1800, 0, 0, 0, 1, 1, 1, 'America/New_York', 0, 0, 'by_slider_order', 'by_featured_order', 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 'Coming Soon!', 'Our website is under construction. We\'ll be here soon with our new awesome site.', 0, 'hourly', 'server_response', 'automatically', 1, 0, 0.25, 'USD', '$', 'us', 'left', 1, 1, 1, 'local', NULL, NULL, NULL, NULL, 0, 30, 0, 0, 'jpg,jpeg,png,gif,svg,csv,doc,docx,pdf,ppt,psd,mp4,mp3,zip', NULL, '2.0');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_big` varchar(255) DEFAULT NULL,
  `image_default` varchar(255) DEFAULT NULL,
  `image_slider` varchar(255) DEFAULT NULL,
  `image_mid` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  `image_mime` varchar(50) DEFAULT 'jpg',
  `file_name` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `user_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_form` varchar(255) NOT NULL,
  `language_code` varchar(100) NOT NULL,
  `text_direction` varchar(50) NOT NULL,
  `text_editor_lang` varchar(30) DEFAULT 'en',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `language_order` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_form`, `language_code`, `text_direction`, `text_editor_lang`, `status`, `language_order`) VALUES
(1, 'English', 'en', 'en-US', 'ltr', 'en', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `language_translations`
--

CREATE TABLE `language_translations` (
  `id` int(11) NOT NULL,
  `lang_id` smallint(6) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `translation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_translations`
--

INSERT INTO `language_translations` (`id`, `lang_id`, `label`, `translation`) VALUES
(1, 1, 'about_me', 'About Me'),
(2, 1, 'activate', 'Activate'),
(3, 1, 'activated', 'Activated'),
(4, 1, 'active', 'Active'),
(5, 1, 'additional_images', 'Additional Images'),
(6, 1, 'address', 'Address'),
(7, 1, 'add_album', 'Add Album'),
(8, 1, 'add_answer', 'Add Answer'),
(9, 1, 'add_article', 'Add Article'),
(10, 1, 'add_audio', 'Add Audio'),
(11, 1, 'add_breaking', 'Add to Breaking'),
(12, 1, 'add_category', 'Add Category'),
(13, 1, 'add_featured', 'Add to Featured'),
(14, 1, 'add_font', 'Add Font'),
(15, 1, 'add_gallery', 'Add Gallery'),
(16, 1, 'add_iframe', 'Add Iframe'),
(17, 1, 'add_image', 'Add Image'),
(18, 1, 'add_image_url', 'Add Image Url'),
(19, 1, 'add_language', 'Add Language'),
(20, 1, 'add_link', 'Add Menu Link'),
(21, 1, 'add_new_item', 'Add New Item'),
(22, 1, 'add_page', 'Add Page'),
(23, 1, 'add_payout', 'Add Payout'),
(24, 1, 'add_personality_quiz', 'Add Personality Quiz'),
(25, 1, 'add_poll', 'Add Poll'),
(26, 1, 'add_post', 'Add Post'),
(27, 1, 'add_posts_as_draft', 'Add Posts as Draft'),
(28, 1, 'add_question', 'Add Question'),
(29, 1, 'add_quiz', 'Add Quiz'),
(30, 1, 'add_reading_list', 'Add to Reading List'),
(31, 1, 'add_recommended', 'Add to Recommended'),
(32, 1, 'add_result', 'Add Result'),
(33, 1, 'add_slider', 'Add to Slider'),
(34, 1, 'add_sorted_list', 'Add Sorted List'),
(35, 1, 'add_subcategory', 'Add Subcategory'),
(36, 1, 'add_trivia_quiz', 'Add Trivia Quiz'),
(37, 1, 'add_user', 'Add User'),
(38, 1, 'add_video', 'Add Video'),
(39, 1, 'add_widget', 'Add Widget'),
(40, 1, 'admin', 'Admin'),
(41, 1, 'administrators', 'Administrators'),
(42, 1, 'admin_panel', 'Admin Panel'),
(43, 1, 'admin_panel_link', 'Admin Panel Link'),
(44, 1, 'adsense_activation_code', 'AdSense Activation Code'),
(45, 1, 'ad_space', 'Ad Space'),
(46, 1, 'ad_spaces', 'Ad Spaces'),
(47, 1, 'ago', 'ago'),
(48, 1, 'album', 'Album'),
(49, 1, 'albums', 'Albums'),
(50, 1, 'album_cover', 'Album Cover'),
(51, 1, 'album_name', 'Album Name'),
(52, 1, 'all', 'All'),
(53, 1, 'allowed_file_extensions', 'Allowed File Extensions'),
(54, 1, 'all_permissions', 'All Permissions'),
(55, 1, 'all_posts', 'All Posts'),
(56, 1, 'all_time', 'All Time'),
(57, 1, 'all_users_can_vote', 'All Users Can Vote'),
(58, 1, 'always', 'Always'),
(59, 1, 'amount', 'Amount'),
(60, 1, 'angry', 'Angry'),
(61, 1, 'answers', 'Answers'),
(62, 1, 'answer_format', 'Answer Format'),
(63, 1, 'answer_text', 'Answer Text'),
(64, 1, 'approve', 'Approve'),
(65, 1, 'approved_comments', 'Approved Comments'),
(66, 1, 'approve_added_user_posts', 'Approve Added User Posts'),
(67, 1, 'approve_updated_user_posts', 'Approve Updated User Posts'),
(68, 1, 'app_id', 'App ID'),
(69, 1, 'app_name', 'Application Name'),
(70, 1, 'app_secret', 'App Secret'),
(71, 1, 'April', 'Apr'),
(72, 1, 'article', 'Article'),
(73, 1, 'article_post_exp', 'An article with images and embed videos'),
(74, 1, 'audio', 'Audio'),
(75, 1, 'audios', 'Audios'),
(76, 1, 'audios_exp', 'Select your audios and create your playlist'),
(77, 1, 'audio_download_button', 'Audio Download Button'),
(78, 1, 'audio_post_exp', 'Upload audios and create playlist'),
(79, 1, 'August', 'Aug'),
(80, 1, 'author', 'Author'),
(81, 1, 'auto_post_deletion', 'Auto Post Deletion'),
(82, 1, 'auto_update', 'Auto Update'),
(83, 1, 'avatar', 'Avatar'),
(84, 1, 'aws_key', 'AWS Access Key'),
(85, 1, 'aws_secret', 'AWS Secret Key'),
(86, 1, 'aws_storage', 'AWS S3 Storage'),
(87, 1, 'back', 'Back'),
(88, 1, 'balance', 'Balance'),
(89, 1, 'bank_account_holder_name', 'Bank Account Holder\'s Name'),
(90, 1, 'bank_branch_city', 'Bank Branch City'),
(91, 1, 'bank_branch_country', 'Bank Branch Country'),
(92, 1, 'bank_name', 'Bank Name'),
(93, 1, 'banned', 'Banned'),
(94, 1, 'banner', 'Banner'),
(95, 1, 'ban_user', 'Ban User'),
(96, 1, 'block_color', 'Top Header and Block Heads Color'),
(97, 1, 'breaking', 'Breaking'),
(98, 1, 'breaking_news', 'Breaking News'),
(99, 1, 'browse_files', 'Browse Files'),
(100, 1, 'btn_goto_home', 'Go Back to the Homepage'),
(101, 1, 'btn_reply', 'Reply'),
(102, 1, 'btn_send', 'Send'),
(103, 1, 'btn_submit', 'Submit'),
(104, 1, 'bucket_name', 'Bucket Name'),
(105, 1, 'bulk_post_upload', 'Bulk Post Upload'),
(106, 1, 'bulk_post_upload_exp', 'You can add your posts with a CSV file from this section'),
(107, 1, 'by_date', 'by Date'),
(108, 1, 'by_featured_order', 'by Featured Order'),
(109, 1, 'by_slider_order', 'by Slider Order'),
(110, 1, 'cache_refresh_time', 'Cache Refresh Time (Minute)'),
(111, 1, 'cache_refresh_time_exp', 'After this time, your cache files will be refreshed.'),
(112, 1, 'cache_system', 'Cache System'),
(113, 1, 'cancel', 'Cancel'),
(114, 1, 'categories', 'Categories'),
(115, 1, 'category', 'Category'),
(116, 1, 'category_block_style', 'Category Block Style'),
(117, 1, 'category_bottom_ad_space', 'Category (Bottom)'),
(118, 1, 'category_ids_list', 'Category Ids list'),
(119, 1, 'category_name', 'Category Name'),
(120, 1, 'category_top_ad_space', 'Category (Top)'),
(121, 1, 'change_avatar', 'Change Avatar'),
(122, 1, 'change_favicon', 'Change favicon'),
(123, 1, 'change_logo', 'Change logo'),
(124, 1, 'change_password', 'Change Password'),
(125, 1, 'change_user_role', 'Change User Role'),
(126, 1, 'choose_post_format', 'Choose a Post Format'),
(127, 1, 'city', 'City'),
(128, 1, 'client_id', 'Client ID'),
(129, 1, 'client_secret', 'Client Secret'),
(130, 1, 'close', 'Close'),
(131, 1, 'color', 'Color'),
(132, 1, 'comment', 'Comment'),
(133, 1, 'comments', 'Comments'),
(134, 1, 'comment_approval_system', 'Comment Approval System'),
(135, 1, 'comment_system', 'Comment System'),
(136, 1, 'completed', 'Completed'),
(137, 1, 'confirmed', 'Confirmed'),
(138, 1, 'confirm_album', 'Are you sure you want to delete this album?'),
(139, 1, 'confirm_answer', 'Are you sure you want to delete this answer?'),
(140, 1, 'confirm_ban', 'Are you sure you want to ban this user?'),
(141, 1, 'confirm_category', 'Are you sure you want to delete this category?'),
(142, 1, 'confirm_comment', 'Are you sure you want to delete this comment?'),
(143, 1, 'confirm_comments', 'Are you sure you want to delete selected comments?'),
(144, 1, 'confirm_image', 'Are you sure you want to delete this image?'),
(145, 1, 'confirm_item', 'Are you sure you want to delete this item?'),
(146, 1, 'confirm_language', 'Are you sure you want to delete this language?'),
(147, 1, 'confirm_link', 'Are you sure you want to delete this link?'),
(148, 1, 'confirm_message', 'Are you sure you want to delete this message?'),
(149, 1, 'confirm_messages', 'Are you sure you want to delete selected messages?'),
(150, 1, 'confirm_page', 'Are you sure you want to delete this page?'),
(151, 1, 'confirm_password', 'Confirm Password'),
(152, 1, 'confirm_poll', 'Are you sure you want to delete this poll?'),
(153, 1, 'confirm_post', 'Are you sure you want to delete this post?'),
(154, 1, 'confirm_posts', 'Are you sure you want to delete selected posts?'),
(155, 1, 'confirm_question', 'Are you sure you want to delete this question?'),
(156, 1, 'confirm_record', 'Are you sure you want to delete this record?'),
(157, 1, 'confirm_result', 'Are you sure you want to delete this result?'),
(158, 1, 'confirm_rss', 'Are you sure you want to delete this feed?'),
(159, 1, 'confirm_user', 'Are you sure you want to delete this user?'),
(160, 1, 'confirm_user_email', 'Confirm User Email'),
(161, 1, 'confirm_widget', 'Are you sure you want to delete this widget?'),
(162, 1, 'confirm_your_email', 'Confirm Your Email'),
(163, 1, 'connect_with_facebook', 'Connect with Facebook'),
(164, 1, 'connect_with_google', 'Connect with Google'),
(165, 1, 'connect_with_vk', 'Connect with VK'),
(166, 1, 'contact', 'Contact'),
(167, 1, 'contact_message', 'Contact Message'),
(168, 1, 'contact_messages', 'Contact Messages'),
(169, 1, 'contact_messages_will_send', 'Contact messages will be sent to this email.'),
(170, 1, 'contact_settings', 'Contact Settings'),
(171, 1, 'contact_text', 'Contact Text'),
(172, 1, 'content', 'Content'),
(173, 1, 'cookies_warning', 'Cookies Warning'),
(174, 1, 'cookie_prefix', 'Cookie Prefix'),
(175, 1, 'copyright', 'Copyright'),
(176, 1, 'correct', 'Correct'),
(177, 1, 'correct_answer', 'Correct Answer'),
(178, 1, 'country', 'Country'),
(179, 1, 'create_account', 'Create an Account'),
(180, 1, 'currency', 'Currency'),
(181, 1, 'currency_format', 'Currency Format'),
(182, 1, 'currency_name', 'Currency Name'),
(183, 1, 'currency_symbol', 'Currency Symbol'),
(184, 1, 'currency_symbol_format', 'Currency Symbol Format'),
(185, 1, 'custom', 'Custom'),
(186, 1, 'custom_footer_codes', 'Custom Footer Codes'),
(187, 1, 'custom_footer_codes_exp', 'These codes will be added to the footer of the site.'),
(188, 1, 'custom_header_codes', 'Custom Header Codes'),
(189, 1, 'custom_header_codes_exp', 'These codes will be added to the header of the site.'),
(190, 1, 'daily', 'Daily'),
(191, 1, 'dark_mode', 'Dark Mode'),
(192, 1, 'dashboard', 'Dashboard'),
(193, 1, 'data_type', 'Data Type'),
(194, 1, 'date', 'Date'),
(195, 1, 'date_added', 'Date Added'),
(196, 1, 'date_publish', 'Date Published'),
(197, 1, 'day', 'day'),
(198, 1, 'days', 'days'),
(199, 1, 'days_remaining', 'Days Remaining'),
(200, 1, 'December', 'Dec'),
(201, 1, 'default', 'Default'),
(202, 1, 'default_language', 'Default Language'),
(203, 1, 'delete', 'Delete'),
(204, 1, 'delete_account', 'Delete Account'),
(205, 1, 'delete_account_confirm', 'Deleting your account is permanent and will remove all content including comments, avatars and profile settings. Are you sure you want to delete your account?'),
(206, 1, 'delete_all_posts', 'Delete All Posts'),
(207, 1, 'delete_only_rss_posts', 'Delete only RSS Posts'),
(208, 1, 'delete_reading_list', 'Remove from Reading List'),
(209, 1, 'description', 'Description'),
(210, 1, 'disable', 'Disable'),
(211, 1, 'disable_reward_system', 'Disable Reward System'),
(212, 1, 'dislike', 'Dislike'),
(213, 1, 'distribute_only_post_summary', 'Distribute only Post Summary'),
(214, 1, 'distribute_post_content', 'Distribute Post Content'),
(215, 1, 'documentation', 'Documentation'),
(216, 1, 'dont_add_menu', 'Don\'t Add to Menu'),
(217, 1, 'dont_want_receive_emails', 'Don\'t want receive these emails?'),
(218, 1, 'download_button', 'Download Button'),
(219, 1, 'download_csv_example', 'Download CSV Example'),
(220, 1, 'download_csv_template', 'Download CSV Template'),
(221, 1, 'download_database_backup', 'Download Database Backup'),
(222, 1, 'download_images_my_server', 'Download Images to My Server'),
(223, 1, 'drafts', 'Drafts'),
(224, 1, 'drag_drop_files_here', 'Drag and drop files here or'),
(225, 1, 'drag_drop_file_here', 'Drag and drop file here or'),
(226, 1, 'earnings', 'Earnings'),
(227, 1, 'edit', 'Edit'),
(228, 1, 'edit_phrases', 'Edit Phrases'),
(229, 1, 'edit_role', 'Edit Role'),
(230, 1, 'edit_translations', 'Edit Translations'),
(231, 1, 'email', 'Email'),
(232, 1, 'email_reset_password', 'Please click on the button below to reset your password.'),
(233, 1, 'email_settings', 'Email Settings'),
(234, 1, 'email_status', 'Email Status'),
(235, 1, 'email_verification', 'Email Verification'),
(236, 1, 'embed_media', 'Embed Media'),
(237, 1, 'emoji_reactions', 'Emoji Reactions'),
(238, 1, 'enable', 'Enable'),
(239, 1, 'enable_reward_system', 'Enable Reward System'),
(240, 1, 'encryption', 'Encryption'),
(241, 1, 'enter_email_address', 'Enter your email address'),
(242, 1, 'enter_new_password', 'Enter your new password'),
(243, 1, 'example', 'Example'),
(244, 1, 'export', 'Export'),
(245, 1, 'facebook', 'Facebook'),
(246, 1, 'facebook_comments', 'Facebook Comments'),
(247, 1, 'facebook_comments_code', 'Facebook Comments Plugin Code'),
(248, 1, 'favicon', 'Favicon'),
(249, 1, 'featured', 'Featured'),
(250, 1, 'featured_order', 'Featured Order'),
(251, 1, 'featured_posts', 'Featured Posts'),
(252, 1, 'February', 'Feb'),
(253, 1, 'feed', 'Feed'),
(254, 1, 'feed_name', 'Feed Name'),
(255, 1, 'feed_url', 'Feed URL'),
(256, 1, 'field', 'Field'),
(257, 1, 'files', 'Files'),
(258, 1, 'files_exp', 'Downloadable additional files (.pdf, .docx, .zip etc..)'),
(259, 1, 'file_extensions', 'File Extensions'),
(260, 1, 'file_manager', 'File Manager'),
(261, 1, 'file_upload', 'File Upload'),
(262, 1, 'filter', 'Filter'),
(263, 1, 'folder_name', 'Folder Name'),
(264, 1, 'follow', 'Follow'),
(265, 1, 'followers', 'Followers'),
(266, 1, 'following', 'Following'),
(267, 1, 'fonts', 'Fonts'),
(268, 1, 'font_family', 'Font Family'),
(269, 1, 'font_settings', 'Font Settings'),
(270, 1, 'font_source', 'Font Source'),
(271, 1, 'font_warning', 'Default fonts (Open Sans and Roboto) have native font files. If you don\'t want to use Google fonts for these fonts, you can edit these fonts and choose \'local\' option.'),
(272, 1, 'footer', 'Footer'),
(273, 1, 'footer_about_section', 'Footer About Section'),
(274, 1, 'footer_follow', 'Social Media'),
(275, 1, 'forgot_password', 'Forgot Password'),
(276, 1, 'form_validation_is_unique', 'The {field} field must contain a unique value.'),
(277, 1, 'form_validation_matches', 'The {field} field does not match the {param} field.'),
(278, 1, 'form_validation_max_length', 'The {field} field cannot exceed {param} characters in length.'),
(279, 1, 'form_validation_min_length', 'The {field} field must be at least {param} characters in length.'),
(280, 1, 'form_validation_required', 'The {field} field is required.'),
(281, 1, 'frequency', 'Frequency'),
(282, 1, 'frequency_exp', 'This value indicates how frequently the content at a particular URL is likely to change'),
(283, 1, 'full_name', 'Full Name'),
(284, 1, 'funny', 'Funny'),
(285, 1, 'gallery', 'Gallery'),
(286, 1, 'gallery_albums', 'Gallery Albums'),
(287, 1, 'gallery_categories', 'Gallery Categories'),
(288, 1, 'gallery_post', 'Gallery Post'),
(289, 1, 'gallery_post_exp', 'A collection of images'),
(290, 1, 'gallery_post_items', 'Gallery Post Items'),
(291, 1, 'general', 'General'),
(292, 1, 'general_settings', 'General Settings'),
(293, 1, 'generate', 'Generate'),
(294, 1, 'generated_sitemaps', 'Generated Sitemaps'),
(295, 1, 'generate_keywords_from_title', 'Generate Keywords from Title'),
(296, 1, 'generate_sitemap', 'Generate Sitemap'),
(297, 1, 'get_video', 'Get Video'),
(298, 1, 'get_video_from_url', 'Get Video from URL'),
(299, 1, 'google', 'Google'),
(300, 1, 'google_analytics', 'Google Analytics'),
(301, 1, 'google_analytics_code', 'Google Analytics Code'),
(302, 1, 'google_recaptcha', 'Google reCAPTCHA'),
(303, 1, 'header_top_ad_space', 'Header'),
(304, 1, 'help_documents', 'Help Documents'),
(305, 1, 'help_documents_exp', 'You can use these documents to generate your CSV file'),
(306, 1, 'hide', 'Hide'),
(307, 1, 'hit', 'Hit'),
(308, 1, 'home', 'Home'),
(309, 1, 'homepage', 'Homepage'),
(310, 1, 'home_title', 'Home Title'),
(311, 1, 'horizontal', 'Horizontal'),
(312, 1, 'hour', 'hour'),
(313, 1, 'hourly', 'Hourly'),
(314, 1, 'hours', 'hours'),
(315, 1, 'iban', 'IBAN'),
(316, 1, 'iban_long', 'International Bank Account Number'),
(317, 1, 'id', 'Id'),
(318, 1, 'image', 'Image'),
(319, 1, 'images', 'Images'),
(320, 1, 'image_description', 'Image Description'),
(321, 1, 'image_for_video', 'Image for video'),
(322, 1, 'importing_posts', 'Importing posts...'),
(323, 1, 'import_language', 'Import Language'),
(324, 1, 'import_rss_feed', 'Import RSS Feed'),
(325, 1, 'inactive', 'Inactive'),
(326, 1, 'index', 'Index'),
(327, 1, 'index_bottom_ad_space', 'Index (Bottom)'),
(328, 1, 'index_top_ad_space', 'Index (Top)'),
(329, 1, 'insufficient_balance', 'Insufficient balance!'),
(330, 1, 'invalid', 'Invalid!'),
(331, 1, 'invalid_feed_url', 'Invalid feed URL!'),
(332, 1, 'invalid_file_type', 'Invalid file type!'),
(333, 1, 'invalid_url', 'Invalid URL!'),
(334, 1, 'ip_address', 'Ip Address'),
(335, 1, 'item_order', 'Item Order'),
(336, 1, 'January', 'Jan'),
(337, 1, 'join_newsletter', 'Join Our Newsletter'),
(338, 1, 'json_language_file', 'JSON Language File'),
(339, 1, 'July', 'Jul'),
(340, 1, 'June', 'Jun'),
(341, 1, 'just_now', 'Just Now'),
(342, 1, 'keywords', 'Keywords'),
(343, 1, 'label', 'Label'),
(344, 1, 'language', 'Language'),
(345, 1, 'languages', 'Languages'),
(346, 1, 'language_code', 'Language Code'),
(347, 1, 'language_name', 'Language Name'),
(348, 1, 'language_settings', 'Language Settings'),
(349, 1, 'last_comments', 'Latest Comments'),
(350, 1, 'last_contact_messages', 'Latest Contact Messages'),
(351, 1, 'last_modification', 'Last Modification'),
(352, 1, 'last_modification_exp', 'The time the URL was last modified'),
(353, 1, 'last_seen', 'Last seen:'),
(354, 1, 'latest_posts', 'Latest Posts'),
(355, 1, 'latest_users', 'Latest Users'),
(356, 1, 'leave_message', 'Send a Message'),
(357, 1, 'leave_reply', 'Leave a Reply'),
(358, 1, 'leave_your_comment', 'Leave your comment...'),
(359, 1, 'left', 'Left'),
(360, 1, 'left_to_right', 'Left to Right'),
(361, 1, 'like', 'Like'),
(362, 1, 'link', 'Link'),
(363, 1, 'load_more', 'Load More'),
(364, 1, 'load_more_comments', 'Load More Comments'),
(365, 1, 'local', 'Local'),
(366, 1, 'local_storage', 'Local Storage'),
(367, 1, 'location', 'Location'),
(368, 1, 'login', 'Login'),
(369, 1, 'login_error', 'Wrong username or password!'),
(370, 1, 'logo', 'Logo'),
(371, 1, 'logout', 'Logout'),
(372, 1, 'logo_email', 'Logo Email'),
(373, 1, 'logo_footer', 'Logo Footer'),
(374, 1, 'love', 'Love'),
(375, 1, 'mail', 'Mail'),
(376, 1, 'mail_host', 'Mail Host'),
(377, 1, 'mail_is_being_sent', 'Mail is being sent. Please do not close this page until the process is finished!'),
(378, 1, 'mail_library', 'Mail Library'),
(379, 1, 'mail_password', 'Mail Password'),
(380, 1, 'mail_port', 'Mail Port'),
(381, 1, 'mail_protocol', 'Mail Protocol'),
(382, 1, 'mail_title', 'Mail Title'),
(383, 1, 'mail_username', 'Mail Username'),
(384, 1, 'maintenance_mode', 'Maintenance Mode'),
(385, 1, 'main_menu', 'Main Menu'),
(386, 1, 'main_navigation', 'MAIN NAVIGATION'),
(387, 1, 'main_post_image', 'Main post image'),
(388, 1, 'manage_all_posts', 'Manage All Posts'),
(389, 1, 'March', 'Mar'),
(390, 1, 'max', 'Max'),
(391, 1, 'May', 'May'),
(392, 1, 'member_since', 'Member since'),
(393, 1, 'menu_limit', 'Menu Limit '),
(394, 1, 'message', 'Message'),
(395, 1, 'message_ban_error', 'Your account has been banned!'),
(396, 1, 'message_change_password_error', 'There was a problem changing your password!'),
(397, 1, 'message_change_password_success', 'Your password has been successfully changed!'),
(398, 1, 'message_contact_error', 'There was a problem sending your message!'),
(399, 1, 'message_contact_success', 'Your message has been successfully sent!'),
(400, 1, 'message_email_unique_error', 'The email has already been taken.'),
(401, 1, 'message_invalid_email', 'Invalid email address!'),
(402, 1, 'message_newsletter_error', 'Your email address is already registered!'),
(403, 1, 'message_newsletter_success', 'Your email address has been successfully added!'),
(404, 1, 'message_page_auth', 'You must be logged in to view this page!'),
(405, 1, 'message_post_auth', 'You must be logged in to view this post!'),
(406, 1, 'message_profile_success', 'Your profile has been successfully updated!'),
(407, 1, 'message_register_error', 'There was a problem during registration. Please try again!'),
(408, 1, 'meta_tag', 'Meta Tag'),
(409, 1, 'min', 'Min'),
(410, 1, 'minute', 'minute'),
(411, 1, 'minutes', 'minutes'),
(412, 1, 'month', 'month'),
(413, 1, 'monthly', 'Monthly'),
(414, 1, 'months', 'months'),
(415, 1, 'more_info', 'More info'),
(416, 1, 'more_main_images', 'More main images (slider will be active)'),
(417, 1, 'most_viewed_posts', 'Most Viewed Posts'),
(418, 1, 'msg_added', 'Item successfully added!'),
(419, 1, 'msg_beforeunload', 'You have unsaved changes! Are you sure you want to leave this page?'),
(420, 1, 'msg_comment_approved', 'Comment successfully approved!'),
(421, 1, 'msg_comment_sent_successfully', 'Your comment has been sent. It will be published after being reviewed by the site management.'),
(422, 1, 'msg_confirmation_email', 'Please confirm your email address by clicking the button below.'),
(423, 1, 'msg_confirmed', 'Your email address has been successfully confirmed!'),
(424, 1, 'msg_confirmed_required', 'Please verify your email address!'),
(425, 1, 'msg_cron_feed', 'With this URL you can automatically update your feeds.'),
(426, 1, 'msg_cron_scheduled', 'If you want to automatically publish scheduled posts, you should create a Cron Job function with this URL. For more information, please read the documentation.'),
(427, 1, 'msg_cron_sitemap', 'With this URL you can automatically update your sitemap.'),
(428, 1, 'msg_deleted', 'Item successfully deleted!'),
(429, 1, 'msg_delete_album', 'Please delete categories belonging to this album first!'),
(430, 1, 'msg_delete_images', 'Please delete images belonging to this category first!'),
(431, 1, 'msg_delete_posts', 'Please delete posts belonging to this category first!'),
(432, 1, 'msg_delete_subcategories', 'Please delete subcategories belonging to this category first!'),
(433, 1, 'msg_delete_subpages', 'Please delete subpages/sublinks first!'),
(434, 1, 'msg_email_sent', 'Email successfully sent!'),
(435, 1, 'msg_error', 'An error occurred please try again!'),
(436, 1, 'msg_language_delete', 'Default language cannot be deleted!'),
(437, 1, 'msg_not_authorized', 'You are not authorized to perform this operation!'),
(438, 1, 'msg_page_delete', 'Default pages cannot be deleted!'),
(439, 1, 'msg_payout_added', 'Payout has been successfully added!'),
(440, 1, 'msg_recaptcha', 'Please confirm that you are not a robot!'),
(441, 1, 'msg_reset_cache', 'All cache files have been deleted!'),
(442, 1, 'msg_role_changed', 'User role successfully changed!'),
(443, 1, 'msg_rss_warning', 'If you chose to download the images to your server, adding posts will take more time and will use more resources. If you see any problems, increase \'max_execution_time\' and \'memory_limit\' values from your server settings.'),
(444, 1, 'msg_send_confirmation_email', 'A confirmation email has been sent to your email address for activation. Please confirm your account.'),
(445, 1, 'msg_slug_used', 'The slug you entered is being used by another user!'),
(446, 1, 'msg_unsubscribe', 'You will no longer receive emails from us!'),
(447, 1, 'msg_updated', 'Changes successfully saved!'),
(448, 1, 'msg_username_unique_error', 'The username has already been taken.'),
(449, 1, 'msg_user_added', 'User successfully added!'),
(450, 1, 'msg_widget_delete', 'Default widgets cannot be deleted!'),
(451, 1, 'msg_wrong_password', 'Wrong Password!'),
(452, 1, 'multilingual_system', 'Multilingual System'),
(453, 1, 'musician', 'Musician'),
(454, 1, 'name', 'Name'),
(455, 1, 'navigation', 'Navigation'),
(456, 1, 'navigation_exp', 'You can manage the navigation by dragging and dropping menu items.'),
(457, 1, 'nav_drag_warning', 'You cannot drag a category below a page or a page below a category link!'),
(458, 1, 'never', 'Never'),
(459, 1, 'newsletter', 'Newsletter'),
(460, 1, 'newsletter_desc', 'Join our subscribers list to get the latest news, updates and special offers directly in your inbox'),
(461, 1, 'newsletter_email_error', 'Select email addresses that you want to send mail!'),
(462, 1, 'newsletter_popup', 'Newsletter Popup'),
(463, 1, 'newsletter_send_many_exp', 'Some servers do not allow mass mailing. Therefore, instead of sending your mails to all subscribers at once, you can send them part by part (Example: 50 subscribers at once). If your mail server stops sending mail, the sending process will also stop.'),
(464, 1, 'new_password', 'New Password'),
(465, 1, 'next', 'Next'),
(466, 1, 'next_article', 'Next Article'),
(467, 1, 'next_video', 'Next Video'),
(468, 1, 'no', 'No'),
(469, 1, 'none', 'None'),
(470, 1, 'November', 'Nov'),
(471, 1, 'no_records_found', 'No records found.'),
(472, 1, 'no_thanks', 'No, thanks'),
(473, 1, 'number_of_correct_answers', 'Number of Correct Answers'),
(474, 1, 'number_of_correct_answers_range', 'The range of correct answers to show this result'),
(475, 1, 'number_of_days', 'Number of Days'),
(476, 1, 'number_of_days_exp', 'If you add 30 here, the system will delete posts older than 30 days'),
(477, 1, 'number_of_links_in_menu', 'The number of links that appear in the menu'),
(478, 1, 'number_of_posts_import', 'Number of Posts to Import'),
(479, 1, 'October', 'Oct'),
(480, 1, 'ok', 'OK'),
(481, 1, 'old_password', 'Old Password'),
(482, 1, 'online', 'online'),
(483, 1, 'only_registered', 'Only Registered'),
(484, 1, 'optional', 'Optional'),
(485, 1, 'optional_url', 'Optional URL'),
(486, 1, 'optional_url_name', 'Post Optional URL Button Name'),
(487, 1, 'options', 'Options'),
(488, 1, 'option_1', 'Option 1'),
(489, 1, 'option_10', 'Option 10'),
(490, 1, 'option_2', 'Option 2'),
(491, 1, 'option_3', 'Option 3'),
(492, 1, 'option_4', 'Option 4'),
(493, 1, 'option_5', 'Option 5'),
(494, 1, 'option_6', 'Option 6'),
(495, 1, 'option_7', 'Option 7'),
(496, 1, 'option_8', 'Option 8'),
(497, 1, 'option_9', 'Option 9'),
(498, 1, 'or', 'or'),
(499, 1, 'order', 'Menu Order'),
(500, 1, 'order_1', 'Order'),
(501, 1, 'or_login_with_email', 'Or login with email'),
(502, 1, 'or_register_with_email', 'Or register with email'),
(503, 1, 'page', 'Page'),
(504, 1, 'pages', 'Pages'),
(505, 1, 'pageviews', 'Pageviews'),
(506, 1, 'page_not_found', 'Page not found'),
(507, 1, 'page_not_found_sub', 'The page you are looking for doesn\'t exist.'),
(508, 1, 'page_type', 'Page Type'),
(509, 1, 'pagination_number_posts', 'Number of Posts Per Page (Pagination)'),
(510, 1, 'panel', 'Panel'),
(511, 1, 'parent_category', 'Parent Category'),
(512, 1, 'parent_link', 'Parent Link'),
(513, 1, 'password', 'Password'),
(514, 1, 'paste_ad_code', 'Ad Code'),
(515, 1, 'paste_ad_url', 'Ad URL'),
(516, 1, 'payouts', 'Payouts'),
(517, 1, 'payout_method', 'Payout Method'),
(518, 1, 'payout_methods', 'Payout Methods'),
(519, 1, 'paypal', 'PayPal'),
(520, 1, 'paypal_email_address', 'PayPal Email Address'),
(521, 1, 'pending_comments', 'Pending Comments'),
(522, 1, 'pending_posts', 'Pending Posts'),
(523, 1, 'permissions', 'Permissions'),
(524, 1, 'personality_quiz', 'Personality Quiz'),
(525, 1, 'personality_quiz_exp', 'Quizzes with custom results'),
(526, 1, 'phone', 'Phone'),
(527, 1, 'phrase', 'Phrase'),
(528, 1, 'phrases', 'Phrases'),
(529, 1, 'placeholder_search', 'Search...'),
(530, 1, 'play_again', 'Play Again'),
(531, 1, 'play_list_empty', 'Playlist is empty.'),
(532, 1, 'please_select_option', 'Please select an option!'),
(533, 1, 'poll', 'Poll'),
(534, 1, 'polls', 'Polls'),
(535, 1, 'popular_posts', 'Popular Posts'),
(536, 1, 'post', 'Post'),
(537, 1, 'postcode', 'Postcode'),
(538, 1, 'posts', 'Posts'),
(539, 1, 'posts_bottom_ad_space', 'Posts (Bottom)'),
(540, 1, 'posts_top_ad_space', 'Posts (Top)'),
(541, 1, 'post_bottom_ad_space', 'Post Details (Bottom)'),
(542, 1, 'post_comment', 'Post Comment'),
(543, 1, 'post_details', 'Post Details'),
(544, 1, 'post_formats', 'Post Formats'),
(545, 1, 'post_list_style', 'Post Item List Style'),
(546, 1, 'post_options', 'Post Options'),
(547, 1, 'post_owner', 'Post Owner'),
(548, 1, 'post_tags', 'Tags:'),
(549, 1, 'post_top_ad_space', 'Post Details (Top)'),
(550, 1, 'post_type', 'Post Type'),
(551, 1, 'post_url_structure', 'Post URL Structure'),
(552, 1, 'post_url_structure_exp', 'Changing the URL structure will not affect old records.'),
(553, 1, 'post_url_structure_slug', 'Use Slug in URLs'),
(554, 1, 'post_url_structur_id', 'Use ID Numbers in URLs'),
(555, 1, 'preferences', 'Preferences'),
(556, 1, 'preview', 'Preview'),
(557, 1, 'previous', 'Previous'),
(558, 1, 'previous_article', 'Previous Article'),
(559, 1, 'previous_video', 'Previous Video'),
(560, 1, 'primary_font', 'Primary Font (Main)'),
(561, 1, 'priority', 'Priority'),
(562, 1, 'priority_exp', 'The priority of a particular URL relative to other pages on the same site'),
(563, 1, 'priority_none', 'Automatically Calculated Priority'),
(564, 1, 'profile', 'Profile'),
(565, 1, 'profile_bottom_ad_space', 'Profile (Bottom)'),
(566, 1, 'profile_top_ad_space', 'Profile (Top)'),
(567, 1, 'publish', 'Publish'),
(568, 1, 'pwa_warning', 'If you enable PWA option, read \'Progressive Web App (PWA)\' section from our documentation to make the necessary settings.'),
(569, 1, 'question', 'Question'),
(570, 1, 'questions', 'Questions'),
(571, 1, 'quiz_images', 'Quiz Images'),
(572, 1, 'random_posts', 'Random Posts'),
(573, 1, 'reading_list', 'Reading List'),
(574, 1, 'reading_list_bottom_ad_space', 'Reading List (Bottom)'),
(575, 1, 'reading_list_top_ad_space', 'Reading List (Top)'),
(576, 1, 'read_more_button_text', 'Read More Button Text'),
(577, 1, 'recently_added_comments', 'Recently added comments'),
(578, 1, 'recently_added_contact_messages', 'Recently added contact messages'),
(579, 1, 'recently_added_unapproved_comments', 'Recently added unapproved comments'),
(580, 1, 'recently_registered_users', 'Recently registered users'),
(581, 1, 'recommended', 'Recommended'),
(582, 1, 'recommended_posts', 'Recommended Posts'),
(583, 1, 'redirect_rss_posts_to_original', 'Redirect RSS Posts to the Original Site'),
(584, 1, 'refresh_cache_database_changes', 'Refresh Cache Files When Database Changes'),
(585, 1, 'region_code', 'Region Code'),
(586, 1, 'register', 'Register'),
(587, 1, 'registered_emails', 'Registered Emails'),
(588, 1, 'registered_users_can_vote', 'Only Registered Users Can Vote'),
(589, 1, 'registration_system', 'Registration System'),
(590, 1, 'related_posts', 'Related Posts'),
(591, 1, 'related_videos', 'Related Videos'),
(592, 1, 'remove_ban', 'Remove Ban'),
(593, 1, 'remove_breaking', 'Remove from Breaking'),
(594, 1, 'remove_featured', 'Remove from Featured'),
(595, 1, 'remove_recommended', 'Remove from Recommended'),
(596, 1, 'remove_slider', 'Remove from Slider'),
(597, 1, 'reply_to', 'Reply-To'),
(598, 1, 'required', 'Required'),
(599, 1, 'resend_activation_email', 'Resend Activation Email'),
(600, 1, 'reset', 'Reset'),
(601, 1, 'reset_cache', 'Reset Cache'),
(602, 1, 'reset_password', 'Reset Password'),
(603, 1, 'reset_password_error', 'We can\'t find a user with that e-mail address!'),
(604, 1, 'reset_password_success', 'We\'ve sent an email for resetting your password to your email address. Please check your email for next steps.'),
(605, 1, 'result', 'Result'),
(606, 1, 'results', 'Results'),
(607, 1, 'reward_amount', 'Reward Amount for 1000 Pageviews'),
(608, 1, 'reward_system', 'Reward System'),
(609, 1, 'right', 'Right'),
(610, 1, 'right_to_left', 'Right to Left'),
(611, 1, 'role', 'Role'),
(612, 1, 'roles_permissions', 'Roles & Permissions'),
(613, 1, 'role_name', 'Role Name'),
(614, 1, 'route_settings', 'Route Settings'),
(615, 1, 'route_settings_warning', 'You cannot use special characters in routes. If your language contains special characters, please be careful when editing routes. If you enter an invalid route, you will not be able to access the related page.'),
(616, 1, 'rss', 'RSS'),
(617, 1, 'rss_content', 'RSS Content'),
(618, 1, 'rss_feeds', 'RSS Feeds'),
(619, 1, 'sad', 'Sad'),
(620, 1, 'save', 'Save'),
(621, 1, 'save_changes', 'Save Changes'),
(622, 1, 'save_draft', 'Save as Draft'),
(623, 1, 'scheduled_post', 'Scheduled Post'),
(624, 1, 'scheduled_posts', 'Scheduled Posts'),
(625, 1, 'search', 'Search'),
(626, 1, 'search_bottom_ad_space', 'Search (Bottom)'),
(627, 1, 'search_in_post_content', 'Search in Post Content'),
(628, 1, 'search_noresult', 'No results found.'),
(629, 1, 'search_top_ad_space', 'Search (Top)'),
(630, 1, 'secondary_font', 'Secondary Font (Titles)'),
(631, 1, 'secret_key', 'Secret Key'),
(632, 1, 'secure_key', 'Secure Key'),
(633, 1, 'select', 'Select'),
(634, 1, 'select_ad_spaces', 'Select Ad Space'),
(635, 1, 'select_an_option', 'Select an option'),
(636, 1, 'select_audio', 'Select Audio'),
(637, 1, 'select_a_result', 'Select a result'),
(638, 1, 'select_category', 'Select a category'),
(639, 1, 'select_file', 'Select File'),
(640, 1, 'select_image', 'Select Image'),
(641, 1, 'select_multiple_images', 'You can select multiple images.'),
(642, 1, 'select_video', 'Select Video'),
(643, 1, 'send_contact_to_mail', 'Send Contact Messages to Email Address'),
(644, 1, 'send_email', 'Send Email'),
(645, 1, 'send_email_registered', 'Send Email to Registered Emails'),
(646, 1, 'send_email_subscriber', 'Send Email to Subscriber'),
(647, 1, 'send_email_subscribers', 'Send Email to Subscribers'),
(648, 1, 'send_test_email', 'Send Test Email'),
(649, 1, 'send_test_email_exp', 'You can send a test mail to check if your mail server is working.'),
(650, 1, 'seo_options', 'Seo options'),
(651, 1, 'seo_tools', 'SEO Tools'),
(652, 1, 'September', 'Sep'),
(653, 1, 'server_response', 'Server\'s Response'),
(654, 1, 'settings', 'Settings'),
(655, 1, 'settings_language', 'Settings Language'),
(656, 1, 'set_as_album_cover', 'Set as Album Cover'),
(657, 1, 'set_as_default', 'Set as Default'),
(658, 1, 'set_default_payment_account', 'Set as Default Payment Account'),
(659, 1, 'set_payout_account', 'Set Payout Account'),
(660, 1, 'share', 'Share'),
(661, 1, 'shared', 'Shared'),
(662, 1, 'short_form', 'Short Form'),
(663, 1, 'show', 'Show'),
(664, 1, 'show_all_files', 'Show all Files'),
(665, 1, 'show_at_homepage', 'Show on Homepage'),
(666, 1, 'show_breadcrumb', 'Show Breadcrumb'),
(667, 1, 'show_cookies_warning', 'Show Cookies Warning'),
(668, 1, 'show_email_on_profile', 'Show Email on Profile Page'),
(669, 1, 'show_featured_section', 'Show Featured Section'),
(670, 1, 'show_images_from_original_source', 'Show Images from Original Source'),
(671, 1, 'show_item_numbers', 'Show Item Numbers in Post Details Page'),
(672, 1, 'show_latest_posts_homepage', 'Show Latest Posts on Homepage'),
(673, 1, 'show_latest_posts_on_featured', 'Show Latest Posts on Featured Posts'),
(674, 1, 'show_latest_posts_on_slider', 'Show Latest Posts on Slider'),
(675, 1, 'show_news_ticker', 'Show News Ticker'),
(676, 1, 'show_only_own_files', 'Show Only Users Own Files'),
(677, 1, 'show_only_registered', 'Show Only to Registered Users'),
(678, 1, 'show_on_menu', 'Show on Menu'),
(679, 1, 'show_post_author', 'Show Post Author'),
(680, 1, 'show_post_dates', 'Show Post Date'),
(681, 1, 'show_post_view_counts', 'Show Post View Count'),
(682, 1, 'show_read_more_button', 'Show Read More Button'),
(683, 1, 'show_right_column', 'Show Right Column'),
(684, 1, 'show_title', 'Show Title'),
(685, 1, 'show_user_email_profile', 'Show User\'s Email on Profile'),
(686, 1, 'sidebar_bottom_ad_space', 'Sidebar (Bottom)'),
(687, 1, 'sidebar_top_ad_space', 'Sidebar (Top)'),
(688, 1, 'sitemap', 'Sitemap'),
(689, 1, 'sitemap_generate_exp', 'If your site has more than 50,000 links, the sitemap.xml file will be created in parts.'),
(690, 1, 'site_color', 'Site Color'),
(691, 1, 'site_description', 'Site Description'),
(692, 1, 'site_font', 'Site Font'),
(693, 1, 'site_key', 'Site Key'),
(694, 1, 'site_title', 'Site Title'),
(695, 1, 'slider', 'Slider'),
(696, 1, 'slider_order', 'Slider Order'),
(697, 1, 'slider_posts', 'Slider Posts'),
(698, 1, 'slug', 'Slug'),
(699, 1, 'slug_exp', 'If you leave it blank, it will be generated automatically.'),
(700, 1, 'smtp', 'SMTP'),
(701, 1, 'social_accounts', 'Social Accounts'),
(702, 1, 'social_login_settings', 'Social Login Settings'),
(703, 1, 'social_media_settings', 'Social Media Settings'),
(704, 1, 'sorted_list', 'Sorted List'),
(705, 1, 'sorted_list_exp', 'A list based article'),
(706, 1, 'sorted_list_items', 'Sorted List Items'),
(707, 1, 'sort_featured_posts', 'Sort Featured Posts'),
(708, 1, 'sort_slider_posts', 'Sort Slider Posts'),
(709, 1, 'state', 'State'),
(710, 1, 'status', 'Status'),
(711, 1, 'storage', 'Storage'),
(712, 1, 'style', 'Style'),
(713, 1, 'subcategories', 'Subcategories'),
(714, 1, 'subcategory', 'Subcategory'),
(715, 1, 'subject', 'Subject'),
(716, 1, 'subscribe', 'Subscribe'),
(717, 1, 'subscribers', 'Subscribers'),
(718, 1, 'summary', 'Summary'),
(719, 1, 'swift', 'SWIFT'),
(720, 1, 'swift_code', 'SWIFT Code'),
(721, 1, 'swift_iban', 'Bank Account Number/IBAN'),
(722, 1, 'tag', 'Tag'),
(723, 1, 'tags', 'Tags'),
(724, 1, 'tag_bottom_ad_space', 'Tag (Bottom)'),
(725, 1, 'tag_top_ad_space', 'Tag (Top)'),
(726, 1, 'terms_conditions', 'Terms & Conditions'),
(727, 1, 'terms_conditions_exp', 'I have read and agree to the'),
(728, 1, 'tertiary_font', 'Tertiary Font (Post & Page Text)'),
(729, 1, 'text_direction', 'Text Direction'),
(730, 1, 'text_editor_language', 'Text Editor Language'),
(731, 1, 'text_list_empty', 'Your reading list is empty.'),
(732, 1, 'themes', 'Themes'),
(733, 1, 'the_operation_completed', 'The operation completed successfully!'),
(734, 1, 'this_month', 'This Month'),
(735, 1, 'this_week', 'This Week'),
(736, 1, 'timezone', 'Timezone'),
(737, 1, 'title', 'Title'),
(738, 1, 'to', 'To:'),
(739, 1, 'top_menu', 'Top Menu'),
(740, 1, 'total_pageviews', 'Total Pageviews'),
(741, 1, 'total_vote', 'Total Vote:'),
(742, 1, 'translation', 'Translation'),
(743, 1, 'trivia_quiz', 'Trivia Quiz'),
(744, 1, 'trivia_quiz_exp', 'Quizzes with right and wrong answers'),
(745, 1, 'twitter', 'Twitter'),
(746, 1, 'txt_processing', 'Processing...'),
(747, 1, 'type', 'Type'),
(748, 1, 'type_tag', 'Type tag and hit enter'),
(749, 1, 'unconfirmed', 'Unconfirmed'),
(750, 1, 'unfollow', 'Unfollow'),
(751, 1, 'unsubscribe', 'Unsubscribe'),
(752, 1, 'unsubscribe_successful', 'Unsubscribe Successful!'),
(753, 1, 'update', 'Update'),
(754, 1, 'updated', 'Updated'),
(755, 1, 'update_album', 'Update Album'),
(756, 1, 'update_article', 'Update Article'),
(757, 1, 'update_audio', 'Update Audio'),
(758, 1, 'update_category', 'Update Category'),
(759, 1, 'update_font', 'Update Font'),
(760, 1, 'update_gallery', 'Update Gallery'),
(761, 1, 'update_image', 'Update Image'),
(762, 1, 'update_language', 'Update Language'),
(763, 1, 'update_link', 'Update Menu Link'),
(764, 1, 'update_page', 'Update Page'),
(765, 1, 'update_personality_quiz', 'Update Personality Quiz'),
(766, 1, 'update_poll', 'Update Poll'),
(767, 1, 'update_post', 'Update Post'),
(768, 1, 'update_profile', 'Update Profile'),
(769, 1, 'update_rss_feed', 'Update RSS Feed'),
(770, 1, 'update_sorted_list', 'Update Sorted List'),
(771, 1, 'update_subcategory', 'Update Subcategory'),
(772, 1, 'update_trivia_quiz', 'Update Trivia Quiz'),
(773, 1, 'update_video', 'Update Video'),
(774, 1, 'update_widget', 'Update Widget'),
(775, 1, 'upload', 'Upload'),
(776, 1, 'uploading', 'Uploading...'),
(777, 1, 'upload_csv_file', 'Upload CSV File'),
(778, 1, 'upload_image', 'Upload Image'),
(779, 1, 'upload_video', 'Upload Video'),
(780, 1, 'upload_your_banner', 'Create Ad Code'),
(781, 1, 'url', 'URL'),
(782, 1, 'user', 'User'),
(783, 1, 'username', 'Username'),
(784, 1, 'users', 'Users'),
(785, 1, 'user_agent', 'User-Agent'),
(786, 1, 'user_agreement', 'User Agreement'),
(787, 1, 'user_id', 'User Id'),
(788, 1, 'vertical', 'Vertical'),
(789, 1, 'video', 'Video'),
(790, 1, 'videos', 'Videos'),
(791, 1, 'video_embed_code', 'Video Embed Code'),
(792, 1, 'video_file', 'Video File'),
(793, 1, 'video_name', 'Video Name'),
(794, 1, 'video_post_exp', 'Upload or embed videos'),
(795, 1, 'video_thumbnails', 'Video Thumbnail'),
(796, 1, 'video_url', 'Video URL'),
(797, 1, 'view_all', 'View All'),
(798, 1, 'view_all_posts', 'View All Posts'),
(799, 1, 'view_options', 'View Options'),
(800, 1, 'view_results', 'View Results'),
(801, 1, 'view_site', 'View Site'),
(802, 1, 'visibility', 'Visibility'),
(803, 1, 'visual_settings', 'Visual Settings'),
(804, 1, 'vkontakte', 'VKontakte'),
(805, 1, 'vote', 'Vote'),
(806, 1, 'voted_message', 'You already voted this poll before.'),
(807, 1, 'vote_permission', 'Vote Permission'),
(808, 1, 'warning', 'Warning'),
(809, 1, 'warning_default_payout_account', 'Your earnings will be sent to your default payout account.'),
(810, 1, 'weekly', 'Weekly'),
(811, 1, 'whats_your_reaction', 'What\'s Your Reaction?'),
(812, 1, 'widget', 'Widget'),
(813, 1, 'widgets', 'Widgets'),
(814, 1, 'wow', 'Wow'),
(815, 1, 'wrong_answer', 'Wrong Answer'),
(816, 1, 'wrong_password_error', 'Wrong old password!'),
(817, 1, 'year', 'year'),
(818, 1, 'yearly', 'Yearly'),
(819, 1, 'years', 'years'),
(820, 1, 'yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `title` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `is_custom` tinyint(1) DEFAULT 1,
  `page_default_name` varchar(100) DEFAULT NULL,
  `page_content` mediumtext DEFAULT NULL,
  `page_order` smallint(6) DEFAULT 1,
  `visibility` tinyint(1) DEFAULT 1,
  `title_active` tinyint(1) DEFAULT 1,
  `breadcrumb_active` tinyint(1) DEFAULT 1,
  `right_column_active` tinyint(1) DEFAULT 1,
  `need_auth` tinyint(1) DEFAULT 0,
  `location` varchar(255) DEFAULT 'top',
  `link` varchar(1000) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `page_type` varchar(50) DEFAULT 'page',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `lang_id`, `title`, `slug`, `description`, `keywords`, `is_custom`, `page_default_name`, `page_content`, `page_order`, `visibility`, `title_active`, `breadcrumb_active`, `right_column_active`, `need_auth`, `location`, `link`, `parent_id`, `page_type`, `created_at`) VALUES
(1, 1, 'Contact', 'contact', 'Varient Contact Page', 'varient, contact, page', 0, 'contact', NULL, 1, 1, 1, 1, 0, 0, 'top', NULL, 0, 'page', '2020-02-18 11:09:21'),
(2, 1, 'Gallery', 'gallery', 'Varient Gallery Page', 'varient, gallery, page', 0, 'gallery', NULL, 1, 1, 1, 1, 0, 0, 'main', NULL, 0, 'page', '2020-02-18 11:11:40'),
(3, 1, 'Terms & Conditions', 'terms-conditions', 'Varient Terms Conditions Page', 'Terms, Conditions, Varient', 0, 'terms_conditions', NULL, 1, 1, 1, 1, 0, 0, 'footer', NULL, 0, 'page', '2020-02-18 11:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `payout_method` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `question` text DEFAULT NULL,
  `option1` text DEFAULT NULL,
  `option2` text DEFAULT NULL,
  `option3` text DEFAULT NULL,
  `option4` text DEFAULT NULL,
  `option5` text DEFAULT NULL,
  `option6` text DEFAULT NULL,
  `option7` text DEFAULT NULL,
  `option8` text DEFAULT NULL,
  `option9` text DEFAULT NULL,
  `option10` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `vote_permission` varchar(50) DEFAULT 'all',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vote` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `title` varchar(500) DEFAULT NULL,
  `title_slug` varchar(500) DEFAULT NULL,
  `title_hash` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `summary` varchar(5000) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_big` varchar(255) DEFAULT NULL,
  `image_default` varchar(255) DEFAULT NULL,
  `image_slider` varchar(255) DEFAULT NULL,
  `image_mid` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  `image_mime` varchar(20) DEFAULT 'jpg',
  `image_storage` varchar(20) DEFAULT 'local',
  `optional_url` varchar(1000) DEFAULT NULL,
  `pageviews` int(11) DEFAULT 0,
  `need_auth` tinyint(1) DEFAULT 0,
  `is_slider` tinyint(1) DEFAULT 0,
  `slider_order` tinyint(1) DEFAULT 1,
  `is_featured` tinyint(1) DEFAULT 0,
  `featured_order` tinyint(1) DEFAULT 1,
  `is_recommended` tinyint(1) DEFAULT 0,
  `is_breaking` tinyint(1) DEFAULT 1,
  `is_scheduled` tinyint(1) DEFAULT 0,
  `visibility` tinyint(1) DEFAULT 1,
  `show_right_column` tinyint(1) DEFAULT 1,
  `post_type` varchar(50) DEFAULT 'post',
  `video_path` varchar(255) DEFAULT NULL,
  `video_storage` varchar(20) DEFAULT 'local',
  `image_url` varchar(2000) DEFAULT NULL,
  `video_url` varchar(2000) DEFAULT NULL,
  `video_embed_code` varchar(2000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `feed_id` int(11) DEFAULT NULL,
  `post_url` varchar(1000) DEFAULT NULL,
  `show_post_url` tinyint(1) DEFAULT 1,
  `image_description` varchar(500) DEFAULT NULL,
  `show_item_numbers` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_audios`
--

CREATE TABLE `post_audios` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `audio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_files`
--

CREATE TABLE `post_files` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_gallery_items`
--

CREATE TABLE `post_gallery_items` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_large` varchar(255) DEFAULT NULL,
  `image_description` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `item_order` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_images`
--

CREATE TABLE `post_images` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image_big` varchar(255) DEFAULT NULL,
  `image_default` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_pageviews_month`
--

CREATE TABLE `post_pageviews_month` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `reward_amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_pageviews_week`
--

CREATE TABLE `post_pageviews_week` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `post_user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `reward_amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_sorted_list_items`
--

CREATE TABLE `post_sorted_list_items` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_large` varchar(255) DEFAULT NULL,
  `image_description` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `item_order` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `image_storage` varchar(20) DEFAULT 'local',
  `answer_text` varchar(500) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `assigned_result_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_images`
--

CREATE TABLE `quiz_images` (
  `id` int(11) NOT NULL,
  `image_default` varchar(255) DEFAULT NULL,
  `image_small` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `image_mime` varchar(20) DEFAULT 'jpg',
  `storage` varchar(20) DEFAULT 'local',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `question` varchar(500) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `image_storage` varchar(20) DEFAULT 'local',
  `description` text DEFAULT NULL,
  `question_order` int(11) DEFAULT 1,
  `answer_format` varchar(30) DEFAULT 'small_image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `result_title` varchar(500) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `image_storage` varchar(20) DEFAULT 'local',
  `description` text DEFAULT NULL,
  `min_correct_count` mediumint(9) DEFAULT NULL,
  `max_correct_count` mediumint(9) DEFAULT NULL,
  `result_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `re_like` int(11) DEFAULT 0,
  `re_dislike` int(11) DEFAULT 0,
  `re_love` int(11) DEFAULT 0,
  `re_funny` int(11) DEFAULT 0,
  `re_angry` int(11) DEFAULT 0,
  `re_sad` int(11) DEFAULT 0,
  `re_wow` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reading_lists`
--

CREATE TABLE `reading_lists` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `admin_panel` tinyint(1) DEFAULT NULL,
  `add_post` tinyint(1) DEFAULT NULL,
  `manage_all_posts` tinyint(1) DEFAULT NULL,
  `navigation` tinyint(1) DEFAULT NULL,
  `pages` tinyint(1) DEFAULT NULL,
  `rss_feeds` tinyint(1) DEFAULT NULL,
  `categories` tinyint(1) DEFAULT NULL,
  `widgets` tinyint(1) DEFAULT NULL,
  `polls` tinyint(1) DEFAULT NULL,
  `gallery` tinyint(1) DEFAULT NULL,
  `comments_contact` tinyint(1) DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT NULL,
  `ad_spaces` tinyint(1) DEFAULT NULL,
  `users` tinyint(1) DEFAULT NULL,
  `seo_tools` tinyint(1) DEFAULT NULL,
  `settings` tinyint(1) DEFAULT NULL,
  `reward_system` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role`, `role_name`, `admin_panel`, `add_post`, `manage_all_posts`, `navigation`, `pages`, `rss_feeds`, `categories`, `widgets`, `polls`, `gallery`, `comments_contact`, `newsletter`, `ad_spaces`, `users`, `seo_tools`, `settings`, `reward_system`) VALUES
(1, 'admin', 'Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'moderator', 'Moderator', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1),
(3, 'author', 'Author', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'user', 'User', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `admin` varchar(100) DEFAULT 'admin',
  `profile` varchar(100) DEFAULT 'profile',
  `tag` varchar(100) DEFAULT 'tag',
  `reading_list` varchar(100) DEFAULT 'reading-list',
  `settings` varchar(100) DEFAULT 'settings',
  `social_accounts` varchar(100) DEFAULT 'social-accounts',
  `preferences` varchar(100) DEFAULT 'preferences',
  `visual_settings` varchar(100) DEFAULT 'visual-settings',
  `change_password` varchar(100) DEFAULT 'change-password',
  `forgot_password` varchar(100) DEFAULT 'forgot-password',
  `reset_password` varchar(100) DEFAULT 'reset-password',
  `delete_account` varchar(100) DEFAULT 'delete-account',
  `register` varchar(100) DEFAULT 'register',
  `posts` varchar(100) DEFAULT 'posts',
  `search` varchar(100) DEFAULT 'search',
  `rss_feeds` varchar(100) DEFAULT 'rss-feeds',
  `gallery_album` varchar(100) DEFAULT 'gallery-album',
  `earnings` varchar(100) DEFAULT 'earnings',
  `payouts` varchar(100) DEFAULT 'payouts',
  `set_payout_account` varchar(100) DEFAULT 'set-payout-account',
  `logout` varchar(100) DEFAULT 'logout'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `admin`, `profile`, `tag`, `reading_list`, `settings`, `social_accounts`, `preferences`, `visual_settings`, `change_password`, `forgot_password`, `reset_password`, `delete_account`, `register`, `posts`, `search`, `rss_feeds`, `gallery_album`, `earnings`, `payouts`, `set_payout_account`, `logout`) VALUES
(1, 'admin', 'profile', 'tag', 'reading-list', 'settings', 'social-accounts', 'preferences', 'visual-settings', 'change-password', 'forgot-password', 'reset-password', 'delete-account', 'register', 'posts', 'search', 'rss-feeds', 'gallery-album', 'earnings', 'payouts', 'set-payout-account', 'logout');

-- --------------------------------------------------------

--
-- Table structure for table `rss_feeds`
--

CREATE TABLE `rss_feeds` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `feed_name` varchar(500) DEFAULT NULL,
  `feed_url` varchar(1000) DEFAULT NULL,
  `post_limit` smallint(6) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_saving_method` varchar(30) DEFAULT 'url',
  `auto_update` tinyint(1) DEFAULT 1,
  `read_more_button` tinyint(1) DEFAULT 1,
  `read_more_button_text` varchar(255) DEFAULT 'Read More',
  `user_id` int(11) DEFAULT NULL,
  `add_posts_as_draft` tinyint(1) DEFAULT 0,
  `is_cron_updated` tinyint(1) DEFAULT 0,
  `generate_keywords_from_title` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT 1,
  `site_title` varchar(255) DEFAULT NULL,
  `home_title` varchar(255) DEFAULT 'Index',
  `site_description` varchar(500) DEFAULT NULL,
  `keywords` varchar(500) DEFAULT NULL,
  `application_name` varchar(255) DEFAULT NULL,
  `primary_font` smallint(6) DEFAULT 19,
  `secondary_font` smallint(6) DEFAULT 25,
  `tertiary_font` smallint(6) DEFAULT 32,
  `facebook_url` varchar(500) DEFAULT NULL,
  `twitter_url` varchar(500) DEFAULT NULL,
  `instagram_url` varchar(500) DEFAULT NULL,
  `pinterest_url` varchar(500) DEFAULT NULL,
  `linkedin_url` varchar(500) DEFAULT NULL,
  `vk_url` varchar(500) DEFAULT NULL,
  `telegram_url` varchar(500) DEFAULT NULL,
  `youtube_url` varchar(500) DEFAULT NULL,
  `optional_url_button_name` varchar(500) DEFAULT 'Click Here To See More',
  `about_footer` varchar(1000) DEFAULT NULL,
  `contact_text` text DEFAULT NULL,
  `contact_address` varchar(500) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  `cookies_warning` tinyint(1) DEFAULT 0,
  `cookies_warning_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `lang_id`, `site_title`, `home_title`, `site_description`, `keywords`, `application_name`, `primary_font`, `secondary_font`, `tertiary_font`, `facebook_url`, `twitter_url`, `instagram_url`, `pinterest_url`, `linkedin_url`, `vk_url`, `telegram_url`, `youtube_url`, `optional_url_button_name`, `about_footer`, `contact_text`, `contact_address`, `contact_email`, `contact_phone`, `copyright`, `cookies_warning`, `cookies_warning_text`) VALUES
(1, 1, 'Varient - News Magazine', 'Index', 'Varient Index Page', 'index, home, varient', 'Varient', 19, 25, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Click Here To See More', NULL, NULL, NULL, NULL, NULL, 'Copyright 2022 Varient - All Rights Reserved.', 0, '<p>This site uses cookies. By continuing to browse the site you are agreeing to our use of cookies.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tag_slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT 'name@domain.com',
  `email_status` tinyint(1) DEFAULT 0,
  `token` varchar(500) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(100) DEFAULT 'user',
  `user_type` varchar(50) DEFAULT 'registered',
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `vk_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `about_me` varchar(5000) DEFAULT NULL,
  `facebook_url` varchar(500) DEFAULT NULL,
  `twitter_url` varchar(500) DEFAULT NULL,
  `instagram_url` varchar(500) DEFAULT NULL,
  `pinterest_url` varchar(500) DEFAULT NULL,
  `linkedin_url` varchar(500) DEFAULT NULL,
  `vk_url` varchar(500) DEFAULT NULL,
  `telegram_url` varchar(500) DEFAULT NULL,
  `youtube_url` varchar(500) DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `show_email_on_profile` tinyint(1) DEFAULT 1,
  `show_rss_feeds` tinyint(1) DEFAULT 1,
  `reward_system_enabled` tinyint(1) DEFAULT 0,
  `balance` double DEFAULT 0,
  `total_pageviews` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_payout_accounts`
--

CREATE TABLE `user_payout_accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payout_paypal_email` varchar(255) DEFAULT NULL,
  `iban_full_name` varchar(255) DEFAULT NULL,
  `iban_country` varchar(100) DEFAULT NULL,
  `iban_bank_name` varchar(255) DEFAULT NULL,
  `iban_number` varchar(500) DEFAULT NULL,
  `swift_full_name` varchar(255) DEFAULT NULL,
  `swift_address` varchar(500) DEFAULT NULL,
  `swift_state` varchar(255) DEFAULT NULL,
  `swift_city` varchar(255) DEFAULT NULL,
  `swift_postcode` varchar(100) DEFAULT NULL,
  `swift_country` varchar(100) DEFAULT NULL,
  `swift_bank_account_holder_name` varchar(255) DEFAULT NULL,
  `swift_iban` varchar(255) DEFAULT NULL,
  `swift_code` varchar(255) DEFAULT NULL,
  `swift_bank_name` varchar(255) DEFAULT NULL,
  `swift_bank_branch_city` varchar(255) DEFAULT NULL,
  `swift_bank_branch_country` varchar(100) DEFAULT NULL,
  `default_payout_account` varchar(30) NOT NULL DEFAULT 'paypal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `video_name` varchar(255) DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `storage` varchar(20) DEFAULT 'local',
  `user_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT 1,
  `title` varchar(500) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `widget_order` int(11) DEFAULT 1,
  `visibility` int(11) DEFAULT 1,
  `is_custom` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `lang_id`, `title`, `content`, `type`, `widget_order`, `visibility`, `is_custom`, `created_at`) VALUES
(1, 1, 'Follow Us', NULL, 'follow-us', 2, 1, 0, '2020-02-18 12:54:39'),
(2, 1, 'Popular Posts', NULL, 'popular-posts', 1, 1, 0, '2020-02-18 12:54:39'),
(3, 1, 'Recommended Posts', NULL, 'recommended-posts', 3, 1, 0, '2020-02-18 12:54:39'),
(4, 1, 'Random Posts', NULL, 'random-slider-posts', 4, 1, 0, '2020-02-18 12:54:39'),
(5, 1, 'Popular Tags', NULL, 'tags', 5, 1, 0, '2020-02-18 12:54:39'),
(6, 1, 'Voting Poll', NULL, 'poll', 6, 1, 0, '2020-02-18 12:54:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_spaces`
--
ALTER TABLE `ad_spaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audios`
--
ALTER TABLE `audios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_post_id` (`post_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fonts`
--
ALTER TABLE `fonts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_translations`
--
ALTER TABLE `language_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang_id` (`lang_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_is_slider` (`is_slider`),
  ADD KEY `idx_is_featured` (`is_featured`),
  ADD KEY `idx_is_recommended` (`is_recommended`),
  ADD KEY `idx_is_breaking` (`is_breaking`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_lang_id` (`lang_id`),
  ADD KEY `idx_is_scheduled` (`is_scheduled`),
  ADD KEY `idx_visibility` (`visibility`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `post_audios`
--
ALTER TABLE `post_audios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_files`
--
ALTER TABLE `post_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_gallery_items`
--
ALTER TABLE `post_gallery_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_pageviews_month`
--
ALTER TABLE `post_pageviews_month`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_post_id` (`post_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `post_pageviews_week`
--
ALTER TABLE `post_pageviews_week`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_post_id` (`post_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `post_sorted_list_items`
--
ALTER TABLE `post_sorted_list_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_images`
--
ALTER TABLE `quiz_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reading_lists`
--
ALTER TABLE `reading_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_post_id` (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_payout_accounts`
--
ALTER TABLE `user_payout_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_spaces`
--
ALTER TABLE `ad_spaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `audios`
--
ALTER TABLE `audios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fonts`
--
ALTER TABLE `fonts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_categories`
--
ALTER TABLE `gallery_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_translations`
--
ALTER TABLE `language_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=821;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_audios`
--
ALTER TABLE `post_audios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_files`
--
ALTER TABLE `post_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_gallery_items`
--
ALTER TABLE `post_gallery_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_pageviews_month`
--
ALTER TABLE `post_pageviews_month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_pageviews_week`
--
ALTER TABLE `post_pageviews_week`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_sorted_list_items`
--
ALTER TABLE `post_sorted_list_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_images`
--
ALTER TABLE `quiz_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reading_lists`
--
ALTER TABLE `reading_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rss_feeds`
--
ALTER TABLE `rss_feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_payout_accounts`
--
ALTER TABLE `user_payout_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
