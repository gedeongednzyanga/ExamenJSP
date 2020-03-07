<%-- 
    Document   : tab-panel
    Created on : 17 janv. 2020, 08:41:52
    Author     : GEDEON
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="view.consultation"%>
<%@page import="model.DAOConsultation"%>
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
                DAOConsultation daoc = new DAOConsultation ();
                List <consultation> data = new ArrayList<>();
            %>
        
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-10">
                         <h2>Panel Consultation </h2>   
                            <h5>Bienvenue Gédéon Géd , Love to see you back. </h5>
                        </div>
                        <div class="col-md-2">
                         <h2><button class="btn btn-primary btn-xl" onclick="document.getElementById('modal-wrapperr').style.display='block'">Nouveau</button> </h2>   
                        </div>
                    </div>
                    <hr />
                                 
            <div class="row">
                <% 
                    data = daoc.Load();
                    for (consultation c : data ){
                %>
                <div class="col-md-4 col-sm-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <%= c.getNom()+" "+c.getPostnom()+" "+c.getPrenom()+" ("+c.getSexe()+")" %>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="colonne">
                                    <ul>
                                        <li>Taille : <%= c.getTaille()+" m" %> </li>
                                        <li>Poids  : <%= c.getPoids()+" kg"%> </li>
                                        <li>Périm. : <%= c.getPerimetre()+" cm"%> </li>
                                    </ul>
                                </div>
                                <div class="colonne">
                                    <ul>
                                        <li>Tension: <%= c.getTension()+" bp"%> </li>
                                        <li>Tempér.: <%= c.getTemperature()+" °c"%></li>
                                        <li>Antéc. : <%= c.getAntencedant()%></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <a class="btn btn-success btn-xs" href="modifConsultation?id=<%= c.getId() %>">Modifier</a>
                        </div>
                    </div>
                </div>
                <% 
                    }
                %>
            </div>
        </div>
    </div>
        
            <div id="modal-wrapperr" class="modal">
                <form action="servConsultation" method="POST" class="modal-content animate">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('modal-wrapperr').style.display='none'" class="close" title="Fermer">X</span>
                        <h2 style="text-align: left; margin-left: 15px;"><i class="fa fa-pencil"></i> Consultation patient</h2>
                    </div>
                    <hr>
                    <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-md-12">
                             <input class="form-control" type="hidden" name="action" value="1">
                              <input class="form-control" type="hidden" name="id" value="0">
                              <div class="form-group">
                                  <input class="form-control" type="text" placeholder="Num fiche patient" name="numfiche" id="">
                              </div>
                              <div class="form-group">
                                  <input class="form-control" type="text" placeholder="Nom, Postnom, Prénom" name="nom" id="">
                              </div>
                              <div class="form-group">
                                    <select class="form-control" name="antecedent" id="">
                                        <option value="M">Cat. antécédent</option>
                                        <option value="M">Masculin</option>
                                        <option value="F">Féminin</option>
                                    </select>
                              </div>
                              <div class="form-group">
                                  <input class="form-control" type="text" placeholder="Taille du patient" name="taille" id="">
                              </div>
                              <div class="form-group">
                                  <input class="form-control" type="text" placeholder="Poids du patient" name="poids" id="">
                              </div>
                              <div class="form-group">
                                   <input class="form-control" type="text" placeholder="Tension arttérielle" name="tension" id="">
                              </div>
                              <div class="form-group">
                                  <input class="form-control" type="text" placeholder="Temperature" name="temperature" id="">
                              </div>
                              <div class="form-group">
                                  <input class="form-control" type="text" placeholder="Perimetre du patient" name="perimetre" id="">
                              </div>
                              <div class="form-group">
                                  <textarea class="form-control" name="symptome" placeholder="Symptômes"></textarea>
                              </div>
                            <button class="btn btn-success" name="btn" type="submit">Enregistrer</button>
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
