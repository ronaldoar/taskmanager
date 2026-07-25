<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>

<div class="wrapper">

    <%@ include file="/WEB-INF/views/fragments/header.jsp" %>
    <%@ include file="/WEB-INF/views/fragments/menu.jsp" %>

    <div class="page-wrapper">

        <div class="page-content">

            <div class="col-xl-8 mx-auto">

                <div class="card border-top border-0 border-4 border-primary shadow-sm">

                    <div class="card-body p-5">

                        <div class="card-title d-flex align-items-center">
                            <div>
                                <i class="bx bx-task me-2 font-22 text-primary"></i>
                            </div>
                            <h5 class="mb-0 text-primary">
                                Cadastrar Nova Tarefa
                            </h5>
                        </div>

                        <hr>

                        <div id="alerta-sucesso" class="alert alert-success d-none" role="alert">
                            Tarefa cadastrada com sucesso!
                        </div>

                        <div id="alerta-erro" class="alert alert-danger d-none" role="alert">
                            Erro ao cadastrar tarefa. Tente novamente.
                        </div>

                        <form id="form-criar-tarefa"
                              action="${pageContext.request.contextPath}/tarefa/criar"
                              method="post"
                              class="row g-3">

                            <div class="col-md-12">
                                <label class="form-label">Título</label>
                                <input
                                    type="text"
                                    name="titulo"
                                    class="form-control"
                                    required>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label">Descrição</label>
                                <textarea
                                    name="desc"
                                    class="form-control"
                                    rows="4"
                                    required></textarea>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Responsável</label>
                                <input
                                    type="text"
                                    name="responsavel"
                                    class="form-control"
                                    required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Prioridade</label>
                                <select
                                    name="prioridade"
                                    class="form-select"
                                    required>

                                    <option value="">Selecione...</option>
                                    <option value="BAIXA">Baixa</option>
                                    <option value="MEDIA">Média</option>
                                    <option value="ALTA">Alta</option>

                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Tipo da Tarefa</label>

                                <select
                                    name="tipo"
                                    class="form-select"
                                    required>

                                    <option value="">Selecione...</option>
                                    <option value="PAGAMENTO">Pagamento</option>
                                    <option value="EVENTO">Evento</option>
                                    <option value="SERVICO">Serviço</option>

                                </select>

                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Serviço</label>
                                <input
                                    type="text"
                                    name="tipoServico"
                                    class="form-control"
                                    required>
                            </div>

                            <div class="col-12 text-end">

                                <button
                                    type="reset"
                                    class="btn btn-secondary">

                                    Limpar

                                </button>

                                <button
                                    type="submit"
                                    id="btn-cadastrar"
                                    class="btn btn-primary">

                                    <i class="bx bx-save"></i>
                                    Cadastrar Tarefa

                                </button>

                            </div>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>

</div>

<script>
document.getElementById('form-criar-tarefa').addEventListener('submit', function (event) {
    event.preventDefault();

    var form = event.target;
    var btn = document.getElementById('btn-cadastrar');
    var alertaSucesso = document.getElementById('alerta-sucesso');
    var alertaErro = document.getElementById('alerta-erro');

    alertaSucesso.classList.add('d-none');
    alertaErro.classList.add('d-none');
    btn.disabled = true;

    var formData = new FormData(form);

    fetch(form.action, {
        method: 'POST',
        body: new URLSearchParams(formData)
    })
    .then(function (response) {
        return response.json().then(function (data) {
            return { status: response.status, data: data };
        });
    })
    .then(function (resultado) {
        if (resultado.status === 200 && resultado.data.sucesso) {
            alertaSucesso.textContent = resultado.data.mensagem;
            alertaSucesso.classList.remove('d-none');
            form.reset();
        } else {
            alertaErro.textContent = resultado.data.mensagem || 'Erro ao cadastrar tarefa.';
            alertaErro.classList.remove('d-none');
        }
    })
    .catch(function () {
        alertaErro.textContent = 'Erro de comunicação com o servidor.';
        alertaErro.classList.remove('d-none');
    })
    .finally(function () {
        btn.disabled = false;
    });
});
</script>

</body>
</html>