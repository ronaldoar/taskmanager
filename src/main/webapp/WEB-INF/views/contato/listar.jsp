<%@page import="java.util.List"%>
<%@page import="br.com.rar.taskmanager.model.Contato"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>

<div class="wrapper">

    <%@ include file="/WEB-INF/views/fragments/header.jsp" %>
    <%@ include file="/WEB-INF/views/fragments/menu.jsp" %>

    <div class="page-wrapper">
        <div class="page-content">

            <div class="card">

    <div class="card-body">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <h4 class="mb-0">
                <i class="bx bx-user"></i>
                Contatos
            </h4>

            <a href="${pageContext.request.contextPath}/contato/cadastrar"
               class="btn btn-success">
                <i class="bx bx-plus"></i>
                Novo Contato
            </a>

        </div>

        <div class="row mb-3">

            <div class="col-md-6">

                <input
                    type="text"
                    id="pesquisa"
                    class="form-control"
                    placeholder="Pesquisar contato...">

            </div>

            <div class="col-md-6 text-end">

                <button
                    type="button"
                    class="btn btn-primary"
                    id="btn-editar"
                    disabled>

                    <i class="bx bx-edit"></i>
                    Editar

                </button>

                <button
                    type="button"
                    class="btn btn-danger"
                    id="btn-excluir"
                    disabled>

                    <i class="bx bx-trash"></i>
                    Excluir (<span id="contador-selecionados">0</span>)

                </button>

            </div>

        </div>

            <%
                List<Contato> contatos = (List<Contato>) request.getAttribute("contatos");
            %>

						<form id="formExcluir"
			      action="${pageContext.request.contextPath}/contato/excluir"
			      method="post">
			
			<table class="table table-striped table-bordered" id="tabelaContatos">
						

                <thead>
                    <tr>
                        <th class="text-center">
                            <input type="checkbox"
                                   id="checkbox-marcar-todos"
                                   class="form-check-input">
                        </th>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>E-mail</th>
                        <th>Celular</th>
                        <th>Endereço</th>
                        <th>Comentário</th>
                        <th>Ativa</th>
						
                    </tr>
                </thead>

                <tbody>

                <%
                    if(contatos != null){
                        for(Contato contato : contatos){
                %>

                    <tr>

                        <td class="text-center">
                            <input
							    type="checkbox"
							    class="checkbox-contato form-check-input"
							    name="ids"
							    value="<%= contato.getId() %>">
                        </td>

                        <td><%= contato.getId() %></td>
                        <td><%= contato.getNome() %></td>
                        <td><%= contato.getSobrenome() %></td>
                        <td><%= contato.getEmail() %></td>
                        <td><%= contato.getCelular() %></td>
                        <td><%= contato.getEndereco() %></td>
                        <td><%= contato.getComentario() %></td>
                        <td><%= contato.isAtiva() ? "Sim" : "Não" %></td>

                    </tr>

                <%
                        }
                    }
                %>

                </tbody>

            </table>


</form>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</div>


<script>
const botaoEditar = document.getElementById("btn-editar");
const marcarTodos = document.getElementById("checkbox-marcar-todos");
const checkboxes = document.querySelectorAll(".checkbox-contato");
const botaoExcluir = document.getElementById("btn-excluir");
const contador = document.getElementById("contador-selecionados");

function atualizarContador() {

    let selecionados = document.querySelectorAll(".checkbox-contato:checked");

    contador.innerText = selecionados.length;

    botaoExcluir.disabled = (selecionados.length === 0);

    botaoEditar.disabled = (selecionados.length !== 1);

}

marcarTodos.addEventListener("change", function(){

    checkboxes.forEach(function(checkbox){

        checkbox.checked = marcarTodos.checked;

    });

    atualizarContador();

});

checkboxes.forEach(function(checkbox){

    checkbox.addEventListener("change", function(){

        atualizarContador();

        marcarTodos.checked =
            document.querySelectorAll(".checkbox-contato:checked").length === checkboxes.length;

    });

});

//Pesquisa em tempo real
document.getElementById("pesquisa").addEventListener("keyup", function () {

    let texto = this.value.toLowerCase();

    let linhas = document.querySelectorAll("#tabelaContatos tbody tr");

    linhas.forEach(function(linha){

        let conteudo = linha.textContent.toLowerCase();

        if(conteudo.includes(texto)){

            linha.style.display = "";

        }else{

            linha.style.display = "none";

        }

    });

});

botaoEditar.addEventListener("click", function () {

    const selecionado = document.querySelector(".checkbox-contato:checked");

    if (selecionado) {

        window.location.href =
            "${pageContext.request.contextPath}/contato/editar?id=" + selecionado.value;

    }

});

botaoExcluir.addEventListener("click", function () {

    let selecionados = document.querySelectorAll(".checkbox-contato:checked");

    if (selecionados.length === 0) {

        alert("Selecione pelo menos um contato.");

        return;

    }

    if (confirm("Deseja realmente excluir os contatos selecionados?")) {

        document.getElementById("formExcluir").submit();

    }

});

</script>

</body>
</html>