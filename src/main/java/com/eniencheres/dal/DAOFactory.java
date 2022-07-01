package com.eniencheres.dal;

import com.eniencheres.dal.jdbc.ArticleVenduDAOJdbcImpl;

public abstract class DAOFactory {

    public static ArticleVenduDAO getArticleVenduDAO() {
        return new ArticleVenduDAOJdbcImpl();
    }
}
