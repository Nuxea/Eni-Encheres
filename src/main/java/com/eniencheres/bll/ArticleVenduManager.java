package com.eniencheres.bll;

import com.eniencheres.dal.ArticleVenduDAO;
import com.eniencheres.dal.DAOFactory;

public class ArticleVenduManager {
    private ArticleVenduDAO articleVenduDAO;

    public ArticleVenduManager() {
        articleVenduDAO = DAOFactory.getArticleVenduDAO();
    }


}
