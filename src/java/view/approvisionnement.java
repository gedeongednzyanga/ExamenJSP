
package view;

public class approvisionnement extends produit {
    private int id;
    private int quantite;
    private int fournisseur;
    private String dateapprov;
    private String Nomfourni;
    private double pua;

    public approvisionnement() {
    }

    public approvisionnement(int id,String produit, int quantite, String dateapprov, String Nomfourni, double pua,
            String expiration, String fabrication, String categorie) {
        this.id = id;
        this.quantite = quantite;
        this.dateapprov = dateapprov;
        this.Nomfourni = Nomfourni;
        this.pua = pua;
        this.setExpiration(expiration);
        this.setFabrication(fabrication);
        this.setCategorie(categorie);
        this.setDesignation(produit);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public int getFournisseur() {
        return fournisseur;
    }

    public void setFournisseur(int fournisseur) {
        this.fournisseur = fournisseur;
    }

    public String getDateapprov() {
        return dateapprov;
    }

    public void setDateapprov(String dateapprov) {
        this.dateapprov = dateapprov;
    }

    public String getNomfourni() {
        return Nomfourni;
    }

    public void setNomfourni(String Nomfourni) {
        this.Nomfourni = Nomfourni;
    }

    public double getPua() {
        return pua;
    }

    public void setPua(double pua) {
        this.pua = pua;
    }
    
}
