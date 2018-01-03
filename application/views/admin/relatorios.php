<?php include_once(dirname(__FILE__) . '/header.php'); ?>
<div class="panel table-responsive">
    <div class="panel-heading">
        <h3>Relatório - <?php echo $title ?></h3>
    </div>
    <div class="panel-body">
        <h4>Total: <?php echo $total ?> participante<?php echo ($total != 1 ? 's': '') ?> </h4>
        <?php echo $table; ?>
    </div>
</div>
<?php include_once(dirname(__FILE__) . '/footer.php'); ?>
