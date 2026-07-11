package br.com.rar.taskmanager.controller.tarefa;

import java.io.IOException;
import java.util.List;

import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.dao.TarefaDao;
import br.com.rar.taskmanager.model.Tarefa;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/tarefa/listar")
public class TarefaListarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            TarefaDao tarefaDao = new TarefaDao(em);

            List<Tarefa> listaTarefas = tarefaDao.listarTodos();

            req.setAttribute("tarefas", listaTarefas);

            req.getRequestDispatcher("/WEB-INF/views/tarefa/listar.jsp")
                    .forward(req, resp);

        } finally {
            em.close();
        }
    }
}