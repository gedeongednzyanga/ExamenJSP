<%-- 
    Document   : eleve
    Created on : 17 janv. 2020, 08:37:14
    Author     : GEDEON
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.Database"%>
<%@page import="view.patient"%>
<%@page import="java.util.*"%>
<%@page import="model.DAOPatient"%>
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
           DAOPatient daop = new DAOPatient(); 
           List<patient> data = new ArrayList<>();
       %>
       
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-8 col-sm-6 col-xs-12"> 
                                    <h2><span class="fa fa-male"></span> Clients/Malades</h2>  
                                </div>
                                <div class="col-md-2 col-sm-3 col-xs-6">
                                    <button class="btn btn-primary btn-md" onclick="document.getElementById('modal-wrapperr').style.display='block'"><i class="fa fa-plus-circle"></i> Nouveau Patient</button> 
                                </div> 
                                <form action="report.jsp" method="POST" class="col-md-2 col-sm-3 col-xs-6">
                                   <button type="submit" class="btn btn-info btn-md" style="margin-top: 0"><i class="fa fa-print"></i> Rapport</button>
                               </form>
                            </div>
                             <div class="row">
                                <div class="col-md-12 col-sm-8 col-xs-7">
                                    <div  class="form-inline pull-left">
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                            <input type="search" class="form-control search-input pull-left input-sm" size="30" data-table="customers-list" placeholder="Rechercher...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Patients enregistrés
                                    <span class="pull-right">
                                        <form action="" method="">
                                            <button class="btn btn-primary btn-xs"><i class="fa fa-refresh"></i> Actualiser</button>
                                        </form>
                                    </span>
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover customers-list" id="dataTables-exampl">
                                            <thead>
                                                   <tr>
                                                       <th>Numéro</th>
                                                       <th>Nom, Postnom & Prénom</th>
                                                       <th>Sexe</th>
                                                       <th>Naissance</th>
                                                       <th>Age</th>
                                                       <th>Profession</th>
                                                       <th>Motif</th>
                                                       <th class="text-center">Action</th>
                                                   </tr>
                                               </thead>
                                            <tbody>
                                                <% 
                                                    if(request.getParameter("btnAfficher") != null){
                                                        data = daop.LoadSearchDate(request.getParameter("datearrive"));
                                                    }else if(request.getParameter("btnSearch2") != null){
                                                        data = daop.LoadSearchFiltre(request.getParameter("btnSearchd"));
                                                    }else if (request.getParameter("btnSearch") == null){
                                                        data = daop.Load();
                                                    }
                                                    for(patient p : data){
                                                %>
                                                <tr>
                                                    <td> <%= p.getId() %></td>
                                                    <td> <%= p.getNom()+" "+p.getPostnom()+" "+p.getPrenom() %> </td>  
                                                    <td class="text-center">  <%= p.getSexe()%> </td>
                                                    <td> <%= p.getDatenaiss()%> </td>
                                                    <td> <%= p.getAge()%> </td>
                                                    <td> <%= p.getProfession()%> </td>
                                                    <td> <%= p.getMotif()%> </td>
                                                    <td><a class="btn btn-success btn-xs" href="patientModif.jsp?id=<%= p.getId() %>"><i class="fa fa-edit"></i>Modifier</a></td>
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
            <div id="modal-wrapperr" class="modal">
                <form action="servPatient" method="POST" class="modal-content animate">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('modal-wrapperr').style.display='none'" class="close" title="Fermer">X</span>
                        <h2 style="text-align: left; margin-left: 15px;"><i class="fa fa-male"></i> Identification patient</h2>
                    </div>
                    <hr>
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-md-12">
                                <input class="form-control" type="hidden" name="action" value="1">
                                <input class="form-control" type="hidden" name="id" value="0">
                                <div class="form-group"> <input class="form-control" type="text" placeholder="Nom" name="nom" id=""></div>
                                <div class="form-group"><input class="form-control" type="text" placeholder="Postnom" name="postnom" id=""></div>
                                <div class="form-group"><input class="form-control" type="text" placeholder="Prénom" name="prenom" id=""></div>
                                <div class="form-group">
                                    <select class="form-control" name="sexe" id="">
                                        <option value="M">Sexe</option>
                                        <option value="M">Masculin</option>
                                        <option value="F">Féminin</option>
                                    </select>
                                </div>
                                <div class="form-group"><input class="form-control" type="date" placeholder="" name="datenaiss" id=""></div>
                                <div class="form-group"><input class="form-control" type="text" placeholder="Age" name="age" id=""></div>
                                <div class="form-group"><input class="form-control" type="text" placeholder="Profession" name="profession" id=""></div>
                                <div class="form-group"><textarea class="form-control" name="motif" placeholder="Motif"></textarea></div>
                                <div class="col-md-offset-4 col-md-4">
                                    <button class="btn btn-success btn-block" name="btn" type="submit"><span class="glyphicon glyphicon-ok"></span>  Enregistrer</button>
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
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
   
    <script src="assets/js/custom.js"></script>
    <script>
        (function(document) {
            'use strict';

            var TableFilter = (function(myArray) {
                var search_input;

                function _onInputSearch(e) {
                    search_input = e.target;
                    var tables = document.getElementsByClassName(search_input.getAttribute('data-table'));
                    myArray.forEach.call(tables, function(table) {
                        myArray.forEach.call(table.tBodies, function(tbody) {
                            myArray.forEach.call(tbody.rows, function(row) {
                                var text_content = row.textContent.toLowerCase();
                                var search_val = search_input.value.toLowerCase();
                                row.style.display = text_content.indexOf(search_val) > -1 ? '' : 'none';
                            });
                        });
                    });
                }

                return {
                    init: function() {
                        var inputs = document.getElementsByClassName('search-input');
                        myArray.forEach.call(inputs, function(input) {
                            input.oninput = _onInputSearch;
                        });
                    }
                };
            })(Array.prototype);

            document.addEventListener('readystatechange', function() {
                if (document.readyState === 'complete') {
                    TableFilter.init();
                }
            });

        })(document);
    </script>
    
</body>
</html>
