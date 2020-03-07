
package view;


public class patient {
    
    private int id;
    private String nom;
    private String postnom;
    private String prenom;
    private String sexe;
    private String datenaiss;
    private int age;
    private String profession;
    private String motif;
    private int action;

     public patient() {
    }

    public patient(int id, String nom, String postnom, String prenom, String sexe, String datenaiss, int age, String profession, String motif) {
        this.id = id;
        this.nom = nom;
        this.postnom = postnom;
        this.prenom = prenom;
        this.sexe = sexe;
        this.datenaiss = datenaiss;
        this.age = age;
        this.profession = profession;
        this.motif = motif;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPostnom() {
        return postnom;
    }

    public void setPostnom(String postnom) {
        this.postnom = postnom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getDatenaiss() {
        return datenaiss;
    }

    public void setDatenaiss(String datenaiss) {
        this.datenaiss = datenaiss;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getMotif() {
        return motif;
    }

    public void setMotif(String motif) {
        this.motif = motif;
    }

    public int getAction() {
        return action;
    }

    public void setAction(int action) {
        this.action = action;
    }
    
    
}
