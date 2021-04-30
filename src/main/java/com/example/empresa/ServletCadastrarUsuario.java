package com.example.empresa;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletCadastrarUsuario", value = "/cadastrar-usuario")
public class ServletCadastrarUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String usr = request.getParameter("usr");
        String password = request.getParameter("password");

        Usuario usuario = new Usuario(nome, email, cpf, usr, password);

        UsuarioDAO dao = new UsuarioDAO();

        dao.inserirUsuario(usuario);

        response.sendRedirect(".");
    }
}
