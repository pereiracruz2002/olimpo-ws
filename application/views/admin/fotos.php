<?php include_once(dirname(__FILE__) . '/header.php'); ?>

<div id="main-container" class="panel panel-default">
    
        <div class="panel-heading hidden-print">
            <h3 class="m-top-md"><a href="<?php echo site_url('admin/participantes/novo') ?>" class="btn btn-success btn-sm pull-right">Novo Participante <span class="fa fa-angle-right"></span></a> Fotos</h3>
        </div>
    <div class="panel-body">
        <?php if (isset($saved)): ?>
            <?php echo ($saved['status'] == 'sucesso' ? box_success($saved['msg']) : box_alert($saved['msg'])) ?>
        <?php endif; ?>
        <?php if (count($fotos) < 2): ?>
            <div class="col-sm-2">
                <form id="uploadForm" method="post" action="<?php echo current_url() ?>" enctype="multipart/form-data">
                    <label class="thumbnail text-center">
                        <h1><span class="fa fa-plus fa-2x"></span></h1>
                        <p>Adicionar foto (computador)</p>
                        <input type="file" name="foto" value="" id="fileUpload" class="hidden" accept="image/*" />
                        <input type="hidden" name="add" value="true" />
                    </label>
                </form>
            </div>

            <div class="col-sm-2 col-webcam">
                <label class="thumbnail text-center" data-toggle="modal" data-target=".modal-webcam">
                    <h1><span class="fa fa-plus fa-2x"></span></h1>
                    <p>Adicionar foto (webcam)</p>
                    <!--<input type="file" name="foto" id="fileUpload" class="hidden" />
                    <input type="hidden" name="add" value="true" />-->
                </label>
                <form id="uploadWebcam" method="post" action="<?php echo current_url() ?>" enctype="multipart/form-data">
                    <input type="hidden" value="" name="foto_base64" />
                </form>
            </div>

            <div class="modal fade modal-webcam" tabindex="-1" role="dialog" aria-labelledby="modalWebcam">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">Adicionar foto</h4>
                        </div>
                        <div class="modal-body">
                            <video id="video" width="640" height="480" autoplay></video>
                            <canvas id="canvas" width="640" height="480" class="hide"></canvas>
                        </div>
                        <div class="modal-footer">
                            <button name="snap" class="btn btn-primary" data-toggle="Capturar nova foto">Capturar foto</button>
                            <button name="save" class="btn btn-success disabled" disabled="disabled" data-dismiss="modal">Salvar</button>
                        </div>
                    </div>
                </div>
            </div>
        <?php endif; ?>
        <div class="col-sm-12">
            <?php foreach ($fotos as $item): ?>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src="<?php echo $item->foto ?>" class="img-responsive" />
                        <div class="caption">
                            <a href="<?php echo site_url("admin/participantes/removerfoto/{$item->participante_foto_id}") ?>" class="btn btn-block btn-danger btn-remove-img">Remover</a>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>

<?php include_once(dirname(__FILE__) . '/footer.php'); ?>
