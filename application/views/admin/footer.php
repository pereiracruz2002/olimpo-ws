    </div>
  </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<?php echo base_url() ?>assets/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url() ?>assets/js/admin.js"></script>
    <?php if (file_exists(FCPATH.'assets/js/'.$this->uri->segment(2).'.js')): ?>
    <script src="<?php echo base_url() ?>assets/js/<?php echo $this->uri->segment(2) ?>.js"></script>
    <?php endif; ?>
    <script>
        var site = "<?php echo base_url() ?>";
    </script>
    <?php if (isset($jsFiles)): ?>
        <?php foreach ($jsFiles as $jsFile): ?>
            <script src="<?php echo base_url(); ?>assets/js/<?php echo $jsFile ?>"></script>
        <?php endforeach; ?>
    <?php endif; ?>
  </body>
</html>

