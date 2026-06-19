package br.com.rar.taskmanager.controller.usuario;

import java.io.IOException;

import br.com.rar.taskmanager.business.ConfiguracoesBusiness;
import br.com.rar.taskmanager.controller.commons.ValidatorCommons;
import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.model.Usuario;
import br.com.rar.taskmanager.util.StringUtil;
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
		 
		 String msg = cadastrar(username, nomeCompl, celular, email, senha, confSenha, ativo);
		 req.setAttribute("msg", msg);
		 req.getRequestDispatcher("/WEB-INF/views/usuario/criar.jsp").forward(req, resp);
	}
	
	private String cadastrar(String username, String nomeCompl, String celular, String email, String senha, String confSenha, String ativo){
		
		try {
			 ValidatorCommons.validar(username, nomeCompl, celular, email, senha, confSenha);
			 ValidatorCommons.validarSenhas(senha, confSenha);
			 
			 Usuario user = new Usuario();
			 user.setUsername(username);
			 user.setCelular(celular);
			 user.setEmail(email);
			 user.setNome(nomeCompl);
			 user.setAtiva(StringUtil.isNotNull(ativo));
			 
			 new ConfiguracoesBusiness().cadastrar(JPAUtil.getEntityManager(), user);
			 return "Usuário cadastrado com sucesso!";

		}catch(IllegalArgumentException ex) {
			return ex.getMessage();
		}		
	}
}
