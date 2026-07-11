package br.com.rar.taskmanager.controller.tarefa;

import java.io.IOException;
import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.dao.TarefaDao;
import br.com.rar.taskmanager.model.Tarefa;
import br.com.rar.taskmanager.model.commons.CartaoStatus;
import br.com.rar.taskmanager.model.commons.TarefaTipo;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/tarefa/criar")
public class TarefaCriarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/tarefa/criar.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            Tarefa tarefa = new Tarefa();

            tarefa.setTitulo(req.getParameter("titulo"));
            tarefa.setDesc(req.getParameter("desc"));
            tarefa.setResponsavel(req.getParameter("responsavel"));
            tarefa.setTipoServico(req.getParameter("tipoServico"));
            tarefa.setPrioridade(req.getParameter("prioridade"));
            tarefa.setTipo(TarefaTipo.valueOf(req.getParameter("tipo")));
            tarefa.setStatus(CartaoStatus.PENDENTE);

            TarefaDao tarefaDao = new TarefaDao(em);
            tarefaDao.cadastrar(tarefa);

            resp.sendRedirect(req.getContextPath() + "/tarefa/listar");

        } finally {
            em.close();
        }
    }
}