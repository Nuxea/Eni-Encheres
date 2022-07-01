package com.eniencheres.dal.jdbc;

import com.eniencheres.bo.Utilisateur;
import com.eniencheres.dal.UtilisateurDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UtilisateurDAOJdbcImpl implements UtilisateurDAO {

    Utilisateur utilisateur;

    private void getResultSet(ResultSet resultSet) throws SQLException {
        utilisateur = new Utilisateur(
                resultSet.getInt("no_utilisateur"),
                resultSet.getString("pseudo"),
                resultSet.getString("nom"),
                resultSet.getString("prenom"),
                resultSet.getString("email"),
                resultSet.getString("telephone"),
                resultSet.getString("rue"),
                resultSet.getString("code_postal"),
                resultSet.getString("ville"),
                resultSet.getString("mot_de_passe"),
                resultSet.getInt("credit"),
                resultSet.getBoolean("administrateur")
        );
    }

    private void getPreparedStatement(Utilisateur utilisateur, PreparedStatement preparedStatement) throws SQLException {
        preparedStatement.setString(1, utilisateur.getPseudo());
        preparedStatement.setString(2, utilisateur.getNom());
        preparedStatement.setString(3, utilisateur.getPrenom());
        preparedStatement.setString(4, utilisateur.getEmail());
        preparedStatement.setString(5, utilisateur.getTelephone());
        preparedStatement.setString(6, utilisateur.getRue());
        preparedStatement.setString(7, utilisateur.getCode_postal());
        preparedStatement.setString(8, utilisateur.getVille());
        preparedStatement.setInt(9, utilisateur.getNo_utilisateur());

        preparedStatement.executeUpdate();
    }

    @Override
    public Utilisateur chercherUtilisateur(String email, String pseudo, String mot_de_passe) throws SQLException {
        try (Connection cnx = ConnectionProvider.getConnection()) {
            PreparedStatement statement = cnx.prepareStatement("SELECT * FROM UTILISATEURS WHERE email=? OR pseudo=? AND mot_de_passe=?");
            statement.setString(1, email);
            statement.setString(2, pseudo);
            statement.setString(3, mot_de_passe);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                getResultSet(resultSet);
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return utilisateur;
    }

    @Override
    public void nouvelUtilisateur(Utilisateur utilisateur) {

        try (Connection cnx = ConnectionProvider.getConnection()) {
            try {
                cnx.setAutoCommit(false);

                PreparedStatement statement = cnx.prepareStatement("INSERT INTO UTILISATEURS(pseudo, nom, prenom, email, telephone, rue, code_postal, ville, mot_de_passe, credit, administrateur) values(?,?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
                getPreparedStatement(utilisateur, statement);

                ResultSet resultSet = statement.getGeneratedKeys();

                if (resultSet.next()){
                    utilisateur.setNo_utilisateur(resultSet.getInt(1));
                }

                resultSet.close();
                statement.close();

                cnx.commit();
            } catch (Exception e){
                e.printStackTrace();
                cnx.rollback();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateUtilisateur(Utilisateur utilisateur) {
        try (Connection cnx = ConnectionProvider.getConnection()) {
            try {
                cnx.setAutoCommit(false);

                PreparedStatement preparedStatement = cnx.prepareStatement("UPDATE UTILISATEURS SET pseudo=?, nom=?, prenom=?, email=?, telephone=?, rue=?, code_postal=?, ville=? WHERE no_utilisateur=?");
                getPreparedStatement(utilisateur, preparedStatement);

                preparedStatement.close();
                cnx.commit();
            }catch (Exception e){
                e.printStackTrace();
                cnx.rollback();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateMotDePasse(Utilisateur utilisateur) {
        try (Connection cnx = ConnectionProvider.getConnection()) {
            try {
                cnx.setAutoCommit(false);

                PreparedStatement preparedStatement = cnx.prepareStatement("UPDATE UTILISATEURS SET mot_de_passe=? WHERE no_utilisateur=?");
                preparedStatement.setString(1, utilisateur.getMot_de_passe());
                preparedStatement.setInt(2, utilisateur.getNo_utilisateur());

                preparedStatement.executeUpdate();

                preparedStatement.close();
                cnx.commit();
            }catch (Exception e){
                e.printStackTrace();
                cnx.rollback();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

//    @Override
//    public void recuperationMotDePasse(Utilisateur utilisateur) {
//        try (Connection cnx = ConnectionProvider.getConnection()) {
//            PreparedStatement statement = cnx.prepareStatement("SELECT * FROM UTILISATEURS WHERE mot_de_passe=? AND no_utilisateur=?");
//            statement.setString(1, utilisateur.getMot_de_passe());
//            statement.setInt(2, utilisateur.getNo_utilisateur());
//
//            ResultSet resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                getResultSet(resultSet);
//            }
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//    }


}
