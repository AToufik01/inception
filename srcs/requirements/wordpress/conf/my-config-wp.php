<?php

// Ensure environment variables are set
if (!getenv('USER_PASSWORD'))
        die('2');
else if (!getenv('NAME_USER'))
        die('3');
else if (!getenv('DB_HOST'))
        die('4');
else if (!getenv('NAME_DATABASE'))
        die('hhh');


// Define database constants
define('DB_NAME', getenv('NAME_DATABASE'));
define('DB_USER', getenv('NAME_USER'));
define('DB_PASSWORD', getenv('USER_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// Define table prefix
$table_prefix = 'wp_';

// Ensure ABSPATH is defined
if (!defined('ABSPATH')) {
    die('ABSPATH is not defined.');
}

// Enable WordPress debugging
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);

// Include WordPress settings
require_once ABSPATH . 'wp-settings.php';
