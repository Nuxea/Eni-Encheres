package com.eniencheres.servlet;

import com.eniencheres.bo.ArticleVendu;
import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.jdbc.ArticleVenduDAOJdbcImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


public class AffichageDetailsArticle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArticleVenduDAOJdbcImpl articleVenduDAO = new ArticleVenduDAOJdbcImpl();
        ArticleVendu article;
        Utilisateur utilisateur;
        try {

            int idArt = Integer.parseInt(request.getParameter("idArticle"));
            article = articleVenduDAO.getDetailsArticle(idArt);
            utilisateur = articleVenduDAO.getUtilisateurFromIdArticle(idArt);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("article", article);
        request.setAttribute("vendeur", utilisateur);

        request.getRequestDispatcher("/WEB-INF/jsp/detailsArticle.jsp").forward(request,
                response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
