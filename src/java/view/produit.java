
package view;

public class produit {
    
    private int idp;
    private String designation;
    private String categorie;
    private double pvu;
    private int stockAlert;
    private int idcat;
    private double stock;
    private String expiration;
    private String fabrication;
    private int action;

    public produit() {
    }

    public produit(int idp, String designation, String categorie, double pvu, int stockAlert) {
        this.idp = idp;
        this.designation = designation;
        this.categorie = categorie;
        this.pvu = pvu;
        this.stockAlert = stockAlert;
    }

    public produit(String categorie, int idcat) {
        this.categorie = categorie;
        this.idcat = idcat;
    }

    public produit(int idp, String designation, String categorie, double pvu, int stockAlert, double stock, String expiration, String fabrication) {
        this.idp = idp;
        this.designation = designation;
        this.categorie = categorie;
        this.pvu = pvu;
        this.stockAlert = stockAlert;
        this.stock = stock;
        this.expiration = expiration;
        this.fabrication = fabrication;
    }
    

    public int getIdp() {
        return idp;
    }

    public void setIdp(int idp) {
        this.idp = idp;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public double getPvu() {
        return pvu;
    }

    public void setPvu(double pvu) {
        this.pvu = pvu;
    }

    public int getStockAlert() {
        return stockAlert;
    }

    public void setStockAlert(int stockAlert) {
        this.stockAlert = stockAlert;
    }

    public int getIdcat() {
        return idcat;
    }

    public void setIdcat(int idcat) {
        this.idcat = idcat;
    }

    public double getStock() {
        return stock;
    }

    public void setStock(double stock) {
        this.stock = stock;
    }

    public String getExpiration() {
        return expiration;
    }

    public void setExpiration(String expiration) {
        this.expiration = expiration;
    }

    public String getFabrication() {
        return fabrication;
    }

    public void setFabrication(String fabrication) {
        this.fabrication = fabrication;
    }

    public int getAction() {
        return action;
    }

    public void setAction(int action) {
        this.action = action;
    }
    
}
