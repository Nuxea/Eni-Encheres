package com.eniencheres.dal.jdbc;

import com.eniencheres.bo.ArticleVendu;
import com.eniencheres.bo.Categorie;
import com.eniencheres.bo.NomCategories;
import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.ArticleVenduDAO;


import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

public class ArticleVenduDAOJdbcImpl implements ArticleVenduDAO {

    private static final String INSERT_NOUVELLE_ENCHERE = "insert into ARTICLES_VENDUS(nom_article," +
            "description," +
            "date_debut_encheres," +
            "date_fin_encheres," +
            "prix_initial," +
            "no_utilisateur, " +
            "no_categorie)" +
            "values (?,?,?,?,?,?,?)";
    public static final String AFFICHAGE_DETAILS = "SELECT nom_article, " +
            "description, " +
            "date_fin_encheres, " +
            "prix_initial, " +
//                                "prix_vente, " +
            "no_categorie, " +
            "no_article " +

            "FROM " +
            "ARTICLES_VENDUS WHERE no_article = ?";
    public static final String SELECT_ALL = "select no_article, nom_article, " +
            "prix_initial, description, no_categorie, " +
            "date_fin_encheres" +
            " from articles_vendus";
    public static final String DELETE = "DELETE FROM articles_vendus WHERE no_article = ?";
    public static final String UPDATE = "UPDATE ARTICLES_VENDUS " +
            "SET nom_article = ?, " +
            "prix_initial = ?, " +
            "description = ?, " +
            "date_debut_encheres = ?, " +
            "date_fin_encheres = ? " +
            "WHERE no_article=?";

    public int creerEnchere(ArticleVendu art) throws SQLException {
        ConnectionProvider cp = new ConnectionProvider();
        int idArticle = 0;
        ResultSet clef;
        try (Connection cnx = ConnectionProvider.getConnection()) {
            try {
                PreparedStatement pstmt = cnx.prepareStatement(INSERT_NOUVELLE_ENCHERE, Statement.RETURN_GENERATED_KEYS);
                pstmt.setString(1, art.getNomArticle());
                pstmt.setString(2, art.getDescription());
                pstmt.setTimestamp(3, Timestamp.valueOf(art.getDateDebutEncheres()));

                pstmt.setTimestamp(4, Timestamp.valueOf(art.getDateFinEncheres()));

                pstmt.setInt(5, art.getMiseAPrix());
                pstmt.setInt(6, art.getVendeur().getNo_utilisateur());
                pstmt.setInt(7, art.getCategorieArticle().getNoCategorie());

                int nbLignes = pstmt.executeUpdate();
                if (nbLignes == 1) {
                    clef = pstmt.getGeneratedKeys();
                    clef.next();
                    idArticle = clef.getInt(1);
                }

            } catch (SQLException sqle) {
                throw new SQLException("Erreur lors de l'insertion de l'article", sqle);
            }
        }
        return idArticle;
    }

