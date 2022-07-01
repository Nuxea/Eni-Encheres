package com.eniencheres.servlet;

import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.UtilisateurDAO;
import com.eniencheres.dal.jdbc.UtilisateurDAOJdbcImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Connexion", value = "/connexion")
public class ConnexionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/connexion.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destPage = "/WEB-INF/jsp/connexion.jsp";
        try {
            String email = request.getParameter("identifiant");
            String pseudo = request.getParameter("identifiant");
            String mot_de_passe = request.getParameter("mot_de_passe");

            UtilisateurDAO dao = new UtilisateurDAOJdbcImpl();
            Utilisateur utilisateur = dao.chercherUtilisateur(email, pseudo, mot_de_passe);

            if (utilisateur != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("utilisateur", utilisateur);
                destPage = "/WEB-INF/jsp/accueil.jsp";
            } else {
                String message = "Votre mail ou votre mot de passe est incorrect";
                request.setAttribute("message", message);
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
        dispatcher.forward(request, response);
    }
}
