package com.eniencheres.dal;

import com.eniencheres.bo.ArticleVendu;
import com.eniencheres.bo.Utilisateur;

import java.sql.SQLException;
import java.util.List;

public interface ArticleVenduDAO {
    public int creerEnchere(ArticleVendu articleVendu) throws SQLException;

    public ArticleVendu getDetailsArticle(int noArticle) throws SQLException;

    public  List<ArticleVendu> getAllArticles() throws SQLException;

    public  void annulerVente(int idArticle) throws SQLException;

    public  int editerEnchere(ArticleVendu articleVendu) throws SQLException;

    public Utilisateur getUtilisateurFromIdArticle(int idArticle) throws SQLException;


}
