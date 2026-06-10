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
												<input type="text" class="form-control" name="username" id="inputEnterYourName" placeholder="Informe seu username">
											</div>
										</div>
										<div class="row mb-3">
											<label for="nome" class="col-sm-3 col-form-label">Nome Completo</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="nome" placeholder="Enter Your Name">
											</div>
										</div>
										<div class="row mb-3">
											<label for="celular" class="col-sm-3 col-form-label">Celular</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="celular" placeholder="Phone No">
											</div>
										</div>
										<div class="row mb-3">
											<label for="email" class="col-sm-3 col-form-label">Email</label>
											<div class="col-sm-9">
												<input type="email" class="form-control" id="email" placeholder="Email Address">
											</div>
										</div>
										<div class="row mb-3">
											<label for="senha" class="col-sm-3 col-form-label">Senhar</label>
											<div class="col-sm-9">
												<input type="email" class="form-control" id="senha" placeholder="Choose Password">
											</div>
										</div>
										<div class="row mb-3">
											<label for="inputConfirmPassword2" class="col-sm-3 col-form-label">Confirmar Senha</label>
											<div class="col-sm-9">
												<input type="email" class="form-control" id="confSenha" placeholder="Confirm Password">
											</div>
										</div>
										<div class="row mb-3">
											<label class="col-sm-3 col-form-label"></label>
											<div class="col-sm-9">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" id="gridCheck4">
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
		<script>
		
		$(document).ready(function(){
			const $campos = $('.form-control'); 
		    const $botao  = $('#btnCadastrar');

		    // Executa a validação sempre que o usuário digitar ou mudar o valor
		    $campos.on('input change', () => verificarCampos($campos, $botao));
		    
		    // Executa uma vez ao carregar a página caso já existam dados salvos
		    verificarCampos($campos, $botao);
		});
		
		function verificarCampos(campos, botao) {
		    const todosPreenchidos = campos.toArray().every(el => $(el).val().trim() !== '');
		    botao.prop('disabled', !todosPreenchidos);
		}
		
	</script>
	</body>
</html>