package br.com.rar.taskmanager.controller.tarefa;

import java.io.IOException;
import java.util.Collections;
import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.dao.TarefaDao;
import br.com.rar.taskmanager.model.commons.CartaoStatus;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/tarefa/status")
public class TarefaStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        EntityManager em = JPAUtil.getEntityManager();

        try {
            Long id = Long.parseLong(req.getParameter("id"));
            CartaoStatus status = CartaoStatus.valueOf(req.getParameter("status"));

            TarefaDao tarefaDao = new TarefaDao(em);
            tarefaDao.alterarStatusVarios(Collections.singletonList(id), status);

            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("{\"sucesso\": true, \"mensagem\": \"Status atualizado com sucesso!\"}");

        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"sucesso\": false, \"mensagem\": \"Erro ao atualizar status. Tente novamente.\"}");
        } finally {
            em.close();
        }
    }
}