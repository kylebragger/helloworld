<?php

echo "Prepping CSS and JS for deploy...\n";

$css_files['app'] = array('reset', '960', 'screen', 'jquery.tagsinput', 'jquery.autocomplete', 'tipsy', 'prettify');
//$css_files['splash'] = array('reset', 'splash');
//$css_files['iphone'] = array('reset', 'screen', 'iphone');

$js_files['app'] = array('jquery.autocomplete.min', 'jquery.tagsinput', 'jquery.scrollTo-1.4.2-min', 'forrst',
                         'jquery.tipsy', 'jquery.autoresize.min', 'prettify',
                         'lang-apollo',
                         'lang-css',
                         'lang-hs',
                         'lang-lisp',
                         'lang-lua',
                         'lang-ml',
                         'lang-proto',
                         'lang-scala',
                         'lang-sql',
                         'lang-vb',
                         'lang-vhdl',
                         'lang-wiki',
                         'lang-yaml');
//$js_files['splash'] = array('jquery.placeholdize', 'splash');

// cat and minify all files
foreach ($css_files as $group => $files)
{
    echo "CSS[{$group}]: ";
    
    // create the outfile
    $css     = '';
    $outfile = "./public/assets/css/{$group}.prod.css";

    $fp = fopen($outfile, 'wb');
    
    // cat & min
    foreach ($files as $file)
    {
        echo '.';
        
        $css .= file_get_contents("./public/assets/css/{$file}.css");
        $css .= "\n";
    }
    
    echo "\n writing...\n";
    
    // write
    fwrite($fp, $css);
    
    // cleanup
    fclose($fp);
    
    echo " minifying...\n";
    $yuic = '/Users/kyle/Code/yuicompressor-2.4.2/build/yuicompressor-2.4.2.jar';
    exec("java -jar {$yuic} {$outfile} -o {$outfile}");
    
    echo "CSS[{$group}]: done\n";
}

// cat and minify all files
foreach ($js_files as $group => $files)
{
    echo "JS[{$group}]: ";
    
    // create the outfile
    $css     = '';
    $outfile = "./public/assets/js/{$group}.prod.js";

    $fp = fopen($outfile, 'wb');
    
    // cat & min
    foreach ($files as $file)
    {
        echo '.';
        
        $css .= file_get_contents("./public/assets/js/{$file}.js");
        $css .= "\n";
    }
    
    echo "\n writing...\n";
    
    // write
    fwrite($fp, $css);
    
    // cleanup
    fclose($fp);
    
    echo " minifying...\n";
    $yuic = '/Users/kyle/Code/yuicompressor-2.4.2/build/yuicompressor-2.4.2.jar';
    exec("java -jar {$yuic} {$outfile} -o {$outfile}");
    
    echo "JS[{$group}]: done\n";
}

// commit and push
exec("git commit -am 'pre deploy commit'");
exec('git push origin master'); // separate so an empty commit won't block the push

echo "\nDone.\n";

