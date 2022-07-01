package com.eniencheres.servlet;

import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.UtilisateurDAO;
import com.eniencheres.dal.jdbc.UtilisateurDAOJdbcImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ProfilUtilisateur", value = "/profil")
public class ProfilUtilisateurServlet extends HttpServlet {
    private final UtilisateurDAO utilisateurDAO = new UtilisateurDAOJdbcImpl();
    private Utilisateur utilisateur;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (utilisateur != null){
            String email = utilisateur.getEmail();
            String pseudo = utilisateur.getPseudo();
            String mot_de_passe = utilisateur.getMot_de_passe();
            try {
                utilisateur = utilisateurDAO.chercherUtilisateur(email, pseudo, mot_de_passe);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/profil.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
