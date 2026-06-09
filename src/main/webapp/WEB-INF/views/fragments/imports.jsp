<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${ctx}/resources/css/normalize.css">
<link rel="stylesheet" href="${ctx}/resources/css/main.css">

<!-- 3. Imports de JS (Vão no final do <body>, mas definimos as variáveis aqui) -->
<c:set var="jsBootstrap" value="${ctx}/resources/js/lib/jquery-4.0.0.slim.min.js" />
<c:set var="jsMain" value="${ctx}/resources/js/main.js" />


