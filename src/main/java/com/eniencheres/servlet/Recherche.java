package com.eniencheres.servlet;

import com.eniencheres.bo.ArticleVendu;
import com.eniencheres.bo.Categorie;
import com.eniencheres.dal.jdbc.ArticleVenduDAOJdbcImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.apache.taglibs.standard.functions.Functions.containsIgnoreCase;

@WebServlet(name = "Recherche", value = "/Recherche")
public class Recherche extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArticleVenduDAOJdbcImpl articleVenduDAO = new ArticleVenduDAOJdbcImpl();

        String recherche = request.getParameter("recherche");
        String cat = request.getParameter("categorie");
//        Categorie categorieRecherche = Categorie.getCategorieFromSelect(cat);
//        Categorie defaultCategorie = Categorie.getCategorieFromSelect("Toutes");
        List<ArticleVendu> articles = new ArrayList<>();
        List<ArticleVendu> articlesTrouves = new ArrayList<>();

        try {
            articles = articleVenduDAO.getAllArticles();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        for (  ArticleVendu article : articles) {
//            if ((article.getDescription().contains(recherche)|| article.getNomArticle().contains(recherche)) && (categorieRecherche.getLibelle().equals(article.getCategorieArticle().getLibelle()) || (categorieRecherche.getLibelle()).equals(defaultCategorie.getLibelle()))) {
//                articlesTrouves.add(article);
//            }

//            if ((article.getDescription().contains(recherche)|| article.getNomArticle().contains(recherche))) {
//                articlesTrouves.add(article);
//            }

            if(containsIgnoreCase(article.getDescription(), recherche) || containsIgnoreCase(article.getNomArticle(), recherche)) {
                articlesTrouves.add(article);
            }
        }

        request.setAttribute("articles", articlesTrouves);

        getServletContext().getRequestDispatcher("/WEB-INF/jsp/liste.jsp").forward(request, response);

    }
}
