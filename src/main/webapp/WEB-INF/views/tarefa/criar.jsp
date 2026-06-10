<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>Task Manager - Dashboard</title>
	</head>
	<body>
		<div class="container">
			<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
			
	        <div class="area-body">
				<jsp:include page="/WEB-INF/views/fragments/menu.jsp"/>
	            <div class="body-app">
	                <div class="content-menu-app">
	                  <nav class="module-menu">
	                    <ul>
	                      <li><a href="${pageContext.request.contextPath}/tarefa/listar">Tarefas</a></li>
	                      <li><a href="${pageContext.request.contextPath}/tarefa/criar">Nova Tarefa</a></li>
	                    </ul>
	                  </nav>
	                </div>
	                <div class="content-modulo-app">
	                   <label>Nome:</label>
	                   <input type="text" placeholder="nome da tarefa aqui."/>
	                    <label>Descrição:</label>
	                   <input type="text" placeholder="nome da tarefa aqui."/>
	                </div>
	            </div>
	        </div>
	        <div>
	            <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
	        </div>
	    </div>
	</body>
</html>