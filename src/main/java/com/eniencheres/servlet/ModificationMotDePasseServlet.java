package com.eniencheres.servlet;

import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.UtilisateurDAO;
import com.eniencheres.dal.jdbc.UtilisateurDAOJdbcImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "ModificationMotDePasse", value = "/modifierMdp")
public class ModificationMotDePasseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = null;
        String mot_de_passe_actuel = null;
        String nouveau_mot_de_passe = null;
        String mot_de_passe_verif = null;

        id = Integer.valueOf(request.getParameter("no_utilisateur"));
        mot_de_passe_actuel = request.getParameter("mot_de_passe_actuel");
        nouveau_mot_de_passe = request.getParameter("nouveau_mot_de_passe");
        mot_de_passe_verif = request.getParameter("mot_de_passe_verif");

        HttpSession session = request.getSession();
        UtilisateurDAO utilisateurDAO = new UtilisateurDAOJdbcImpl();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        if (mot_de_passe_actuel.equals(utilisateur.getMot_de_passe())) {
            if (nouveau_mot_de_passe.equals(mot_de_passe_verif)) {
                Utilisateur nouveauMdpUtilisateur = new Utilisateur(id,nouveau_mot_de_passe);
                utilisateurDAO.updateMotDePasse(nouveauMdpUtilisateur);
                String message = "Votre mot de passe a bien été modifié !";
                request.setAttribute("message", message);
            } else {
                String message = "Le nouveau mot de passe n'est pas le même que la vérification !";
                request.setAttribute("message", message);
            }
        } else {
            String message = "Votre mot de passe actuel est faux !";
            request.setAttribute("message", message);
        }


        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/profil.jsp");
        dispatcher.forward(request, response);
    }
}
