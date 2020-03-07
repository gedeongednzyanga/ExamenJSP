
package view;

public class consultation extends patient {
    
    private int numFiche;
    private String antencedant;
    private double taille;
    private double poids;
    private double tension;
    private double temperature;
    private double perimetre;
    private int actionu;
    private String symptome;
    
    
    public consultation() {
    }

    public consultation(int numFiche, String antencedant, double taille, double poids, double tension, double temperature, 
            double perimetre, String symptome, int id, String nom, String postnom, String prenom, String sexe, String 
                    datenaiss, int age, String profession, String motif) {
        super(id, nom, postnom, prenom, sexe, datenaiss, age, profession, motif);
        this.numFiche = numFiche;
        this.antencedant = antencedant;
        this.taille = taille;
        this.poids = poids;
        this.tension = tension;
        this.temperature = temperature;
        this.perimetre = perimetre;
        this.symptome = symptome;
        
    }

    public int getNumFiche() {
        return numFiche;
    }

    public void setNumFiche(int numFiche) {
        this.numFiche = numFiche;
    }

    public String getAntencedant() {
        return antencedant;
    }

    public void setAntencedant(String antencedant) {
        this.antencedant = antencedant;
    }

    public double getTaille() {
        return taille;
    }

    public void setTaille(double taille) {
        this.taille = taille;
    }

    public double getPoids() {
        return poids;
    }

    public void setPoids(double poids) {
        this.poids = poids;
    }

    public double getTension() {
        return tension;
    }

    public void setTension(double tension) {
        this.tension = tension;
    }

    public double getTemperature() {
        return temperature;
    }

    public void setTemperature(double temperature) {
        this.temperature = temperature;
    }

    public double getPerimetre() {
        return perimetre;
    }

    public void setPerimetre(double perimetre) {
        this.perimetre = perimetre;
    }

    public int getActionu() {
        return actionu;
    }

    public void setActionu(int actionu) {
        this.actionu = actionu;
    }

    public String getSymptome() {
        return symptome;
    }

    public void setSymptome(String symptome) {
        this.symptome = symptome;
    }

    
}
