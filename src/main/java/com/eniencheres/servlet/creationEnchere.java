package com.eniencheres.servlet;

import com.eniencheres.bll.FormErrors;
import com.eniencheres.bo.ArticleVendu;
import com.eniencheres.bo.Categorie;
import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.jdbc.ArticleVenduDAOJdbcImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "CreationEnchere", value = "/CreationEnchere")
public class creationEnchere extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/creation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArticleVenduDAOJdbcImpl articleVenduDAO = new ArticleVenduDAOJdbcImpl();
        Utilisateur utilisateur = new Utilisateur(1);

        Categorie cat = Categorie.getCategorieFromSelect(request.getParameter("categorie"));

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate dateDebut = LocalDate.parse(request.getParameter("dateDebut"), dtf);
        LocalDateTime dateEtHeureDebut = LocalTime.parse(request.getParameter("heureDebut"), DateTimeFormatter.ofPattern(
                "HH" + ":mm")).atDate(dateDebut);

        LocalDate dateFin = LocalDate.parse(request.getParameter("dateFin"), dtf);
        LocalDateTime dateEtHeureFin = LocalTime.parse(request.getParameter("heureFin"), DateTimeFormatter.ofPattern(
                "HH" +
                        ":mm")).atDate(dateFin);
        int miseAPrix = 0;
        if (request.getParameter("miseAPrix").isEmpty()) {
            miseAPrix = 0;
        }   else {
            miseAPrix = Integer.parseInt(request.getParameter("miseAPrix"));
        }

        boolean nomArticleOk =
                request.getParameter("article").length() > 0;
        boolean descriptionOk = request.getParameter("description").length() > 0;
        boolean finApresDebut = dateEtHeureDebut.isBefore(dateEtHeureFin);
        boolean miseAPrixOk = request.getParameter("miseAPrix").length() > 0;
        boolean creationOk = nomArticleOk && finApresDebut && descriptionOk && miseAPrixOk;

        ArticleVendu articleVendu = new ArticleVendu(
                request.getParameter("article"),
                request.getParameter("description"),
                dateEtHeureDebut,
                dateEtHeureFin,
                miseAPrix,
                cat,
                utilisateur
        );
        int idArt = 0;
        if (creationOk) {
            try {
                idArt = articleVenduDAO.creerEnchere(articleVendu);
                request.setAttribute("idArticle", idArt);

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            ArticleVendu article;
            try {
                article = articleVenduDAO.getDetailsArticle(idArt);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            request.setAttribute("article", article);

            request.getRequestDispatcher("/WEB-INF/jsp/detailsArticle.jsp").forward(request, response);
        } else {
            FormErrors errorForm = new FormErrors();
            if (!nomArticleOk) {
                errorForm.setErreurNom("Le nom de l'article doit être renseigné");
            }
            if (!finApresDebut) {
                errorForm.setErreurDateFin("La date de fin doit être après la date de début");
            }
            if (!descriptionOk) {
                errorForm.setErreurDescription("La description doit être renseignée");
            }
            if (!miseAPrixOk) {
                errorForm.setErreurPrix("La mise à prix doit être renseignée");
            }

            request.setAttribute("errorForm", errorForm);

            request.getRequestDispatcher("/WEB-INF/jsp/creation.jsp").forward(request, response);
        }
    }
}
