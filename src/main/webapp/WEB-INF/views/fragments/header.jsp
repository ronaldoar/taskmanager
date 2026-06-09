<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${empty sessionScope.usuarioLogado}">
    <c:redirect url="/login.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
   		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	</head>
	<body>
	   <div class="header">
          <div class="logo">
            <img alt="logotipo" src="${pageContext.request.contextPath}/img/logo.png" height="80" width="80">    
          </div>
          <nav class="top-menu">
            <ul>
              <li><a href="#inicio">Login:</a></li>
              <li><a href="#sobre">${sessionScope.usuarioLogado}</a></li>
              <li><a href="${pageContext.request.contextPath}/logout">Sair</a></li>
            </ul>
          </nav>
        </div>
	</body>
	<script src="${pageContext.request.contextPath}/js/lib/jquery-4.0.0.slim.min.js"></script>
</html>