    public ArticleVendu getDetailsArticle(int idArticle) throws SQLException {
        ArticleVendu article = new ArticleVendu();
        Categorie cat = new Categorie(1, NomCategories.INFORMATIQUE);
        Calendar tzCal = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        ConnectionProvider cp = new ConnectionProvider();

        try (Connection cnx = ConnectionProvider.getConnection()) {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                pstmt = cnx.prepareStatement(
                        AFFICHAGE_DETAILS);

                pstmt.setInt(1, idArticle);

                rs = pstmt.executeQuery();
                while (rs.next()) {
                    article.setNomArticle(rs.getString("nom_article"));
                    article.setDescription(rs.getString("description"));

                    article.setDateFinEncheres(rs.getTimestamp("date_fin_encheres").toInstant().atZone(tzCal.getTimeZone().toZoneId()).toLocalDateTime());

                    article.setMiseAPrix(rs.getInt("prix_initial"));
//                    article.setPrixVente(rs.getInt("prix_vente"));
                    article.setCategorieArticle(cat);
                    article.setNoArticle(rs.getInt("no_article"));

                }
            } catch (SQLException sqle) {
                throw new SQLException("Erreur lors de la récupération de l'article", sqle);
            }
        }
        return article;
    }

    public List<ArticleVendu> getAllArticles() throws SQLException {
        List<ArticleVendu> articles = new ArrayList<>();
        Categorie cat = new Categorie(1, NomCategories.INFORMATIQUE);

        ConnectionProvider cp = new ConnectionProvider();

        try (Connection cnx = ConnectionProvider.getConnection()) {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                pstmt = cnx.prepareStatement(
                        SELECT_ALL);

                rs = pstmt.executeQuery();
                while (rs.next()) {
                    ArticleVendu art = new ArticleVendu();
                    art.setNoArticle(rs.getInt("no_article"));
                    art.setNomArticle(rs.getString("nom_article"));
                    art.setMiseAPrix(rs.getInt("prix_initial"));
                    art.setDescription(rs.getString("description"));
                    art.setCategorieArticle(new Categorie(rs.getInt("no_categorie")));
                    art.setDateFinEncheres(rs.getDate("date_fin_encheres").toLocalDate().atTime(rs.getTime("date_fin_encheres").toLocalTime()));
                    articles.add(art);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return articles;
    }

    public void annulerVente(int idArticle) throws SQLException {
        ConnectionProvider cp = new ConnectionProvider();

        try (Connection cnx = ConnectionProvider.getConnection()) {
            PreparedStatement pstmt = null;
            try {
                pstmt = cnx.prepareStatement(
                        DELETE);

                pstmt.setInt(1, idArticle);
                pstmt.executeUpdate();
            } catch (SQLException sqle) {
                throw new SQLException("Erreur lors de l'annulation de la vente", sqle);
            }
        }
    }

    public int editerEnchere(ArticleVendu articleVendu) throws SQLException {
        ConnectionProvider cp = new ConnectionProvider();

        try (Connection cnx = ConnectionProvider.getConnection()) {
            PreparedStatement pstmt = null;
            try {
                pstmt = cnx.prepareStatement(
                        UPDATE);

                pstmt.setString(1, articleVendu.getNomArticle());
                pstmt.setInt(2, articleVendu.getMiseAPrix());
                pstmt.setString(3, articleVendu.getDescription());
                pstmt.setDate(4, Date.valueOf(articleVendu.getDateDebutEncheres().toLocalDate()));
                pstmt.setDate(5, Date.valueOf(articleVendu.getDateFinEncheres().toLocalDate()));

                pstmt.setInt(6, articleVendu.getNoArticle());

                pstmt.executeUpdate();
            } catch (SQLException sqle) {
                throw new SQLException("Erreur lors de l'édition de la vente", sqle);
            }
        }
        return articleVendu.getNoArticle();
    }

    public Utilisateur getUtilisateurFromIdArticle(int idArticle) throws SQLException {
        ConnectionProvider cp = new ConnectionProvider();

        try (Connection cnx = ConnectionProvider.getConnection()) {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            int idUtilisateur = 0;
            try {
                pstmt = cnx.prepareStatement(
                        "SELECT no_utilisateur FROM articles_vendus WHERE no_article = ?");

                pstmt.setInt(1, idArticle);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    idUtilisateur = (rs.getInt("no_utilisateur"));
                }

                pstmt = cnx.prepareStatement("SELECT * FROM utilisateurs WHERE no_utilisateur = ?");

                pstmt.setInt(1, idUtilisateur);
                rs = pstmt.executeQuery();

                Utilisateur utilisateur = null;
                if (rs.next()) {
                    utilisateur = new Utilisateur();
                    utilisateur.setNo_utilisateur(rs.getInt("no_utilisateur"));
                    utilisateur.setNom(rs.getString("nom"));
                    utilisateur.setPrenom(rs.getString("prenom"));
                    utilisateur.setRue(rs.getString("rue"));
                    utilisateur.setCode_postal(rs.getString("code_postal"));
                    utilisateur.setVille(rs.getString("ville"));
                    utilisateur.setPseudo(rs.getString("pseudo"));
                    utilisateur.setEmail(rs.getString("email"));
                    utilisateur.setTelephone(rs.getString("telephone"));

                }
                return utilisateur;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
