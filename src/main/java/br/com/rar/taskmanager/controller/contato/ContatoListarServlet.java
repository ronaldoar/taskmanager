package br.com.rar.taskmanager.controller.contato;

import java.io.IOException;
import java.util.List;

import br.com.rar.taskmanager.dao.ContatoDao;
import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.model.Contato;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contato/listar")
public class ContatoListarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            ContatoDao contatoDao = new ContatoDao(em);

            List<Contato> contatos = contatoDao.listarTodos();

            System.out.println("Quantidade de contatos: " + contatos.size());

            req.setAttribute("contatos", contatos);

            req.setAttribute("contatos", contatos);

            req.getRequestDispatcher("/WEB-INF/views/contato/listar.jsp")
                    .forward(req, resp);

        } finally {
            em.close();
        }
    }
}