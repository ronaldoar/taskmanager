<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<body>
		<div class="wrapper">
			<%@ include file="/WEB-INF/views/fragments/header.jsp" %>
			<%@ include file="/WEB-INF/views/fragments/menu.jsp" %>
		    <div class="page-wrapper">
				<div class="page-content">
					<div class="col-xl-7 mx-auto">
						<div class="card border-top border-0 border-4 border-danger">
							<div class="card-body p-5">
								<div class="card-title d-flex align-items-center">
									<div><i class="bx bxs-user me-1 font-22 text-danger"></i>
									</div>
									<h5 class="mb-0 text-danger">Registrar Contato</h5>
								</div>
								<hr>
								<form class="row g-3">
									<div class="col-md-6">
										<label for="inputLastName1" class="form-label">Nome</label>
										<div class="input-group"> <span class="input-group-text bg-transparent"><i class='bx bxs-user'></i></span>
											<input type="text" class="form-control border-start-0" id="inputLastName1" placeholder="First Name" />
										</div>
									</div>
									<div class="col-md-6">
										<label for="inputLastName2" class="form-label">Sobrenome</label>
										<div class="input-group"> <span class="input-group-text bg-transparent"><i class='bx bxs-user'></i></span>
											<input type="text" class="form-control border-start-0" id="inputLastName2" placeholder="Last Name" />
										</div>
									</div>
									<div class="col-12">
										<label for="inputPhoneNo" class="form-label">Celular</label>
										<div class="input-group"> <span class="input-group-text bg-transparent"><i class='bx bxs-microphone' ></i></span>
											<input type="text" class="form-control border-start-0" id="inputPhoneNo" placeholder="Phone No" />
										</div>
									</div>
									<div class="col-12">
										<label for="inputEmailAddress" class="form-label">Email</label>
										<div class="input-group"> <span class="input-group-text bg-transparent"><i class='bx bxs-message' ></i></span>
											<input type="text" class="form-control border-start-0" id="inputEmailAddress" placeholder="Email Address" />
										</div>
									</div>
									<div class="col-12">
										<label for="inputAddress3" class="form-label">Address</label>
										<textarea class="form-control" id="inputAddress3" placeholder="Enter Address" rows="3"></textarea>
									</div>
									<div class="col-12">
										<button type="submit" class="btn btn-danger px-5">Cadastrar</button>
									</div>
								</form>
							</div>
						</div>
					</div>				
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
		</div>
	</body>
</html>