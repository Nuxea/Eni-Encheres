package com.eniencheres.servlet;

import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.UtilisateurDAO;
import com.eniencheres.dal.jdbc.UtilisateurDAOJdbcImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Inscription", value = "/inscription")
public class InscriptionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/inscription.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pseudo = request.getParameter("pseudo");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String rue = request.getParameter("rue");
        String code_postal = request.getParameter("code_postal");
        String ville = request.getParameter("ville");
        String mot_de_passe = request.getParameter("mot_de_passe");
        String mot_de_passe_verif = request.getParameter("mot_de_passe_verif");
        int credit = 0;
        boolean administrateur = false;

        if (mot_de_passe.equals(mot_de_passe_verif)){
            UtilisateurDAO utilisateurDAO = new UtilisateurDAOJdbcImpl();
            Utilisateur utilisateur = new Utilisateur(pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur);
            utilisateurDAO.nouvelUtilisateur(utilisateur);
            if (utilisateur != null){
                HttpSession session = request.getSession(true);
                session.setAttribute("utilisateur", utilisateur);
            }
        }else {
            String message = "Votre mot de passe n'est pas le même que la vérification !";
            request.setAttribute("message", message);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/inscription.jsp");
            dispatcher.forward(request, response);
        }

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/jsp/accueil.jsp");
        rd.forward(request, response);
    }
}
