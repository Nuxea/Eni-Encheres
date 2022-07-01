package com.eniencheres.servlet;

import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.UtilisateurDAO;
import com.eniencheres.dal.jdbc.UtilisateurDAOJdbcImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ModificationUtilisateur", value = "/modifier")
public class ModificationUtilisateurServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = null;
        String pseudo = null;
        String nom = null;
        String prenom = null;
        String email = null;
        String telephone = null;
        String rue = null;
        String code_postal = null;
        String ville = null;

        id = Integer.valueOf(request.getParameter("no_utilisateur"));
        pseudo = request.getParameter("pseudo");
        nom = request.getParameter("nom");
        prenom = request.getParameter("prenom");
        email = request.getParameter("email");
        telephone = request.getParameter("telephone");
        rue = request.getParameter("rue");
        code_postal = request.getParameter("code_postal");
        ville = request.getParameter("ville");

        UtilisateurDAO utilisateurDAO = new UtilisateurDAOJdbcImpl();
        Utilisateur utilisateur = new Utilisateur(id, pseudo, nom, prenom, email, telephone, rue, code_postal, ville);
        utilisateurDAO.updateUtilisateur(utilisateur);

        HttpSession session = request.getSession();
        if (session != null){
            session = request.getSession(true);
            session.setAttribute("utilisateur", utilisateur);

            String message = "Vos informations personnelles ont bien été modifiées !";
            request.setAttribute("message", message);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/profil.jsp");
        dispatcher.forward(request, response);
    }
}
