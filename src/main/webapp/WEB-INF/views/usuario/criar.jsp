<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<div class="wrapper">
			<%@ include file="/WEB-INF/views/fragments/header.jsp" %>
			<%@ include file="/WEB-INF/views/fragments/menu.jsp" %>
		    <div class="page-wrapper">
				<div class="page-content">
					<div class="col-xl-6 mx-auto">
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
										<label for="inputEnterYourName" class="col-sm-3 col-form-label">Username</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="inputEnterYourName" placeholder="Enter Your Name">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputEnterYourName" class="col-sm-3 col-form-label">Nome Completo</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="inputEnterYourName" placeholder="Enter Your Name">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputPhoneNo2" class="col-sm-3 col-form-label">Celular</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" id="inputPhoneNo2" placeholder="Phone No">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputEmailAddress2" class="col-sm-3 col-form-label">Email</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" id="inputEmailAddress2" placeholder="Email Address">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputChoosePassword2" class="col-sm-3 col-form-label">Senhar</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" id="inputChoosePassword2" placeholder="Choose Password">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputConfirmPassword2" class="col-sm-3 col-form-label">Confirmar Senha</label>
										<div class="col-sm-9">
											<input type="email" class="form-control" id="inputConfirmPassword2" placeholder="Confirm Password">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputAddress4" class="col-sm-3 col-form-label"></label>
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
											<button type="submit" class="btn btn-info px-5">Cadastrar</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>				
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
		</div>
	</body>
</html>