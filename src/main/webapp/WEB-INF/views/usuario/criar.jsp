<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
	    <meta charset="UTF-8">
	    <title>T. M. Cadastrar Usuário</title>
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
											<div><i class="bx bxs-user me-1 font-22 text-info"></i>
											</div>
											<h5 class="mb-0 text-info">Registrar Usuário</h5>
										</div>
										<hr/>
										<div class="row mb-3">
											<label for="username" class="col-sm-3 col-form-label">Username</label>
											<div class="col-sm-9">
												<input type="text" class="form-control obrg" name="username" id="inputEnterYourName" placeholder="Informe seu apelido">
											</div>
										</div>
										<div class="row mb-3">
											<label for="nome" class="col-sm-3 col-form-label">Nome Completo</label>
											<div class="col-sm-9">
												<input type="text" class="form-control obgr" name="nomeCompl" id="nome" placeholder="informe seu nome completo">
											</div>
										</div>
										<div class="row mb-3">
											<label for="celular" class="col-sm-3 col-form-label">Celular</label>
											<div class="col-sm-9">
												<input type="text" class="form-control obgr" name="celular" id="celular" placeholder="seu numero">
											</div>
										</div>
										<div class="row mb-3">
											<label for="email" class="col-sm-3 col-form-label">Email</label>
											<div class="col-sm-9">
												<input type="email" class="form-control obgr" name="email" id="email" placeholder="endereço de email">
											</div>
										</div>
										<div class="row mb-3">
											<label for="senha" class="col-sm-3 col-form-label">Senha</label>
											<div class="col-sm-9">
												<input type="password" class="form-control obgr" name="senha" id="senha" placeholder="informe sua senha">
											</div>
										</div>
										<div class="row mb-3">
											<label for="inputConfirmPassword2" class="col-sm-3 col-form-label">Confirmar Senha</label>
											<div class="col-sm-9">
												<input type="password" class="form-control obgr"  name="confSenha" id="confSenha" placeholder="confirme sua senha">
											</div>
										</div>
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label"></label>
											<div class="col-sm-9">
												<div class="form-check">
													<input class="form-check-input" name="ativo" type="checkbox" id="gridCheck4">
													<label class="form-check-label" for="gridCheck4">Ativo</label>
												</div>
											</div>
										</div>
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
	</body>
	<script>
		
		
		$(document).ready(function() {
		    // 1. Seleciona todos os inputs obrigatórios e o botão
			const $campos 		 = $('.obgr');
			const $botao  		 = $('#btnCadastrar');

		    // 2. Função que verifica se todos os campos estão preenchidos
		    function verificarCampos() {
		        let todosPreenchidos = true;

		        $campos.each(function() {
		            // .trim() remove espaços em branco no início e no fim
		            if ($(this).val().trim() === '') {
		                todosPreenchidos = false;
		                return false; // Interrompe o loop .each() assim que encontrar um vazio
		            }
		        });

		        // 3. Habilita ou desabilita o botão com base na verificação
		        if (todosPreenchidos) {
		            $botao.prop('disabled', false); // Habilita
		        } else {
		            $botao.prop('disabled', true);  // Desabilita
		        }
		    }

		    // 4. Executa a verificação inicialmente (por segurança)
		    verificarCampos();
			validarSenha();
		    // 5. Dispara a verificação a cada vez que o usuário digita algo nos campos
		    $campos.on('input', verificarCampos);
		});
		
		function validarSenha(){
			var senha = $('#senha').val();
			var confsenha = $('#confSenha').val();
			if(senha !== confSenha){
				alert('senhas diferentes')
			}
		}
		
	</script>
</html>