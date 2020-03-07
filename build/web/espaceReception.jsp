<%-- 
    Document   : index
    Created on : 17 janv. 2020, 08:17:33
    Author     : GEDEON
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="view.patient"%>
<%@page import="java.util.List"%>
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
                        <h2>Reception/Identification Patient</h2>
                        <h5>Welcome Jhon Deo , Love to see you back. </h5>
                    </div>
                </div>              
                <hr />
                <form class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">  
                        <div class="d-md-flex">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="nom" placeholder="Noms" required>
                                </div>
                                <div class="form-group ml-md-4">
                                    <input type="text" class="form-control" name="postnom" placeholder="Postnom" required>
                                </div>
                            </div>
			<div class="panel panel-back noti-box">
                            <input class="form-control" type="hidden" name="action" value="1">
                            <input class="form-control" type="hidden" name="id" value="0">
                            <input class="form-control" type="text" placeholder="Nom" name="nom" id="">
                            <input class="form-control" type="text" placeholder="Postnom" name="postnom" id="">
                            <input class="form-control" type="text" placeholder="Prénom" name="prenom" id="">
                            <select class="form-control" name="sexe" id="">
                                <option value="M">Sexe</option>
                                <option value="M">Masculin</option>
                                <option value="F">Féminin</option>
                            </select>
                            
                        </div>
		    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">           
			<div class="panel panel-back noti-box">
                           
                            <input class="form-control" type="date" placeholder="" name="datenaiss" id="">
                            <input class="form-control" type="text" placeholder="Age" name="age" id="">
                            <input class="form-control" type="text" placeholder="Profession" name="profession" id="">
                            <textarea class="form-control" name="motif" placeholder="Motif"></textarea>
                        </div>
		    </div>
                     <div class="row">
                            <div class="col-md-offset-4 col-md-3 col-xs-6 col-xs-offset-4">
                                <button class="btn btn-success btn-block" name="btn" type="submit">Enregistrer</button>
                            </div>
                        </div>
                </form>
                
                <hr /> 
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Patients enregistrés
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Numéro</th>
                                                <th>Nom, Postnom & Prénom</th>
                                                <th>Sexe</th>
                                                <th>Naissance</th>
                                                <th>Age</th>
                                                 <th>Profession</th>
                                                <th>Motif</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                                data = daop.Load();
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
                                                 <td><a href="" class="btn btn-warning btn-xs">Modifier</a></td>
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
