
package view;

/**
 *
 * @author GEDEON
 */
public class utilisateur {
    private String nomUser;
    private String typeCompte;
    private String mmotPasse;
    private int niveauAcces;
    private String imgUser;
    private String pathImage;
    private int action;
    private int idu;

    public utilisateur() {
    }

    public utilisateur(String nomUser, String typeCompte, String mmotPasse, int niveauAcces, int idu) {
        this.nomUser = nomUser;
        this.typeCompte = typeCompte;
        this.mmotPasse = mmotPasse;
        this.niveauAcces = niveauAcces;
        this.idu = idu;
    }

    

    public String getNomUser() {
        return nomUser;
    }

    public void setNomUser(String nomUser) {
        this.nomUser = nomUser;
    }

    public String getTypeCompte() {
        return typeCompte;
    }

    public void setTypeCompte(String typeCompte) {
        this.typeCompte = typeCompte;
    }

    public String getMmotPasse() {
        return mmotPasse;
    }

    public void setMmotPasse(String mmotPasse) {
        this.mmotPasse = mmotPasse;
    }

    public int getNiveauAcces() {
        return niveauAcces;
    }

    public void setNiveauAcces(int niveauAcces) {
        this.niveauAcces = niveauAcces;
    }

    public String getImgUser() {
        return imgUser;
    }

    public void setImgUser(String imgUser) {
        this.imgUser = imgUser;
    }

    public String getPathImage() {
        return pathImage;
    }

    public void setPathImage(String pathImage) {
        this.pathImage = pathImage;
    }

    public int getAction() {
        return action;
    }

    public void setAction(int action) {
        this.action = action;
    }

    public int getIdu() {
        return idu;
    }

    public void setIdu(int idu) {
        this.idu = idu;
    }
}
