
package view;


public class fournisseur extends personne {
    private int idf;
    private String fourni;

    public fournisseur(int idf, String fournisseur) {
        this.idf = idf;
        this.fourni = fournisseur;
    }

    
    public int getIdf() {
        return idf;
    }

    public void setIdf(int idf) {
        this.idf = idf;
    }

    public String getFourni() {
        return fourni;
    }

    public void setFourni(String fourni) {
        this.fourni = fourni;
    }
    
}
