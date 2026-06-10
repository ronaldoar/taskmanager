<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${ctx}/resources/css/normalize.css">
<link rel="stylesheet" href="${ctx}/resources/css/main.css">

<!-- 3. Imports de JS (Vão no final do <body>, mas definimos as variáveis aqui) -->
<c:set var="jsBootstrap" value="${ctx}/resources/js/lib/jquery-4.0.0.slim.min.js" />
<c:set var="jsMain" value="${ctx}/resources/js/main.js" />

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${ctx}/resources/css/sb-admin-2.min.css" rel="stylesheet">


