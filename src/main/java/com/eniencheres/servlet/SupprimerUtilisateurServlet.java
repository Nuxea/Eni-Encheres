package com.eniencheres.servlet;

import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.UtilisateurDAO;
import com.eniencheres.dal.jdbc.UtilisateurDAOJdbcImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SupprimerUtilisateur", value = "/supprimer")
public class SupprimerUtilisateurServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no_utilisateur = Integer.parseInt(request.getParameter("no_utilisateur"));

        UtilisateurDAO utilisateurDAO = new UtilisateurDAOJdbcImpl();
        Utilisateur utilisateur = new Utilisateur(no_utilisateur);

        HttpSession session = request.getSession();
        if (session != null ){
            utilisateurDAO.deleteUtilisateur(utilisateur);
            session.removeAttribute("utilisateur");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/connexion.jsp");
            dispatcher.forward(request, response);
        }
    }
}
