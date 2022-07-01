package com.eniencheres.bo;

public class Categorie {
    private int noCategorie;
    private NomCategories libelle;

    public Categorie(int noCategorie, NomCategories libelle) {
        this.noCategorie = noCategorie;
        this.libelle = libelle;
    }

    public Categorie(int noCategorie){
        this.noCategorie = noCategorie;
        this.libelle = (getCategorieLibelleFromNo(noCategorie));
    }

    public int getNoCategorie() {
        return noCategorie;
    }

    public void setNoCategorie(int noCategorie) {
        this.noCategorie = noCategorie;
    }

    public NomCategories getLibelle() {
        return libelle;
    }

    public void setLibelle(NomCategories libelle) {
        this.libelle = libelle;
    }

    public static Categorie getCategorieFromSelect(String name){
        switch (name){
            case "INFORMATIQUE" :
                    return new Categorie(1, NomCategories.INFORMATIQUE);
            case "AMEUBLEMENT":
                return new Categorie(2, NomCategories.AMEUBLEMENT);
            case "VETEMENT" :
                return new Categorie(3, NomCategories.VETEMENT);
            case "SPORT_ET_LOISIRS" :
                return  new Categorie(4, NomCategories.SPORT_ET_LOISIRS);
            default:
                return  null;
        }
    }

    private NomCategories getCategorieLibelleFromNo(int noCategorie){
        switch (noCategorie){
            case 1:
                return NomCategories.INFORMATIQUE;
            case 2:
                return NomCategories.AMEUBLEMENT;
            case 3:
                return NomCategories.VETEMENT;
            case 4:
                return NomCategories.SPORT_ET_LOISIRS;
            default:
                return null;

        }
    }
}
