<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<body>

	<c:if test="${not empty erro}">
	    <div class="alert alert-danger">
	        ${erro}
	    </div>
	</c:if>

	<c:if test="${not empty mensagem}">
	    <div class="alert alert-success">
	        ${mensagem}
	    </div>
	</c:if>


	<div class="wrapper">

		<%@ include file="/WEB-INF/views/fragments/header.jsp" %>

		<%@ include file="/WEB-INF/views/fragments/menu.jsp" %>


	    <div class="page-wrapper">

			<div class="page-content">

				<div class="col-xl-7 mx-auto">

					<div class="card border-top border-0 border-4 border-danger">

						<div class="card-body p-5">


							<div class="card-title d-flex align-items-center">

								<div>
									<i class="bx bxs-user me-1 font-22 text-danger"></i>
								</div>

								<h5 class="mb-0 text-danger">
									Registrar Contato
								</h5>

							</div>


							<hr>


							<form class="row g-3" 
							      action="${pageContext.request.contextPath}/contato/cadastrar" 
							      method="post">


								<div class="col-md-6">

									<label class="form-label">
										Nome
									</label>

									<div class="input-group">

										<span class="input-group-text bg-transparent">
											<i class='bx bxs-user'></i>
										</span>

										<input type="text"
											   class="form-control border-start-0"
											   name="nome"
											   placeholder="primeiro nome"
											   required />

									</div>

								</div>



								<div class="col-md-6">

									<label class="form-label">
										Sobrenome
									</label>

									<div class="input-group">

										<span class="input-group-text bg-transparent">
											<i class='bx bxs-user'></i>
										</span>

										<input type="text"
											   class="form-control border-start-0"
											   name="sobrenome"
											   placeholder="sobrenome"
											   required />

									</div>

								</div>



								<div class="col-12">

									<label class="form-label">
										Celular
									</label>

									<div class="input-group">

										<span class="input-group-text bg-transparent">
											<i class='bx bxs-microphone'></i>
										</span>

										<input type="text"
											   class="form-control border-start-0"
											   name="celular"
											   placeholder="telefone"
											   required />

									</div>

								</div>



								<div class="col-12" style="position: relative;">

									<label class="form-label">
										Endereço
									</label>

									<div class="input-group">

										<span class="input-group-text bg-transparent">
											<i class='bx bxs-map'></i>
										</span>

										<input type="text"
											   class="form-control border-start-0"
											   id="inputEndereco"
											   name="endereco"
											   placeholder="digite o endereço"
											   autocomplete="off" />

									</div>


									<div id="sugestoesEndereco"
									     class="list-group"
									     style="position:absolute; z-index:1000; width:100%;">
									</div>

								</div>



								<div class="col-12">

									<label class="form-label">
										Email
									</label>

									<div class="input-group">

										<span class="input-group-text bg-transparent">
											<i class='bx bxs-message'></i>
										</span>

										<input type="email"
											   class="form-control border-start-0"
											   name="email"
											   placeholder="endereço de email"
											   required />

									</div>

								</div>



								<div class="col-12">

									<label class="form-label">
										Comentário
									</label>

									<textarea class="form-control"
											  name="comentario"
											  placeholder="inserir comentario"
											  rows="3"></textarea>

								</div>



								<div class="col-12">

									<button type="submit" class="btn btn-danger px-5">
										Cadastrar
									</button>

								</div>


							</form>


						</div>

					</div>

				</div>


			</div>

		</div>


		<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>


	</div>



<script>

document.addEventListener('DOMContentLoaded', function () {

    const input = document.getElementById('inputEndereco');
    const sugestoesDiv = document.getElementById('sugestoesEndereco');

    let timeoutId;


    input.addEventListener('input', function () {

        const query = this.value;

        clearTimeout(timeoutId);

        sugestoesDiv.innerHTML = '';


        if (query.length < 3) {
            return;
        }


        timeoutId = setTimeout(() => {


            const url = 'https://nominatim.openstreetmap.org/search?format=json&addressdetails=1&limit=5&q=' 
                        + encodeURIComponent(query);



            fetch(url)

                .then(res => res.json())

                .then(data => {


                    sugestoesDiv.innerHTML = '';


                    data.forEach(local => {


                        const item = document.createElement('button');


                        item.type = 'button';

                        item.className = 'list-group-item list-group-item-action';

                        item.textContent = local.display_name;



                        item.addEventListener('click', () => {

                            input.value = local.display_name;

                            sugestoesDiv.innerHTML = '';

                        });



                        sugestoesDiv.appendChild(item);


                    });


                });


        }, 400);


    });



    document.addEventListener('click', function (e) {

        if (e.target !== input) {

            sugestoesDiv.innerHTML = '';

        }

    });


});

</script>


</body>

</html>