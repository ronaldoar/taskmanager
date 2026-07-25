package br.com.rar.taskmanager.controller.contato;

import java.io.IOException;

import br.com.rar.taskmanager.dao.ContatoDao;
import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.model.Contato;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contato/editar")
public class ContatoEditarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long id = Long.valueOf(req.getParameter("id"));

        EntityManager em = JPAUtil.getEntityManager();

        try {

            ContatoDao dao = new ContatoDao(em);

            Contato contato = dao.buscarPorId(id);

            req.setAttribute("contato", contato);

            req.getRequestDispatcher("/WEB-INF/views/contato/editar.jsp")
                    .forward(req, resp);

        } finally {

            em.close();

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EntityManager em = JPAUtil.getEntityManager();

        try {

            Long id = Long.valueOf(req.getParameter("id"));

            ContatoDao dao = new ContatoDao(em);

            Contato contato = dao.buscarPorId(id);

            contato.setNome(req.getParameter("nome"));
            contato.setSobrenome(req.getParameter("sobrenome"));
            contato.setCelular(req.getParameter("celular"));
            contato.setEmail(req.getParameter("email"));
            contato.setEndereco(req.getParameter("endereco"));
            contato.setComentario(req.getParameter("comentario"));

            dao.atualizar(contato);

            resp.sendRedirect(req.getContextPath() + "/contato/listar");

        } finally {

            em.close();

        }

    }

}