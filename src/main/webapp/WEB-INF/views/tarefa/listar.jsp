<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gerenciador de Tarefas</title>
</head>
<body>

    <div class="wrapper">
        <%@ include file="/WEB-INF/views/fragments/header.jsp" %>
        <%@ include file="/WEB-INF/views/fragments/menu.jsp" %>

        <div class="page-wrapper">
            <div class="page-content">
                
                <div class="card radius-10">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <div>
                                <h5 class="mb-0">Minhas Tarefas</h5>
                            </div>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table align-middle mb-0 table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Título</th>
                                        <th>Descrição</th>
                                        <th>Responsável</th>
                                        <th>Serviço</th>
                                        <th>Prioridade</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- O c:forEach vai repetir essa linha para cada tarefa do banco --%>
                                    <c:forEach var="tarefa" items="${tarefas}">
                                        <tr>
                                            <td>#${tarefa.id}</td>
                                            <td><strong>${tarefa.titulo}</strong></td>
                                            <td>${tarefa.desc}</td>
                                            <td>${tarefa.responsavel}</td>
                                            <td>${tarefa.tipoServico}</td>
                                            <td>
                                                <span class="badge bg-gradient-deepblue text-white shadow-sm w-100">
                                                    ${tarefa.prioridade}
                                                </span>
                                            </td>
                                            <td>
                                                <span class="badge bg-light-success text-success w-100">
                                                    ${tarefa.status}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    
                                    <c:if test="${empty tarefas}">
                                        <tr>
                                            <td colspan="7" class="text-center text-muted">
                                                Nenhuma tarefa cadastrada ainda.
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
    </div>

</body>
</html>