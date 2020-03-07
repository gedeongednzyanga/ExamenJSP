
package view;

/**
 *
 * @author GEDEON
 */
public class sortie {
    private int idsort;
    private int idclient;
    private int idart;
    private int actionu;
    private String patient;
    private String datavente;
    
    private int idd;
    private float pvu;
    private int qtev;
    
    private String produit;
    private float ptv;

    public int getIdsort() {
        return idsort;
    }

    public sortie() {
    }

    public sortie(int idsort, int idclient, String patient, String datavente) {
        this.idsort = idsort;
        this.idclient = idclient;
        this.patient = patient;
        this.datavente = datavente;
    }

    public sortie(int idsort, int idart, int idd, float pvu, int qtev, String produit, float ptv) {
        this.idsort = idsort;
        this.idart = idart;
        this.idd = idd;
        this.pvu = pvu;
        this.qtev = qtev;
        this.produit = produit;
        this.ptv = ptv;
    }

    public void setIdsort(int idsort) {
        this.idsort = idsort;
    }

    public int getIdclient() {
        return idclient;
    }

    public void setIdclient(int idclient) {
        this.idclient = idclient;
    }

    public int getIdart() {
        return idart;
    }

    public void setIdart(int idart) {
        this.idart = idart;
    }

    public int getActionu() {
        return actionu;
    }

    public void setActionu(int actionu) {
        this.actionu = actionu;
    }

    public String getPatient() {
        return patient;
    }

    public void setPatient(String patient) {
        this.patient = patient;
    }

    public int getIdd() {
        return idd;
    }

    public void setIdd(int idd) {
        this.idd = idd;
    }

    public float getPvu() {
        return pvu;
    }

    public void setPvu(float pvu) {
        this.pvu = pvu;
    }

    public int getQtev() {
        return qtev;
    }

    public void setQtev(int qtev) {
        this.qtev = qtev;
    }

    public float getPtv() {
        return ptv;
    }

    public void setPtv(float ptv) {
        this.ptv = ptv;
    }

    public String getProduit() {
        return produit;
    }

    public void setProduit(String produit) {
        this.produit = produit;
    }

    public String getDatavente() {
        return datavente;
    }

    public void setDatavente(String datavente) {
        this.datavente = datavente;
    }
}
