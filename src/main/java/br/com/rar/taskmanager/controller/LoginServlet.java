package br.com.rar.taskmanager.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

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

        if("user-test".equals(usuarioForm) && "1234".equals(senhaForm)){
        	
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuarioForm);
            response.sendRedirect(request.getContextPath() + "/dashboard");

            
        }else {
            request.setAttribute("errorMessage", "Usuário ou senha inválidos.");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
