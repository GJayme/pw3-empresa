package com.example.empresa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletAutenticarUsuario", value = "/autenticar")
public class ServletAutenticarUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = dao.autenticarUsuario(user, password);

        if (usuario != null) {
            session.setAttribute("usuario", usuario);
        }

        response.sendRedirect(".");
    }
}
