<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="forrst-form-key" content="<?php echo Session::form_key(); ?>">
<title>Magnus says Hello.</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<?php if (Magnus::$config['env'] == 'prod'): ?>

    <!-- production css goes here -->

<?php else: ?>

    <!-- dev css goes here -->

<?php endif; ?>
<!--[if IE]>
<link rel="stylesheet" href="/assets/css/ie.css?<?php echo time(); ?>" type="text/css" media="screen,projection">
<![endif]-->