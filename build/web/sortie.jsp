<%-- 
    Document   : tab-panel
    Created on : 17 janv. 2020, 08:41:52
    Author     : GEDEON
--%>

<%@page import="view.sortie"%>
<%@page import="model.DAOVente"%>
<%@page import="view.patient"%>
<%@page import="model.DAOPatient"%>
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
                DAOProduit daop = new DAOProduit ();
                List <produit> data = new ArrayList<>();
                
                DAOPatient daopat = new DAOPatient ();
                List <patient> datapat = new ArrayList<>();
                
                DAOVente daoS = new DAOVente ();
                List <sortie> dataS = new ArrayList<>();

                int idvente= 0;
                int compteur = 0;
                String patient="";
                String datefac = "";
                double totatfact = 0;
                
            %>
        
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-6">
                            <h2><span class="glyphicon glyphicon-send"></span> Sortie Stock </h2>   
                        </div>
                    </div>
                    <hr />           
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Sortie Médicament
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4 panel">
                                        <form action="servVente" method="POST" id="serch">
                                            <label>Client/Malade</label>
                                            <input type="hidden" value="1" name="action">
                                            <input type="hidden" value="0" name="idvente">
                                            <input type="hidden" value="0" name="produit">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                    <select class="form-control" name="patient">
                                                        <option value="1">Patient</option>
                                                        <%
                                                            datapat = daopat.Load();
                                                            for (patient pat : datapat){   
                                                        %>
                                                        <option value="<%= pat.getId()%>"><%= pat.getNom()+" "+pat.getPostnom()+" "+pat.getPrenom() %></option>
                                                        <%
                                                            
                                                           }
                                                        %>
                                                    </select>
                                                </div>
                                                    <button type="submit" name="btn" style="padding-top: 3px" class="btn btn-info input-sm"><i class="glyphicon glyphicon-book"></i> Créer facture</button>
                                            </div> 
                                            
                                        </form>
                                        <form action="servVente" method="POST">
                                            <label>Produit</label>
                                            <input type="hidden" value="1" name="action">
                                            <input type="hidden" value="0" name="iddetal">
                                            <div class="form-group input-group">
                                                <span class="input-group-addon"><i class="fa fa-money"></i></span>
                                                <select class="form-control" name="produit">
                                                    <option value="1">Produit</option>
                                                    <%
                                                        data = daop.Load();
                                                        for (produit p : data){   
                                                    %>
                                                    <option value="<%= p.getIdp() %>"><%= p.getDesignation() %></option>
                                                    <%
                                                      
                                                       }
                                                    %>
                                                </select>
                                                
                                            </div>
                                            <label>Prix unitaire</label>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                                <select class="form-control" name="pvu">
                                                    <option value="1">Prix</option>
                                                    <%
                                                        data = daop.Load();
                                                        for (produit p : data){   
                                                    %>
                                                    <option value="<%= p.getPvu() %>"><%= p.getDesignation()+" : "+p.getPvu()+"$" %></option>
                                                    
                                                    <%
                                                       
                                                       }
                                                    %>
                                                </select>
                                            </div>
                                            <label>Quantité</label>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon"></span>
                                                <input type="text" autocomplete="off" required="" class="form-control" name="quantite" placeholder="Quantité">
                                            </div>
                                            
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-success" name="btnD"><i class="glyphicon glyphicon-save"></i> Ajouter</button>
                                                <button type="submit" class="btn btn-warning" name="btnfin"><i class="glyphicon glyphicon-ok"></i> Términer</button>
                                            </div>
                                        </div>
                                    <div class="col-md-8 panel">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <strong style="font-size: 13px">Panier de :</strong>
                                            </div>
                                            <div class="col-md-5">
                                                <%
                                                    dataS = daoS.Load();
                                                    for (sortie s : dataS){   
                                                %>
                                                    <h5 style="margin-top: 0"><strong><i class="fa fa-user"></i> <%= s.getPatient() %></strong></h5>
                                                    <input type="hidden" name="idvente" value="<%= s.getIdsort()%>" >
                                                <%
                                                   idvente = s.getIdsort();
                                                   patient = s.getPatient();
                                                   datefac =s.getDatavente();
                                                   }
                                                %>  
                                            </div>
                                            </form>
                                            <div class="col-md-5">
                                                <h5 style="margin-top: 0">Nombre de produit : <span class="badge">10</span>
                                                    <span><button class="btn btn-info btn-xs" onclick="document.getElementById('modal-wrapperr').style.display='block'">Facture</button></span>
                                                </h5>

                                            </div>
                                        </div>
                                        <hr style="margin-top: 2px" />
                                        <div class="row">
                                            <div class="table-responsive col-md-12">
                                                <table class="table table-bordered table-borderless">
                                                    <thead>
                                                        <tr>
                                                            <th>Numéro</th>
                                                            <th>Désignation</th>
                                                            <th>Quantité</th>
                                                            <th>Prix U.</th>
                                                            <th>Prix T.</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
                                                        
                                                        dataS = daoS.LoadF(idvente);
                                                        for (sortie s : dataS){ 
                                                         compteur ++;
                                                    %>
                                                        <tr>
                                                            <td><%= compteur %></td>
                                                             <td><%= s.getProduit()%></td>
                                                             <td><%= s.getQtev() %></td>
                                                             <td><%= s.getPvu()%></td>
                                                             <td><%= s.getPtv() %></td>
                                                            <form action="servVente" method="POST">
                                                                <input type="hidden" name="action" value="3">
                                                                <input type="hidden" name="produit" value="<%= s.getIdart() %>">
                                                                <input type="hidden" name="iddetal" value="<%= s.getIdd() %>">
                                                                <input type="hidden" name="pvu" value="<%= s.getPvu() %>">
                                                                <input type="hidden" name="quantite" value="<%= s.getQtev() %>">
                                                                <input type="hidden" name="idvente" value="<%= s.getIdsort() %>">
                                                                <td><button type="submit" name="btnD" class="btn btn-danger btn-xs">Supprimer</button></td>
                                                            </form>
                                                        </tr>
                                                    <%
                                                         totatfact= totatfact + s.getPtv();
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
                </div>
               <div id="modal-wrapperr" class="modal">
                   <form action="" method="POST" class="modal-content animate">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('modal-wrapperr').style.display='none'" class="close" title="Fermer">X</span>
                        <h4 style="text-align: left; margin-left: 15px;">
                            <i class="fa fa-hospital-o fa-2x"></i> Facture N° <span><%="000"+idvente %></span>
                        </h4>
                    </div>
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-xs-12 col-md-12" style="margin: 2px">
                                <div class="form-group">
                                    <h4>Client/Malade : <span style="color:yellowgreen"><%= patient %></span></h4>
                                    <h5><Strong>Date</strong> : <%= datefac %></h5>
                                </div>
                                <div class="form-group">
                                    <span><Strong>Total de la facture : </strong> <em class="badge"><%= totatfact +" $" %></em></span>
                                </div>
                            </div>
                        </div>       
                        <div class="row mb-2">
                            <div class="col-xs-12 col-md-12">
                                <div class="row" style="border-bottom: 1px solid black;">
                                    <div class="table-responsive col-md-12">
                                        <table class="table table-bordered table-borderless">
                                            <thead style="background-color: whitesmoke;">
                                                <tr>
                                                    <th>N°</th>
                                                    <th>Désignation</th>
                                                    <th>Quantité</th>
                                                    <th>Prix U.</th>
                                                    <th>Prix T.</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                                int compteurp = 0;
                                                dataS = daoS.LoadF(idvente);
                                                for (sortie s : dataS){ 
                                                 compteurp ++;
                                            %>
                                                <tr>
                                                    <td><%= compteurp %></td>
                                                     <td><%= s.getProduit()%></td>
                                                     <td><%= s.getQtev() %></td>
                                                     <td><%= s.getPvu()%></td>
                                                     <td><%= s.getPtv() %></td>

                                                 </tr>
                                            <%
                                               
                                               }
                                            %>    
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <p class="title" style="font-size: 11px">Conditions et modalité de payement</p>
                                            <div class="pull-left" style="font-size: 11px">
                                                <ul class="list-unstyled">
                                                    <li>le paiement est dû dans 3 jours</li>
                                                    <li>Caisse d'Epargne</li>
                                                    <li>Comptanilité</li>
                                                    <li>Airtel Money/M-Pesa</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-offset-4 col-md-4">
                                    <button class="btn btn-info btn-block" name="btn" type="submit"><span class="glyphicon glyphicon-print"></span>  Imprimer</button>
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
          <script>
            $(function () {
                var availableTags = new Array();
                $("#tags").bind("keydown", function (event) {
                    var data = {designation: $("#tags").val()};
                    $.getJSON("buscar", data, function (res, est, jqXHR) {
                        availableTags.length = 0;
                        $.each(res, function (i, item) {
                            availableTags[i] = item;
                        });
                    });
                });
                $("#tags").autocomplete({
                    source: availableTags,
                    minLeng: 1
                });
            });
        </script>
    </body>
</html>
