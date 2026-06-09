<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>Task Manager - Dashboard</title>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
   		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
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
	                    lista de tarefas aqui.
	                </div>
	            </div>
	        </div>
	        <div>
	            <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
	        </div>
	    </div>
	</body>
</html>