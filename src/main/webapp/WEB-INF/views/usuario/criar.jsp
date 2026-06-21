<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>T. M. Cadastrar Usuário</title>

    <style>
        .erro-senha {
            color: red;
            font-size: 14px;
            display: none;
        }

        .input-erro {
            border: 1px solid red !important;
        }
    </style>
</head>

<body>

<div class="wrapper">

    <%@ include file="/WEB-INF/views/fragments/header.jsp" %>
    <%@ include file="/WEB-INF/views/fragments/menu.jsp" %>

    <div class="page-wrapper">

        <div class="page-content">

            <div class="col-xl-6 mx-auto">

                <span>${msg}</span>

                <form action="${pageContext.request.contextPath}/usuario/criar" method="POST">

                    <div class="card border-top border-0 border-4 border-info">

                        <div class="card-body">

                            <div class="border p-4 rounded">

                                <div class="card-title d-flex align-items-center">
                                    <div>
                                        <i class="bx bxs-user me-1 font-22 text-info"></i>
                                    </div>
                                    <h5 class="mb-0 text-info">Registrar Usuário</h5>
                                </div>

                                <hr/>

                                <!-- Username -->
                                <div class="row mb-3">
                                    <label class="col-sm-3 col-form-label">Username</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control obgr" name="username" id="username" placeholder="Informe seu apelido">
                                    </div>
                                </div>

                                <!-- Nome Completo -->
                                <div class="row mb-3">
                                    <label class="col-sm-3 col-form-label">Nome Completo</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control obgr" name="nomeCompl" id="nome" placeholder="informe seu nome completo">
                                    </div>
                                </div>

                                <!-- Celular -->
                                <div class="row mb-3">
                                    <label class="col-sm-3 col-form-label">Celular</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control obgr" name="celular" id="celular" placeholder="seu numero">
                                    </div>
                                </div>

                                <!-- Email (CORRIGIDO AQUI) -->
                                <div class="row mb-3">
                                    <label class="col-sm-3 col-form-label">Email</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control obgr" name="email" id="email" placeholder="endereço de email">
                                    </div>
                                </div>

                                <!-- Senha -->
                                <div class="row mb-3">
                                    <label class="col-sm-3 col-form-label">Senha</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control obgr" name="senha" id="senha" placeholder="informe sua senha">
                                    </div>
                                </div>

                                <!-- Confirmar Senha -->
                                <div class="row mb-3">
                                    <label class="col-sm-3 col-form-label">Confirmar Senha</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control obgr" name="confSenha" id="confSenha" placeholder="confirme sua senha">
                                        <span id="msgSenha" class="erro-senha">Senhas não conferem</span>
                                    </div>
                                </div>

                                <!-- Checkbox Ativo -->
                                <div class="row mb-3">
                                    <label class="col-sm-3 col-form-label"></label>
                                    <div class="col-sm-9">
                                        <div class="form-check">
                                            <input class="form-check-input" name="ativo" type="checkbox" id="gridCheck4">
                                            <label class="form-check-label">Ativo</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Botão Cadastrar -->
                                <div class="row">
                                    <label class="col-sm-3 col-form-label"></label>
                                    <div class="col-sm-9">
                                        <button id="btnCadastrar" type="submit" class="btn btn-info px-5" disabled>Cadastrar</button>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                </form>

            </div>

        </div>

    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</div>

<script>
$(document).ready(function(){

    const $campos = $('.obgr');
    const $botao = $('#btnCadastrar');

    function verificarCampos(){
        let todosPreenchidos = true;

        $campos.each(function(){
            if($(this).val().trim() === ''){
                todosPreenchidos = false;
                return false; // quebra o loop .each
            }
        });

        $botao.prop('disabled', !todosPreenchidos);
    }

    // Executa a verificação inicial e vincula ao evento de input
    verificarCampos();
    $campos.on('input', verificarCampos);

    // Evento de submit (Movido para dentro do ready por segurança)
    $('form').on('submit', function(event){
        let senha = $('#senha').val();
        let confSenha = $('#confSenha').val();

        if(senha !== confSenha){
            event.preventDefault(); // Impede o envio do formulário
            $('#msgSenha').show();
            $('#confSenha').addClass('input-erro');
        } else {
            $('#msgSenha').hide();
            $('#confSenha').removeClass('input-erro');
        }
    });

});
</script>

</body>
</html>