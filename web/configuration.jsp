<%-- 
    Document   : blank
    Created on : 17 janv. 2020, 08:30:07
    Author     : GEDEON
--%>

<%@page import="view.utilisateur"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.DAOUtilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="pages/header.jsp" />
    </head>
<body>
    <div id="wrapper">
        <jsp:include page="pages/menu.jsp" />
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Configurations</h2>   
                    </div>
                </div>
               <hr />
               <div class="row">
                    <form action="servUtilisateur" method="POST" class="col-md-4">
                        <h3 style="margin-left: 15px; margin-top: 2px">Ajouter un utilisateur</h3>
                        <span><i class="fa fa-user fa-3x"></i> Utilisateur</span>
                        <div class="row">
                            <div class="col-md-12">
                                <input type="hidden" name="action" value="1">
                                <input type="hidden" name="id" value="0">
                                <input type="hidden" name="niveau" value="0">
                                 <div class="form-group">
                                     <div class="input-group">
                                         <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                         <input type="text" class="form-control" name="nomuser" required="on" placeholder="Nom d'utilisateur">
                                     </div>  
                                 </div>
                                <div class="form-group">
                                     <div class="input-group">
                                         <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                         <select class="form-control" name="typecompte" required="on">
                                             <option>Type de compte</option>
                                             <option>Admininstrateur</option>
                                             <option>Receptionniste</option>
                                             <option>Comptable</option>
                                             <option>Laboratin</option>
                                         </select>
                                     </div>  
                                 </div>
                                <div class="form-group">
                                     <div class="input-group">
                                         <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                         <input type="text" class="form-control" name="pass" required="on" placeholder="Mot de passe">
                                     </div>  
                                 </div>

                            </div>
                            <input type="submit" value="Enregistrer" name="btn" class="btn btn-success pull-right" style="margin:0px 15px 5px 0px">
                        </div>
                    </form>
                    <% 
                        DAOUtilisateur dao = new DAOUtilisateur();
                        List<utilisateur> data = new ArrayList<>();
                    %>
                    <div class="col-md-8">
                       <div class="panel panel-default">
                           <div class="panel-heading">
                               <span><i class="fa fa-users"></i> Utilisateurs</span>
                           </div>
                           <div class="panel-body">
                               <div class="user-list">
                                   <div class="table-responsive">
                                   <table class="table table-bordered table-hover">
                                       <thead>
                                           <tr>
                                               <th>N°</th>
                                                <th>Nom d'utilisateur</th>
                                                <th>Mot de passe</th>
                                                <th>Niveau d'accès</th>
                                                <th class="text-center">Action</th>
                                           </tr>
                                       </thead>
                                       
                                       <tbody>
                                           <% 
                                            data = dao.Load();
                                            for(utilisateur u : data){
                                             %>
                                                <tr>
                                                    <td> <%= u.getIdu() %> </td>
                                                    <td> <%= u.getNomUser() %> </td>
                                                    <td> <%= u.getMmotPasse() %> </td>
                                                    <td class="text-center"> <%= u.getNiveauAcces()%> </td>
                                                    <td class="text-center">
                                                        <a href="" class="btn btn-warning btn-xs" style="width: 70px">Modifier</a>
                                                        <a href="" class="btn btn-danger btn-xs" style="width: 70px">Supprimer</a>
                                                    </td>
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
               <div class="row">
                   <div class="col-lg-12">
                       <legend><h3>Donnez l'accès à : Nom d'utilisateur</h3></legend>
                       <div class="col-md-3">
                           <dl>
                               <dt><h4>Reception</h4></dt>
                               <dd>
                                   <div class="panel panel-default">
                                       <ul class="list-unstyled">
                                           <li>
                                               <div class="form-group input-group">
                                                   
                                                   <span class="input-group-addon"><input  type="radio"></span>
                                                   <input type="text" id="disabledInput" class="form-control">
                                               
                                               </div>
                                           </li>
                                           <li>Insertion</li>
                                           <li>Modification</li>
                                           <li>Suppression</li>
                                           <li>Affichage</li>
                                       </ul>
                                   </div>
                               </dd>
                           </dl>
                       </div>
                        <div class="col-md-3">
                           <dl>
                               <dt><h4>Pharmacie</h4></dt>
                               <dd>
                                   <div class="panel panel-default">
                                       <h1>Salut</h1>
                                       
                                   </div>
                               </dd>
                           </dl>
                       </div>
                        <div class="col-md-3">
                           <dl>
                               <dt><h4>Comptabilité</h4></dt>
                               <dd>
                                   <div class="panel panel-default">
                                       <h1>Salut</h1>
                                       
                                   </div>
                               </dd>
                           </dl>
                       </div>
                        <div class="col-md-3">
                           <dl>
                               <dt><h4>Consultation</h4></dt>
                               <dd>
                                   <div class="panel panel-default">
                                       <h1>Salut</h1>
                                       
                                   </div>
                               </dd>
                           </dl>
                       </div>
                   </div>
               </div>
            </div>
        </div>
         
        </div>
   
    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.metisMenu.js"></script>
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
