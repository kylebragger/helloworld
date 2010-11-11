<!DOCTYPE html>

<html lang="en">
<head>
    <?php include APPPATH . 'app/views/shared/_head.tpl'; ?>
</head>
<body>
<?php if (false !== ($flash = Session::flash('notice'))): ?>
<div id="flash" class="notice-bar">
    <?php echo $flash; ?>
    <a href="" class="close">&times; Close</a>
</div>
<?php endif; ?>

<!-- start homepage -->
<div id="homepage">
    
    <h1>Hello there.</h1>
    <h2>I&#8217;m Magnus. Nice to meet you.</h2>
    
</div>

<!-- start footer -->
<div id="footer">
    <?php include APPPATH . 'app/views/shared/_footer.tpl'; ?>
</div>

<?php include APPPATH . 'app/views/shared/_js.tpl'; ?>

</body>
</html>