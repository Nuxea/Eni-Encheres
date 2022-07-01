package com.eniencheres.dal.jdbc;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionProvider {
    private static final String POOL_CONNEXION_NAME = "jdbc/poolEnchereDB";
    private static final String RACINE = "java:comp/env/";

    private static DataSource dataSource;

    public static Connection getConnection() throws SQLException {
        Connection cnx = null;

        if (dataSource == null){
            Context annuaire = null;
            try {
                annuaire = new InitialContext();
                dataSource = (DataSource) annuaire.lookup(RACINE+POOL_CONNEXION_NAME);
            } catch (NamingException ne){
                ne.printStackTrace();
                System.err.println("Impossible de trouver le pool de connexions.");
            }
        }

        try {
            cnx = dataSource.getConnection();
        } catch (NullPointerException | SQLException e) {
            e.printStackTrace();
            System.err.println("Impossible d'obtenir la connexion");
            throw e;
        }
        return cnx;
    }
}
