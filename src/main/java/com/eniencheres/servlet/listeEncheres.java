package com.eniencheres.servlet;

import com.eniencheres.bo.ArticleVendu;
import com.eniencheres.dal.jdbc.ArticleVenduDAOJdbcImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//@WebServlet(name = "ListeEncheres", value = "/ListeEncheres")
public class listeEncheres extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArticleVenduDAOJdbcImpl articleVenduDAO = new ArticleVenduDAOJdbcImpl();

        HttpSession session = request.getSession();
        session.setAttribute("user", "user");

        List<ArticleVendu> articles = new ArrayList<>();
        try {
            articles = articleVenduDAO.getAllArticles();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("articles", articles);

        getServletContext().getRequestDispatcher("/WEB-INF/jsp/liste.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
