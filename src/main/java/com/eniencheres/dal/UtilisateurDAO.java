package com.eniencheres.dal;

import com.eniencheres.bo.Utilisateur;

import java.sql.SQLException;

public interface UtilisateurDAO {
    Utilisateur chercherUtilisateur(String email, String pseudo, String mot_de_passe) throws SQLException;

    void nouvelUtilisateur(Utilisateur utilisateur);

    void updateUtilisateur(Utilisateur utilisateur);

    void updateMotDePasse(Utilisateur utilisateur);

    void deleteUtilisateur(Utilisateur utilisateur);
}

