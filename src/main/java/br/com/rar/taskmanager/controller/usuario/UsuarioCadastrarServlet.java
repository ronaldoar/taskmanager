package br.com.rar.taskmanager.controller.usuario;

import java.io.IOException;

import br.com.rar.taskmanager.controller.commons.ValidatorCommons;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/usuario/criar")
public class UsuarioCadastrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/usuario/criar.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 String username 	= req.getParameter("username");
		 String nomeCompl 	= req.getParameter("nomeCompl");
		 String celular 	= req.getParameter("celular");
		 String email 		= req.getParameter("email");
		 String senha 		= req.getParameter("senha");
		 String confSenha 	= req.getParameter("confSenha");
		 String ativo 	    = req.getParameter("ativo");
		 
		 ValidatorCommons.validar(username, nomeCompl, celular, email, senha, confSenha);
		 
		 req.getRequestDispatcher("/WEB-INF/views/usuario/criar.jsp").forward(req, resp);
	}
	
	
}
