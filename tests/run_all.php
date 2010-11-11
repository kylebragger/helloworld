<?php

/*----------------------------
 
 Timber test suite
 
----------------------------*/

define('TEST_SUITE', true); // disable custom error handlers

define('APPPATH', dirname(__FILE__) . '/../');
define('TESTURL', 'http://hello.devel:3008');

require '../magnus/base.php';
require BASEPATH . '../simpletest/unit_tester.php';
require BASEPATH . '../simpletest/web_tester.php';
require BASEPATH . 'tests/bash_cli_reporter.php';

class TimberTests extends TestSuite {
    /* what directories should we look for tests in? */
    public static $dirs = array(
        // require tests here
    );
    
    public function __construct()
    {
        $this->TestSuite('All Tests');
        
        $basedir = dirname(__FILE__) . '/';
        foreach (self::$dirs as $dirname)
        {
            $this->addFile("{$basedir}{$dirname}/test_{$dirname}.php");
        }
        
        Magnus::init('test');
        
        DB::disconnect(); // since we auto-connect in Magnus::init()
        DB::$config['dbname'] = 'timber_test';
        DB::connect();
    }
}

$tests = &new TimberTests();
$tests->run(new BashCliReporter());
