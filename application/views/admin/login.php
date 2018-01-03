<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Administrar</title>


    <link href="<?php echo base_url() ?>assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url() ?>assets/css/login.css" rel="stylesheet">
    <link href="<?php echo base_url() ?>assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url() ?>assets/css/login.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">

        <?php echo(isset($erro) ? box_alert($erro) : '') ?>
        <form class="form-signin" method="post">
            <div class="panel panel-default">
                <div class="panel-heading">Entrar</div>
                <div class="panel-body">
                    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email" required autofocus>
                    <input type="password" id="inputPassword" name="senha" class="form-control" placeholder="Senha" required>
                </div>
                <div class="panel-footer">
                    <button class="btn btn-primary btn-block" type="submit">Entrar</button>
                </div>
            </div>
      </form>

    </div> <!-- /container -->
  </body>
</html>

