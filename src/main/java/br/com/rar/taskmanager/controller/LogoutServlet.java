package br.com.rar.taskmanager.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Captura a sessão atual, se ela existir
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Destrói a sessão e apaga os dados gravados nela
        }

        // Redireciona o navegador do usuário para a URL de login do Servlet
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
