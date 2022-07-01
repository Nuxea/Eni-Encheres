package com.eniencheres.servlet;

import com.eniencheres.dal.jdbc.ArticleVenduDAOJdbcImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AnnulerVente", value = "/AnnulerVente")
public class AnnulerVente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArticleVenduDAOJdbcImpl articleVenduDAO = new ArticleVenduDAOJdbcImpl();

        try {

            articleVenduDAO.annulerVente((Integer) request.getSession(false).getAttribute("idArticle"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(getServletContext().getContextPath() + "/ListeEncheres");
    }
}
