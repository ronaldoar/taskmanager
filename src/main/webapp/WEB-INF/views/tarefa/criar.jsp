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

                        <form action="${pageContext.request.contextPath}/tarefa/criar"
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

</body>
</html>