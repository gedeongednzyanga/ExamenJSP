<%-- 
    Document   : tab-panel
    Created on : 17 janv. 2020, 08:41:52
    Author     : GEDEON
--%>

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
                        <div class="col-md-6">
                            <h2><i class="fa fa-list-alt"></i> Stock </h2>   
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-info btn-block">Inventaire</button> 
                            
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
                            <span class="title">Stock Médicament </span>
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
                                            <th>Prix U</th>
                                            <th>Stock</th>
                                            <th>S. Alert</th>
                                            <th>Date fab.</th>
                                            <th>Date expi.</th>
                                            <th>Alerte</th>
                                            <th>Fiche Stock</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            data = daop.Load_Stock();
                                            for (produit p : data){
                                        %>
                                        <tr>
                                            <td> <%= p.getIdp() %> </td>
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
                                            <td class="text-center"> <%= p.getStockAlert()%> </td>
                                            <td class="text-center"> <%= p.getFabrication()%> </td>
                                            <td class="text-center"> <%= p.getExpiration()%> </td>
                                            <% 
                                                if (p.getStock() < p.getStockAlert()){ %>
                                                <td class="text-center">
                                                    <em class="btn btn-danger btn-xs">Mauvais</em>
                                                </td>
                                            <%
                                                }else{
                                            %>
                                              <td class="text-center">
                                                    <em class="btn btn-success btn-xs">Super</em>
                                              </td>
                                            <%
                                               }
                                            %>
                                             <td class="text-center">
                                                 <a href="" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-print"></span> Imprimer</a>
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
