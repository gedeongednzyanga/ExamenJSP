<%-- 
    Document   : tab-panel
    Created on : 17 janv. 2020, 08:41:52
    Author     : GEDEON
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>
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
                
                DAOProduit daop = new DAOProduit ();
                List <produit> data = new ArrayList<>();
            %>
        
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                         <h2>Sortie Médicament | Malade </h2>   
                        </div>
                    </div>
                    <hr />
                                 
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Sortie Médicament
                        </div>
                        <div class="panel-body">
                           <form action="" method="GET">
                                <label>Quantité prise</label>
                                <input type="number" class="form-control">
                                
                            </form><br>
                             <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Médicament</th>
                                            <th>Catégorie</th>
                                            <th>PVU</th>
                                            <th>Stock</th>
                                            <th>Expiration</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            data = daop.Load_Stock();
                                            for (produit p : data){
                                        %>
                                        <tr>
                                            <td> <%= p.getDesignation() %> </td>
                                            <td> <%= p.getCategorie() %> </td>
                                            <td class="text-center"> <%= p.getPvu()+" "+"$" %> </td>
                                            <% 
                                                if (p.getStock() < p.getStockAlert()){ %>
                                                <td class="text-center alert-danger" title="Stock Insufisant"> <%= p.getStock()%> </td>
                                            <%
                                                }else{
                                            %>
                                              <td class="text-center"> <%= p.getStock()%> </td>
                                            <%
                                               }
                                            %>
                                            <td class="text-center"> <%= p.getExpiration()%> </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                   
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <form method="" action="">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Pannier du client :
                                <select name="" class="form-control">
                                    <option value="1">Gédéon Le Grand</option>
                                    <option value="2">Kalamo Béton</option>
                                </select>
                            </div>
                            <div class="panel-body">

                            </div>
                        </div>
                    </form>
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
