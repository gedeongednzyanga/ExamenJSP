<%-- 
    Document   : patientModif
    Created on : 10 févr. 2020, 10:26:55
    Author     : GEDEON
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="pages/header.jsp" />
        <link href="myStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="pages/menu.jsp" />
        
            <%
                Database db = new Database();
                PreparedStatement ps;
                ResultSet rs;
                Connection conn;
                conn = db.dbConnect();
                String idp = request.getParameter("id");
               
            %>
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div id="modal-wrapperr" class="modale">
                        <form action="servPatient" method="POST" class="modal-content animate">
                            <div class="imgcontainer">
                                <a href="identificationp.jsp" onclick="document.getElementById('modal-wrapperr').style.display='none'" class="close" title="Fermer">X</a>
                                <h2 style="text-align: left; margin-left: 15px;"><i class="fa fa-pencil"></i> Modifier</h2>
                            </div>
                            <hr>
                            <div class="container-fluid">
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <input class="form-control" type="hidden" name="action" value="2">
                                        <%
                                            String requete = "SELECT * from tbl_patient WHERE idp ='"+ idp +"'";
                                            try{
                                                ps = conn.prepareStatement(requete);
                                                rs = ps.executeQuery();
                                                while (rs.next()){ %>
                                                    <input class="form-control" type="hidden" name="id" value="<%= idp %>">
                                                    <input class="form-control" value="<%= rs.getString("nomp") %>" type="text" placeholder="Nom" name="nom" id="">
                                                    <input class="form-control" value="<%= rs.getString("postnomp") %>" type="text" placeholder="Postnom" name="postnom" id="">
                                                    <input class="form-control" value="<%= rs.getString("prenomp") %>" type="text" placeholder="Prénom" name="prenom" id="">
                                                    <select class="form-control" name="sexe" id="">
                                                        <option value="M">Sexe</option>
                                                        <option value="M">Masculin</option>
                                                        <option value="F">Féminin</option>
                                                    </select>
                                                    <input class="form-control" value="<%= rs.getString("naissancep") %>" type="date" placeholder="" name="datenaiss" id="">
                                                    <input class="form-control" value="<%= rs.getString("agep") %>" type="text" placeholder="Age" name="age" id="">
                                                    <input class="form-control" value="<%= rs.getString("professionp") %>" type="text" placeholder="Profession" name="profession" id="">
                                                    <textarea class="form-control" name="motif" placeholder="Motif"><%= rs.getString("motifp") %></textarea>
                                                <%
                                                }
                                                conn.close();
                                            }catch(SQLException e){

                                            }   
                                        %>  
                                        <div class="row">
                                            <div class="col-lg-offset-4 col-lg-4">
                                                <button class="btn btn-success btn-block" name="btn" type="submit">Enregistrer</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
           
    
        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.metisMenu.js"></script>
        <script src="assets/js/custom.js"></script>
    
    </body>
</html>
