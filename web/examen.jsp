<%-- 
    Document   : eleve
    Created on : 17 janv. 2020, 08:37:14
    Author     : GEDEON
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Database"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="view.consultation"%>
<%@page import="model.DAOConsultation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <jsp:include page="pages/header.jsp" /> 
        
    </head>
    <body>
        <div id="wrapper">
            
            <% 
                int id = Integer.parseInt(request.getParameter("id"));
                Database bdd = new Database();
                Connection conn;
                PreparedStatement ps;
                ResultSet rs;
                String patient ="", antencedent="", symptome="";
                String requete = "SELECT * FROM `get_patient_consulte` WHERE idc ="+id+"";
                try{
                    conn = bdd.dbConnect();
                    ps = conn.prepareStatement(requete);
                    rs = ps.executeQuery();
                    while (rs.next()){
                        patient = rs.getString("nomp")+" "+rs.getString("postnomp")+" "+rs.getString("prenomp");
                        antencedent = rs.getString("antecedent");
                        symptome = rs.getString("symptome");
                    }
                    conn.close();
                }catch(Exception e){
                    e.getMessage();
                }
            %>
           <jsp:include page="pages/menu.jsp" />

            <div id="page-wrapper" >
                <div id="page-inner">
                     <div id="modal-wrapper" class="modale">
                        <form action="servExamen" method="POST" class="modal-content animate">
                            <div class="imgcontainer">
                                <a href="laboConsulte.jsp" onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Fermer">X</a>
                                <h2 style="text-align: left; margin-left: 15px;"><i class="fa fa-pencil"></i> Examen patient</h2>
                            </div>
                            <hr>
                            <div class="container-fluid">
                                <div class="row mb-2">
                                    <div class="col-md-12"> 
                                        <input class="form-control" type="hidden" name="action" value="1">
                                        <input class="form-control" type="hidden" name="consult" value="<%= id %>">
                                        <input class="form-control" type="hidden" name="id" value="0">
                                        <input class="form-control" type="text" placeholder="Patient" value="<%= patient %>" name="nom" id="">
                                        <input class="form-control" type="text" placeholder="Antécédent" value="<%= antencedent %>" name="postnom" id="">
                                        <input class="form-control" type="text" placeholder="Symptômes" value="<%= symptome %>" name="prenom" id="">
                                        <select class="form-control" name="examen" id="">
                                            <option value="Radiographie">Radiographie</option>
                                            <option value="Amniocentèse">Amniocentèse</option>
                                            <option value="Angiographie pulmonaire">Angiographie pul.</option>
                                            <option value="Antibiogramme">Antibiogramme</option>
                                            <option value="Artériographie">Artériographie</option>
                                            <option value="Audiométrie">Audiométrie</option>
                                            <option value="Biospie">Biospie</option>
                                        </select>
                                        <textarea class="form-control" name="resultat" placeholder="Résultats de l'examen"></textarea>
                                        <button class="btn btn-success" name="btn" type="submit">Enregistrer</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.metisMenu.js"></script>
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').dataTable();
                });
        </script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>

