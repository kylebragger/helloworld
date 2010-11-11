<?php if (Magnus::$config['env'] == 'prod'): ?>
    
    <!-- prod js -->
    
<?php else: ?>
    
    <!-- dev js -->
    
<?php endif; ?>

<?php if (isset($js_inject)): ?>
<script charset="utf-8">
<?php echo $js_inject, "\n"; ?>
</script>
<?php endif; ?>