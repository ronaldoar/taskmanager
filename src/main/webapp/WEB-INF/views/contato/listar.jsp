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

            <h3>Lista de Contatos</h3>

            <%
                List<Contato> contatos = (List<Contato>) request.getAttribute("contatos");
            %>

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
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

        </div>
    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</div>

</body>
</html>