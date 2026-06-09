<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
	    <meta charset="UTF-8">
	    <title>Task Manager - Login</title>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
	</head>
	<body>
		<div class="login-container">
		    <h2>Task Manager</h2>
		
		    <c:if test="${not empty errorMessage}">
		        <div class="error-message">
		            ${errorMessage}
		        </div>
		    </c:if>
		
		    <form action="${pageContext.request.contextPath}/login" method="POST">
		        <div class="form-group">
		            <label for="username">Usuário</label>
		            <input type="text" id="username" class="cp-obrigatorio" name="username" required autocomplete="off">
		        </div>
		        <div class="form-group">
		            <label for="password">Senha</label>
		            <input type="password" id="password" class="cp-obrigatorio" name="password" required>
		        </div>
		        <button id="btnEnviar" type="submit">Entrar</button>
		    </form>
		</div>
	</body>
	<script src="${pageContext.request.contextPath}/resources/js/lib/jquery-4.0.0.slim.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</html>
