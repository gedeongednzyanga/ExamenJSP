<%-- 
    Document   : eleve
    Created on : 17 janv. 2020, 08:37:14
    Author     : GEDEON
--%>

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

           <jsp:include page="pages/menu.jsp" />

            <%
                DAOConsultation daoc = new DAOConsultation();
                List<consultation> data = new ArrayList<>();
            %>

            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-12 col-lg-12"> 
                                    <h2>Panel Patient consulté</h2>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Liste Patients Consultés
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>N°</th>
                                                    <th>Nom, Postnom & Prénom</th>
                                                    <th>Antécédent</th>
                                                    <th>Taille</th>
                                                    <th>Poids</th>
                                                    <th>Tension</th>
                                                    <th>Température</th>
                                                    <th>Périmètre</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    data = daoc.ChargerConsul();
                                                    for (consultation c : data){
                                                %>
                                                <tr>
                                                    <td> <%= c.getId() %> </td>
                                                    <td> <%= c.getNom()+" "+c.getPostnom()+" "+c.getPrenom() %> </td>
                                                    <td> <%= c.getAntencedant()%> </td>
                                                    <td class="text-center"> <%= c.getTaille()+" m" %> </td>
                                                    <td class="text-center"> <%= c.getPoids()+" kg" %> </td>
                                                    <td class="text-center"> <%= c.getTension()+" bp/s" %> </td>
                                                    <td class="text-center"> <%= c.getTemperature()+" °c" %> </td>
                                                    <td class="text-center"> <%= c.getPerimetre()+" cm" %> </td>

                                                    <td><a class="btn btn-warning btn-xs" href="examen.jsp?id=<%= c.getId() %>">Examen</a></td>
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
