<?php

// protect staging
if ($_SERVER['HTTP_HOST'] == 'staging.forrst.com')
{
    if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW']))
	{
		header('WWW-Authenticate: Basic realm="HC SVNT DRACONES"');
		header('HTTP/1.0 401 Unauthorized');
		die;
	}
	else
	{
        if ($_SERVER['PHP_AUTH_USER'] != 'gr33k' || $_SERVER['PHP_AUTH_PW'] != '4ccent')
        {
            header('WWW-Authenticate: Basic realm="HC SVNT DRACONES"');
    		header('HTTP/1.0 401 Unauthorized');
    		die;
        }
    }
}

// compute our app base path
$basepath = dirname(__FILE__) . '/';
define('APPPATH', str_replace('public/', '', $basepath));
unset($basepath);

// bootstrap
require '../../magnus/base.php';
Magnus::init();
Magnus::run();
