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


@WebServlet("/contato/cadastrar")
public class ContatoCadastrarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/views/contato/criar.jsp")
           .forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");


        String nome = req.getParameter("nome");
        String sobrenome = req.getParameter("sobrenome");
        String celular = req.getParameter("celular");
        String email = req.getParameter("email");
        String endereco = req.getParameter("endereco");
        String comentario = req.getParameter("comentario");


        // Validação dos campos obrigatórios
        if (nome == null || nome.trim().isEmpty() ||
            sobrenome == null || sobrenome.trim().isEmpty() ||
            celular == null || celular.trim().isEmpty() ||
            email == null || email.trim().isEmpty()) {


            req.setAttribute("erro", "Preencha todos os campos obrigatórios!");


            req.getRequestDispatcher("/WEB-INF/views/contato/criar.jsp")
               .forward(req, resp);

            return;
        }


        EntityManager em = JPAUtil.getEntityManager();


        try {

            Contato contato = new Contato();

            contato.setNome(nome);
            contato.setSobrenome(sobrenome);
            contato.setCelular(celular);
            contato.setEmail(email);
            contato.setEndereco(endereco);
            contato.setComentario(comentario);
            contato.setAtiva(true);


            ContatoDao contatoDao = new ContatoDao(em);

            contatoDao.cadastrar(contato);


            req.setAttribute("mensagem", "Contato cadastrado com sucesso!");


            req.getRequestDispatcher("/WEB-INF/views/contato/criar.jsp")
               .forward(req, resp);


        } finally {

            em.close();

        }
    }
}