<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gerenciador de Tarefas</title>
    <style>
        .status-select.status-AGUARDANDO { background-color: #e2e3e5; color: #41464b; }
        .status-select.status-INICIADA { background-color: #cfe2ff; color: #084298; }
        .status-select.status-PENDENTE { background-color: #fff3cd; color: #664d03; }
        .status-select.status-CONCLUIDA { background-color: #d1e7dd; color: #0f5132; }
        .status-select.status-CANCELADA { background-color: #f8d7da; color: #842029; }
        .status-select.status-ADIADA { background-color: #ffe5d0; color: #7a4100; }
    </style>
</head>
<body>

    <div class="wrapper">
        <%@ include file="/WEB-INF/views/fragments/header.jsp" %>
        <%@ include file="/WEB-INF/views/fragments/menu.jsp" %>

        <div class="page-wrapper">
            <div class="page-content">

                <div class="card radius-10">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <div>
                                <h5 class="mb-0">Minhas Tarefas</h5>
                            </div>
                        </div>

                        <div id="alerta-sucesso" class="alert alert-success d-none" role="alert"></div>
                        <div id="alerta-erro" class="alert alert-danger d-none" role="alert"></div>

                        <div class="table-responsive">
                            <table class="table align-middle mb-0 table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="checkbox-marcar-todos" class="form-check-input">
                                        </th>
                                        <th>ID</th>
                                        <th>Título</th>
                                        <th>Descrição</th>
                                        <th>Responsável</th>
                                        <th>Serviço</th>
                                        <th>Prioridade</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- O c:forEach vai repetir essa linha para cada tarefa do banco --%>
                                    <c:forEach var="tarefa" items="${tarefas}">
                                        <tr id="linha-${tarefa.id}">
                                            <td>
                                                <input type="checkbox" name="tarefaSelecionada" class="form-check-input checkbox-tarefa" value="${tarefa.id}">
                                            </td>
                                            <td>#${tarefa.id}</td>
                                            <td><strong>${tarefa.titulo}</strong></td>
                                            <td>${tarefa.desc}</td>
                                            <td>${tarefa.responsavel}</td>
                                            <td>${tarefa.tipoServico}</td>
                                            <td>
                                                <span class="badge bg-gradient-deepblue text-white shadow-sm w-100">
                                                    ${tarefa.prioridade}
                                                </span>
                                            </td>
                                            <td>
                                                <select class="form-select form-select-sm status-select status-${tarefa.status}" data-id="${tarefa.id}">
                                                    <option value="AGUARDANDO" ${tarefa.status == 'AGUARDANDO' ? 'selected' : ''}>Aguardando</option>
                                                    <option value="INICIADA" ${tarefa.status == 'INICIADA' ? 'selected' : ''}>Iniciada</option>
                                                    <option value="PENDENTE" ${tarefa.status == 'PENDENTE' ? 'selected' : ''}>Pendente</option>
                                                    <option value="CONCLUIDA" ${tarefa.status == 'CONCLUIDA' ? 'selected' : ''}>Concluída</option>
                                                    <option value="CANCELADA" ${tarefa.status == 'CANCELADA' ? 'selected' : ''}>Cancelada</option>
                                                    <option value="ADIADA" ${tarefa.status == 'ADIADA' ? 'selected' : ''}>Adiada</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <c:if test="${empty tarefas}">
                                        <tr>
                                            <td colspan="8" class="text-center text-muted">
                                                Nenhuma tarefa cadastrada ainda.
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex justify-content-end gap-2 mt-3">
                            <button type="button" id="btn-excluir" class="btn btn-danger" disabled>
                                <i class="bx bx-trash"></i> Excluir <span id="contador-selecionados"></span>
                            </button>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>
    </div>

<script>
(function () {
    var btnExcluir = document.getElementById('btn-excluir');
    var contador = document.getElementById('contador-selecionados');
    var checkboxTodos = document.getElementById('checkbox-marcar-todos');
    var alertaSucesso = document.getElementById('alerta-sucesso');
    var alertaErro = document.getElementById('alerta-erro');

    function esconderAlertas() {
        alertaSucesso.classList.add('d-none');
        alertaErro.classList.add('d-none');
    }

    function mostrarSucesso(msg) {
        alertaSucesso.textContent = msg;
        alertaSucesso.classList.remove('d-none');
    }

    function mostrarErro(msg) {
        alertaErro.textContent = msg;
        alertaErro.classList.remove('d-none');
    }

    function atualizarBotao() {
        var marcados = document.querySelectorAll('.checkbox-tarefa:checked');
        if (marcados.length > 0) {
            btnExcluir.disabled = false;
            contador.textContent = '(' + marcados.length + ')';
        } else {
            btnExcluir.disabled = true;
            contador.textContent = '';
        }
    }

    document.querySelectorAll('.checkbox-tarefa').forEach(function (checkbox) {
        checkbox.addEventListener('change', atualizarBotao);
    });

    checkboxTodos.addEventListener('change', function () {
        document.querySelectorAll('.checkbox-tarefa').forEach(function (checkbox) {
            checkbox.checked = checkboxTodos.checked;
        });
        atualizarBotao();
    });

    btnExcluir.addEventListener('click', function () {
        var marcados = document.querySelectorAll('.checkbox-tarefa:checked');
        if (marcados.length === 0) {
            return;
        }

        var ids = Array.from(marcados).map(function (checkbox) {
            return checkbox.value;
        });

        var mensagemConfirmacao = ids.length === 1
            ? 'Tem certeza que deseja excluir a tarefa #' + ids[0] + '?'
            : 'Tem certeza que deseja excluir essas ' + ids.length + ' tarefas?';

        if (!confirm(mensagemConfirmacao)) {
            return;
        }

        esconderAlertas();
        btnExcluir.disabled = true;

        var corpo = ids.map(function (id) {
            return 'id=' + encodeURIComponent(id);
        }).join('&');

        fetch('${pageContext.request.contextPath}/tarefa/excluir', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: corpo
        })
        .then(function (response) {
            return response.json().then(function (data) {
                return { status: response.status, data: data };
            });
        })
        .then(function (resultado) {
            if (resultado.status === 200 && resultado.data.sucesso) {
                ids.forEach(function (id) {
                    var linha = document.getElementById('linha-' + id);
                    if (linha) {
                        linha.remove();
                    }
                });
                checkboxTodos.checked = false;
                mostrarSucesso(resultado.data.mensagem);
            } else {
                mostrarErro(resultado.data.mensagem || 'Erro ao excluir tarefa(s).');
            }
            atualizarBotao();
        })
        .catch(function () {
            mostrarErro('Erro de comunicação com o servidor.');
            atualizarBotao();
        });
    });

    document.querySelectorAll('.status-select').forEach(function (select) {
        select.addEventListener('change', function () {
            var id = select.getAttribute('data-id');
            var novoStatus = select.value;

            esconderAlertas();
            select.disabled = true;

            fetch('${pageContext.request.contextPath}/tarefa/status', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'id=' + encodeURIComponent(id) + '&status=' + encodeURIComponent(novoStatus)
            })
            .then(function (response) {
                return response.json().then(function (data) {
                    return { status: response.status, data: data };
                });
            })
            .then(function (resultado) {
                if (resultado.status === 200 && resultado.data.sucesso) {
                    select.className = 'form-select form-select-sm status-select status-' + novoStatus;
                    mostrarSucesso(resultado.data.mensagem);
                } else {
                    mostrarErro(resultado.data.mensagem || 'Erro ao atualizar status.');
                }
            })
            .catch(function () {
                mostrarErro('Erro de comunicação com o servidor.');
            })
            .finally(function () {
                select.disabled = false;
            });
        });
    });
})();
</script>

</body>
</html>