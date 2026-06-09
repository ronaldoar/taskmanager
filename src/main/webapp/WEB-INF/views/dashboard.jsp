<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="pt-br">
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
	                      <li><a href="#visao-geral">Visão Geral</a></li>
	                      <li><a href="#detalhes">Detalhes</a></li>
	                      <li><a href="#historico">Histórico</a></li>
	                      <li><a href="#config">Configurações</a></li>
	                    </ul>
	                  </nav>
	                </div>
	                <div class="content-modulo-app">
	                    <div class="teste">
	                        TESTE -SCROLL
	                    </div>
	                    <div class="teste">
	                        TESTE -SCROLL
	                    </div>
	                    <div class="teste">
	                        TESTE -SCROLL
	                    </div>
	                    <div class="teste">
	                        TESTE -SCROLL
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div>
	            <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
	        </div>
	    </div>
	</body>
</html>
