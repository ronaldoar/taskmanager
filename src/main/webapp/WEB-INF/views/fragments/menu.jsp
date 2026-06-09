<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	   <div class="menu-app">
           <nav class="nav-menu">
             <ul>
               <li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
               <li><a href="#dashboard">Planejamento</a></li>
               <li><a href="#usuarios">Equipes</a></li>
               <li><a href="${pageContext.request.contextPath}/tarefa/listar">Tarefas</a></li>
               <li><a href="#relatorios">Relatórios</a></li>
               <li><a href="#configuracoes">Configurações</a></li>
             </ul>
           </nav>
	   </div>
	</body>
</html>