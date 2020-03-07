<%-- 
    Document   : medicamentModif
    Created on : 3 févr. 2020, 21:27:30
    Author     : GEDEON
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Database"%>
<%@page import="view.produit"%>
<%@page import="model.DAOCategorie"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="view.consultation"%>
<%@page import="model.DAOProduit"%>
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
                String id = request.getParameter("id");
                DAOCategorie datacat = new DAOCategorie();
                List <produit> datac = new ArrayList<>();
            %>
        
            <div id="page-wrapper" >
                <div id="page-inner">

            <div id="modal-wrapperr" class="modale">
                <form action="servProduit" method="POST" class="modal-content animate">
                    <div class="imgcontainer">
                        <a href="medicament.jsp" onclick="document.getElementById('modal-wrapperr').style.display='none'" class="close" title="Fermer">X</a>
                        <h2 style="text-align: left; margin-left: 15px;"><i class="fa fa-edit"></i> Modifier</h2>
                    </div>
                    <hr>
                    <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-md-12">
                            <input class="form-control" type="hidden" name="action" value="2">
                            <input class="form-control" type="hidden" name="id" value="<%= id %>">
                            <%
                                String requete = "SELECT * FROM get_article WHERE codep ='"+id+"'";
                                try{
                                    ps = conn.prepareStatement(requete);
                                    rs = ps.executeQuery();
                                    while (rs.next()){ %>
                                        <div class="form-group"><input class="form-control" value="<%= rs.getString("designprod") %>" type="text" placeholder="Désignation" name="produit" id=""></div>
                                        <div class="form-group"><input class="form-control" value="<%= rs.getString("pus") %>" type="number" placeholder="Prix unitaire" name="pvu" id=""></div>
                                        <div class="form-group"><input class="form-control" value="<%= rs.getString("stockAlerte") %>" type="number" placeholder="Stock alert" name="alert" id=""></div>
                                    <%
                                    }
                                    conn.close();
                                }catch(SQLException e){
                                    
                                }   
                            %>  
                            <select class="form-control" name="catego" id="">
                                <%
                                    datac = datacat.Load();
                                    for(produit cat : datac){
                                %>
                                <option value="<%= cat.getIdcat()%>"><%= cat.getCategorie() %></option>
                                <%
                                    }
                                %>
                            </select>
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
   
        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.metisMenu.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
