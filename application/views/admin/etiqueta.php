<?php include_once(dirname(__FILE__) . '/header.php'); ?>

<div id="main-container">
    <div class="panel table-responsive">
        <div class="panel-heading hidden-print">
            <h3 class="m-top-md">Etiqueta<span class="line"></span></h3>
        </div>
    </div>
    <div class="panel-body">
        <div class="content-print col-sm-4">
            <table class="table">
                <tr>
                    <th style="width: 15px;">Nome:</th>
                    <td><?php echo $participante->nome; ?></td>
                </tr>
                <tr>
                    <th>Cargo:</th>
                    <td><?php echo $participante->cargo; ?></td>
                </tr>
            </table>
        </div>
        <div class="form-group">
            <button class="btn btn-primary print-tag">Imprimir</button>
        </div>
    </div>
</div>

<?php include_once(dirname(__FILE__) . '/footer.php'); ?>
<style type="text/css">
    @media print {
        table tr th, table tr td {
            font-size: 150%;
        }
        @page {
            margin: 5px 10px;
        }
        
        html, body {
            margin: 0;
            padding: 0;
            border: 0;
        }
        #printable {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 14px;
        }
        .content-print ~ * {
            display: none;
        }
    }
</style>
<script>
    $(document).ready(function () {
        $(".print-tag").click(function () {
            var $print = $(".content-print").clone().addClass('print').prependTo('body');
            window.print();
            $print.remove();
        });
    });
</script>
