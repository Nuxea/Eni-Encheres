package com.eniencheres.servlet;

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
import java.time.format.DateTimeFormatter;

@WebServlet(name = "Edition", value = "/Edition")
public class Edition extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArticleVenduDAOJdbcImpl articleVenduDAO = new ArticleVenduDAOJdbcImpl();

        int idArticle = (int) request.getSession(false).getAttribute("idArticle");
        ArticleVendu art;
        try {
            art = articleVenduDAO.getDetailsArticle(idArticle);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("article", art);
        request.getRequestDispatcher("/WEB-INF/jsp/update.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*Edition de la vente si elle n'a pas encore commencé*/
        Utilisateur utilisateur = new Utilisateur(1);
        ArticleVenduDAOJdbcImpl articleVenduDAO = new ArticleVenduDAOJdbcImpl();

        Categorie cat = Categorie.getCategorieFromSelect(request.getParameter("categorie"));

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime dateDebut = LocalDateTime.parse(request.getParameter("dateDebut"), dtf);
        LocalDateTime dateFin = LocalDateTime.from(LocalDate.parse(request.getParameter("dateFin")));
        int miseAPrix = Integer.parseInt(request.getParameter("miseAPrix"));

        ArticleVendu articleVendu = new ArticleVendu(
                request.getParameter("article"),
                request.getParameter("description"),
                dateDebut,
                dateFin,
                miseAPrix,
                cat,
                utilisateur
        );

        articleVendu.setNoArticle((Integer) request.getSession(false).getAttribute("idArticle"));
        int idArt = articleVendu.getNoArticle();
        try {

            articleVenduDAO.editerEnchere(articleVendu);

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

        //TODO : rediriger vers la page de l'article créé avec l'id
        request.getRequestDispatcher("/WEB-INF/jsp/detailsArticle.jsp" ).forward(request, response);


    }
}
