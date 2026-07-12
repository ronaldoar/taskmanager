package br.com.rar.taskmanager.controller.tarefa;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.dao.TarefaDao;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/tarefa/excluir")
public class TarefaExcluirServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        EntityManager em = JPAUtil.getEntityManager();

        try {
            String[] idsParam = req.getParameterValues("id");

            if (idsParam == null || idsParam.length == 0) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("{\"sucesso\": false, \"mensagem\": \"Nenhuma tarefa selecionada.\"}");
                return;
            }

            List<Long> ids = new ArrayList<>();
            for (String idStr : idsParam) {
                ids.add(Long.parseLong(idStr));
            }

            TarefaDao tarefaDao = new TarefaDao(em);
            tarefaDao.excluirVarios(ids);

            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write("{\"sucesso\": true, \"mensagem\": \"" + ids.size() + " tarefa(s) excluída(s) com sucesso!\"}");

        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"sucesso\": false, \"mensagem\": \"Erro ao excluir tarefa(s). Tente novamente.\"}");
        } finally {
            em.close();
        }
    }
}