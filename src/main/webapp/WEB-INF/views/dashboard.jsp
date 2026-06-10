<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
	    <meta charset="UTF-8">
	    <title>Task Manager - Dashboard</title>
	</head>
	<body>
		<div class="wrapper">
			<%@ include file="/WEB-INF/views/fragments/header.jsp" %>
			<%@ include file="/WEB-INF/views/fragments/menu.jsp" %>
		    <div class="page-wrapper">
				<div class="page-content">
					DASHBOARD
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
		</div>
	</body>
</html>
