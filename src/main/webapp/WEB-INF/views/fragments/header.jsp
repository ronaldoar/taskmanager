<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${empty sessionScope.usuarioLogado}">
    <c:redirect url="/login.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<%@ include file="imports.jsp" %>
	</head>
	<body>
	   <div class="header">
          <div class="logo">
            <img alt="logotipo" src="${pageContext.request.contextPath}/resources/img/logo.png" height="80" width="80">    
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
</html>