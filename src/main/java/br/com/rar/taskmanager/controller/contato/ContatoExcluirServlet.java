package br.com.rar.taskmanager.controller.contato;

import java.io.IOException;

import br.com.rar.taskmanager.dao.ContatoDao;
import br.com.rar.taskmanager.dao.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contato/excluir")
public class ContatoExcluirServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();

        try {

            ContatoDao dao = new ContatoDao(em);

            String[] ids = req.getParameterValues("ids");

            if (ids != null) {

                for (String id : ids) {

                    dao.excluir(Long.valueOf(id));

                }

            }

            resp.sendRedirect(req.getContextPath() + "/contato/listar");

        } finally {

            em.close();

        }

    }

}