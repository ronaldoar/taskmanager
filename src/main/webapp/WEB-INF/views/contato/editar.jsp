<%@page import="br.com.rar.taskmanager.model.Contato"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Contato contato = (Contato) request.getAttribute("contato");
%>

<!DOCTYPE html>
<html>
<body>

<div class="wrapper">

    <%@ include file="/WEB-INF/views/fragments/header.jsp" %>
    <%@ include file="/WEB-INF/views/fragments/menu.jsp" %>

    <div class="page-wrapper">
        <div class="page-content">

            <div class="col-xl-7 mx-auto">

                <div class="card border-top border-0 border-4 border-primary">

                    <div class="card-body p-5">

                        <div class="card-title d-flex align-items-center">
                            <div>
                                <i class="bx bxs-user me-1 font-22 text-primary"></i>
                            </div>

                            <h5 class="mb-0 text-primary">
                                editar Contato
                            </h5>

                        </div>

                        <hr>

                        <%
                            String mensagem = (String) request.getAttribute("mensagem");

                            if(mensagem != null){
                        %>

                            <div class="alert alert-success">
                                <%= mensagem %>
                            </div>

                        <%
                            }
                        %>

                        <form class="row g-3"
                              action="${pageContext.request.contextPath}/contato/editar"
                              method="post">

                            <input type="hidden"
                                   name="id"
                                   value="<%= contato.getId() %>">

                            <div class="col-md-6">

                                <label class="form-label">Nome</label>

                                <div class="input-group">

                                    <span class="input-group-text bg-transparent">
                                        <i class="bx bxs-user"></i>
                                    </span>

                                    <input
                                        type="text"
                                        class="form-control border-start-0"
                                        id="inputNome"
                                        name="nome"
                                        value="<%= contato.getNome() %>"
                                        placeholder="Primeiro nome">

                                </div>

                            </div>

                            <div class="col-md-6">

                                <label class="form-label">Sobrenome</label>

                                <div class="input-group">

                                    <span class="input-group-text bg-transparent">
                                        <i class="bx bxs-user"></i>
                                    </span>

                                    <input
                                        type="text"
                                        class="form-control border-start-0"
                                        id="inputSobrenome"
                                        name="sobrenome"
                                        value="<%= contato.getSobrenome() %>"
                                        placeholder="Sobrenome">

                                </div>

                            </div>

                            <div class="col-12">

                                <label class="form-label">Celular</label>

                                <div class="input-group">

                                    <span class="input-group-text bg-transparent">
                                        <i class="bx bxs-phone"></i>
                                    </span>

                                    <input
                                        type="text"
                                        class="form-control border-start-0"
                                        id="inputCelular"
                                        name="celular"
                                        value="<%= contato.getCelular() %>"
                                        placeholder="Telefone">

                                </div>

                            </div>

                            <div class="col-12" style="position: relative;">

                                <label class="form-label">
                                    Endereço
                                </label>

                                <div class="input-group">

                                    <span class="input-group-text bg-transparent">
                                        <i class="bx bxs-map"></i>
                                    </span>

                                    <input
                                        type="text"
                                        class="form-control border-start-0"
                                        id="inputEndereco"
                                        name="endereco"
                                        value="<%= contato.getEndereco() %>"
                                        placeholder="Digite o endereço"
                                        autocomplete="off">

                                </div>

                                <div id="sugestoesEndereco"
                                     class="list-group"
                                     style="position:absolute;z-index:1000;width:100%;">
                                </div>

                            </div>

                            <div class="col-12">

                                <label class="form-label">
                                    Email
                                </label>

                                <div class="input-group">

                                    <span class="input-group-text bg-transparent">
                                        <i class="bx bxs-message"></i>
                                    </span>

                                    <input
                                        type="email"
                                        class="form-control border-start-0"
                                        id="inputEmail"
                                        name="email"
                                        value="<%= contato.getEmail() %>"
                                        placeholder="Endereço de email">

                                </div>

                            </div>

                            <div class="col-12">

                                <label class="form-label">
                                    Comentário
                                </label>

                                <textarea
                                    class="form-control"
                                    id="inputComentario"
                                    name="comentario"
                                    rows="3"
                                    placeholder="Inserir comentário"><%= contato.getComentario() %></textarea>

                            </div>

                            <div class="col-12">

                                <button
                                    type="submit"
                                    class="btn btn-primary px-5">

                                    Salvar Alterações

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

        if(query.length < 3){
            return;
        }

        timeoutId = setTimeout(() => {

            fetch('https://nominatim.openstreetmap.org/search?format=json&addressdetails=1&limit=5&q=' + encodeURIComponent(query))

                .then(response => response.json())

                .then(data => {

                    sugestoesDiv.innerHTML = '';

                    data.forEach(local => {

                        const item = document.createElement('button');

                        item.type = 'button';

                        item.className = 'list-group-item list-group-item-action';

                        item.textContent = local.display_name;

                        item.onclick = function(){

                            input.value = local.display_name;

                            sugestoesDiv.innerHTML = '';

                        };

                        sugestoesDiv.appendChild(item);

                    });

                });

        },400);

    });

    document.addEventListener('click', function(e){

        if(e.target !== input){

            sugestoesDiv.innerHTML = '';

        }

    });

});

</script>

</body>
</html>