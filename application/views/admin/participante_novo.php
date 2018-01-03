<?php include_once(dirname(__FILE__) . "/header.php"); ?>
<input type="hidden" name="token" value="<?php echo $token; ?>" />
<div class="main-container">
    <div class="col-md-12">
        <h3 class="headline m-top-md">Cadastro de participante</h3>
    </div>
    <div class="panel-body">
        <form class="form-search-email hide">
            <div class="form-group">
                <label for="">Endereço de e-mail</label>
                <input type="email" name="email" class="form-control" id="" placeholder="Email">
            </div>
            <button type="submit" class="btn btn-primary">Consultar</button>
        </form>
        
        <form class="form-cadastro-participante">
            <div class="form-group">
                <label for="name">Nome</label>
                <input type="text" class="form-control" id="name" name="name" maxlength="25" />
            </div>
           <!--  <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email" />
            </div>
            <div class="form-group">
                <label for="telefone">Telefone</label>
                <input type="text" class="form-control" id="telefone" name="telefone" />
            </div>
            <div class="form-group">
                <label for="cargo">Cargo</label>
                <input type="text" class="form-control" id="cargo" name="cargo" maxlength="25" />
            </div>
            <div class="form-group">
                <label for="tipo_documento">Tipo documento</label>
                <select class="form-control" id="tipo_documento" name="tipo_documento"></select>
            </div>
            <div class="form-group">
                <label for="num_doc">Nº documento</label>
                <input type="text" class="form-control" id="num_doc" name="num_doc" />
            </div> -->
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
        
    </div>
</div>

<?php include_once(dirname(__FILE__) . "/footer.php"); ?>

<script>
    $(document).ready(function(){
        $(".form-search-email").submit(function(ev){
            ev.preventDefault();
            
            $.post(site + "api/participantes/check_email",
            {email: $("[name=email]").val(), token: $("[name=token]").val()},
            function (data) {
                if (data.status == "ok" && data.participante == null) {
                    $(".form-search-email").toggleClass("hide");
                    $(".form-cadastro-participante").toggleClass("hide");
                    $(".form-cadastro-participante [name=email]").val($(".form-search-email [name=email]").val());
                } else if (data.status == "ok" && data.participante != null) {
                    $(".form-search-email").hide();
                    location.href = site + "admin/participantes/fotos/" + data.participante.participante_id;
                }
            }, 'json');
        });
        
        $(".form-cadastro-participante").submit(function (ev) {
            ev.preventDefault();
            $('button[type=submit]').html('<span class="fa fa-refresh fa-spin fa-1x"></span>').attr("disabled", "disabled");
            var getData = {};
            getData.nome = $(".form-cadastro-participante [name=name]").val();
            //getData.email = $(".form-cadastro-participante [name=email]").val();
            //getData.telefone = $(".form-cadastro-participante [name=telefone]").val();
            //getData.cargo = $(".form-cadastro-participante [name=cargo]").val();
            getData.tipo_documento_id = $(".form-cadastro-participante [name=tipo_documento]").val();
            getData.tipo_documento_id = 1;
            //getData.num_doc = $(".form-cadastro-participante [name=num_doc]").val();
            
            $.post(site + "api/participantes/cadastro", 
            {form: getData, token: $("[name=token]").val()},
            function (data) {
                if (data.status == "ok") {
                    location.href = site + "admin/participantes/fotos/" + data.participante_id
                }
            });
        });
        
        $.post(site + "api/participantes/tipodocumento", 
        {token: $("[name=token]").val()},
        function (data) {
            if (data.status == "ok") {
                $("[name=tipo_documento]").append("<option value=''>Escolha</option>");
                for (tipo in data.tipos_documentos) {
                    $("[name=tipo_documento]").append("<option value='"+data.tipos_documentos[tipo].tipo_documento_id+"'>"+data.tipos_documentos[tipo].tipo+"</option>");
                }
            }
        }, 'json');
    });
</script>
