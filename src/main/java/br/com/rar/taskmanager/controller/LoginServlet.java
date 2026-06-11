package br.com.rar.taskmanager.controller;

import java.io.IOException;

import br.com.rar.taskmanager.dao.JPAUtil;
import br.com.rar.taskmanager.dao.UsuarioDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String usuarioForm = request.getParameter("username");
        String senhaForm   = request.getParameter("password");

        if(existe(usuarioForm)){
        	
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuarioForm);
            response.sendRedirect(request.getContextPath() + "/dashboard");
            
        }else {
            request.setAttribute("errorMessage", "Usuário ou senha inválidos.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
    
    private boolean existe(String username) {
    	UsuarioDao dao = new UsuarioDao(JPAUtil.getEntityManager());
    	return dao.buscarPorUsername(username) != null;
    }
}
