<%-- 
    Document   : tab-panel
    Created on : 17 janv. 2020, 08:41:52
    Author     : GEDEON
--%>

<%@page import="view.fournisseur"%>
<%@page import="model.DAOFournisseur"%>
<%@page import="view.approvisionnement"%>
<%@page import="model.DAOApprovisionnement"%>
<%@page import="view.produit"%>
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
               
                DAOProduit daop = new DAOProduit();
                List <produit> datap = new ArrayList<>();
                
                DAOFournisseur daof = new DAOFournisseur();
                List <fournisseur> dataf = new ArrayList<>();
                
                DAOApprovisionnement daoa = new DAOApprovisionnement ();
                List <approvisionnement> dataap = new ArrayList<>();
            %>
        
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-6">
                            <h2><i class="fa fa-shopping-cart"></i> Approvisionnement </h2>   
                        </div>
                        <div class="col-md-2">
                          <button class="btn btn-primary btn-xl btn-block pull-right" onclick="document.getElementById('modal-wrapperr').style.display='block'">Achat Méd.</button>  
                        </div>
                        <div class="col-md-4">
                            <form action="" method="" class="well pull-right">
                                <div class="input-group">
                                    <input type="search" class="form-control search-input pull-left input-sm" data-table="customers-list" placeholder="Rechercher...">
                                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                </div>
                            </form>
                        </div>
                    </div>
                    <hr />
                                 
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Panel Approvisionnements
                            <span class="pull-right">
                                <form action="" method="">
                                    <button class="btn btn-primary btn-xs"><i class="fa fa-refresh"></i> Actualiser</button>
                                </form>
                            </span>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover customers-list" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>N°</th>
                                            <th>Médicament</th>
                                            <th>Catégorie</th>
                                            <th>Qté</th>
                                            <th>PA.U</th>
                                            <th>Date Fab.</th>
                                            <th>Date Expi.</th>
                                            <th>Fournisseur</th>
                                            <th>D. Achat</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            dataap = daoa.Load();
                                            for (approvisionnement a : dataap){
                                        %>
                                        <tr>
                                            <td> <%= a.getId() %> </td>
                                            <td> <%= a.getDesignation() %> </td>
                                            <td> <%= a.getCategorie() %> </td>
                                            <td class="text-center"> <%= a.getQuantite() %> </td>
                                            <td class="text-center"> <%= a.getPua()+" "+"$" %> </td>
                                            <td class="text-center"> <%= a.getFabrication()%> </td>
                                            <td class="text-center"> <%= a.getExpiration()%> </td>
                                            <td class="text-center"> <%= a.getNomfourni()%> </td>
                                             <td class="text-center"> <%= a.getDateapprov()%> </td>
                                            
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
            <div id="modal-wrapperr" class="modal">
                <form action="servApprovisionnement" method="POST" class="modal-content animate">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('modal-wrapperr').style.display='none'" class="close" title="Fermer">X</span>
                        <h2 style="text-align: left; margin-left: 15px;"><i class="fa fa-shopping-cart"></i> Entrée Stock.</h2>
                    </div>
                    <hr>
                    <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-md-12">
                             <input class="form-control" type="hidden" name="action" value="1">
                             <input class="form-control" type="hidden" name="id" value="0">
                             <div class="form-group">
                                <select class="form-control" name="produit" id="">
                                    <option value="1">Produit</option>
                                    <%
                                        datap = daop.Load();
                                        for(produit p : datap){
                                    %>
                                    <option value="<%= p.getIdp() %>"><%= p.getDesignation() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                             </div>
                            <div class="form-group">
                                <input class="form-control" type="number" placeholder="Quantité" name="quantite" id="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="number" placeholder="Prix Achat" name="pua" id="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="date" placeholder="Prix Achat" name="fabication" id="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="date" placeholder="Prix Achat" name="expiration" id="">
                            </div>
                            <div class="form-group">  
                                <select class="form-control" name="fournisseur" id="">
                                    <option value="1">Fournisseur</option>
                                    <%
                                        dataf = daof.Get_Fournisseur();
                                        for(fournisseur fourni : dataf){
                                    %>
                                    <option value="<%= fourni.getIdf()%>"><%= fourni.getFourni()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            
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
