<?php $tipo_usuario = $this->session->userdata('admin')->usuarios_tipo_id; ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrativo</title>
        <link href="<?php echo base_url() ?>assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="<?php echo base_url() ?>assets/css/dashboard.css" rel="stylesheet">
        <link href="<?php echo base_url() ?>assets/css/font-awesome.min.css" rel="stylesheet" />
    </head>
<body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?php echo site_url('admin/participantes') ?>">Visa Merchant Summit 2017</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <?php if ($tipo_usuario == 2): ?>
                    <li><a href="<?php echo site_url('admin/participantes') ?>">Participantes</a></li>
                    <?php else: ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Usuários <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo site_url('admin/usuarios') ?>">Listar</a></li>
                            <li><a href="<?php echo site_url('admin/usuarios_tipo/') ?>">Tipos de Usuários</a></li>
                        </ul>
                    </li>
                    <li><a href="<?php echo site_url('admin/participantes') ?>">Participantes</a></li>
                    <li><a href="<?php echo site_url('admin/terminais') ?>">Ações</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Relatórios <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo site_url('admin/relatorios/ativacoes/incompletas') ?>">Ativações Incompletas</a></li>
                            <li><a href="<?php echo site_url('admin/relatorios/ativacoes/completas') ?>">Ativações Completas</a></li>
                            <li><a href="<?php echo site_url('admin/vencedores') ?>">Sorteio</a></li>
                        </ul>
                    </li>
                    <?php endif; ?>

                    <li><a href="<?php echo site_url('admin/login/logout') ?>">Sair</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="main-container">
