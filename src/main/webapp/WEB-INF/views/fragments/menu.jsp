<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="pt-br">
  	<div class="sidebar-wrapper" data-simplebar="true">
		<div class="sidebar-header">
			<div>
				<img src="${ctx}/resources/img/logo-icon.png" class="logo-icon" alt="logo icon">
			</div>
			<div>
				<h4 class="logo-text">Task Manager</h4>
			</div>
		</div>
		<!--navigation-->
		<ul class="metismenu" id="menu">
			<li>
				<a href="javascript:;" class="has-arrow">
					<div class="parent-icon"><i class='bx bx-home-circle'></i></div>
					<div class="menu-title">Dashboard</div>
				</a>
				<ul>
					<li> <a href="index.html"><i class="bx bx-right-arrow-alt"></i>Kanban</a>
					</li>
					<li> <a href="index2.html"><i class="bx bx-right-arrow-alt"></i>Planejamentos</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="has-arrow">
					<div class="parent-icon"><i class="bx bx-category"></i></div>
					<div class="menu-title">Tarefa</div>
				</a>
				<ul>
					<li> 
						<a href="${pageContext.request.contextPath}/tarefa/listar"><i class="bx bx-right-arrow-alt"></i>Tarefas</a>
					</li>
					<li> 
						<a href="${pageContext.request.contextPath}/tarefa/criar"><i class="bx bx-right-arrow-alt"></i>Nova tarefa</a>
					</li>
					<li> 
						<a href="#"><i class="bx bx-right-arrow-alt"></i>Documentos</a>
					</li>
					
				</ul>
			</li>
			<li>
				<a href="javascript:;" class="has-arrow">
					<div class="parent-icon"><i class="bx bx-category"></i>
					</div>
					<div class="menu-title">Equipes</div>
				</a>
				<ul>
					<li> 
						<a href="#"><i class="bx bx-right-arrow-alt"></i>Pessoas</a>
					</li>
					<li> 
						<a href="#"><i class="bx bx-right-arrow-alt"></i>Grupos</a>
					</li>
					<li> 
						<a href="#"><i class="bx bx-right-arrow-alt"></i>Documentos</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</html>