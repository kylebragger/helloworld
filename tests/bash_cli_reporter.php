<?php

/* from: http://osdir.com/ml/php.simpletest.general/2005-04/msg00007.html */
class BashCliReporter extends TextReporter {
    var $esc_start;
    var $red_bg = '41m';
    var $green_bg = '42m';
    var $default = '0m';
    
    function BashCliReporter() {
        $this->TextReporter();
        $this->esc_start = chr(27).'[';
    }
    
    function resetColors() {
        echo $this->esc_start.$this->default."\n"; //reset back to normal
    }
    
    function paintFooter($test_name) {
        if ($this->getFailCount() + $this->getExceptionCount() == 0) {
            echo $this->esc_start.$this->green_bg; //green background
            print "OK\n";
        } else {
            echo $this->esc_start.$this->red_bg; //red background
            print "FAILURES!!!\n";
        }
        print "Test cases run: " . $this->getTestCaseProgress() .
        "/" . $this->getTestCaseCount() .
        ", Passes: " . $this->getPassCount() .
        ", Failures: " . $this->getFailCount() .
        ", Exceptions: " . $this->getExceptionCount();

        $this->resetColors();
    }
}
