package com.example.empresa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {
    public void inserirUsuario(Usuario usuario) {
        String sql = "INSERT INTO users(nome, email, cpf, username, password) VALUES(?,?,?,?,MD5(?))";
        try {
            Connection con = DataBaseConnection.initializeDataBase();
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, usuario.getNome());
            stm.setString(2, usuario.getEmail());
            stm.setString(3, usuario.getCpf());
            stm.setString(4, usuario.getUsername());
            stm.setString(5, usuario.getPassword());

            stm.executeUpdate();

            stm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Usuario autenticarUsuario(String nome, String senha) {
        Usuario usuario = null;
        String sql = "SELECT * FROM users WHERE nome = ? AND password = MD5(?)";
        try {
            Connection con = DataBaseConnection.initializeDataBase();
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, nome);
            stm.setString(2, senha);

            ResultSet rs = stm.executeQuery();

            if (rs.next()){
                usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("email"),
                        rs.getString("cpf"),
                        rs.getString("username"),
                        rs.getString("password"));
            }

            stm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usuario;
    }

}
