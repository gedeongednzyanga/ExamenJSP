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
                DAOCategorie datacat = new DAOCategorie();
                List <produit> data = new ArrayList<>();
                List <produit> datac = new ArrayList<>();
                
                
            %>
        
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-8">
                            <h2><i class="fa fa-medkit"></i> Médicaments </h2> 
                        </div>
                        <div class="col-md-2">
                            <h2><button class="btn btn-primary btn-xl" onclick="document.getElementById('modal-wrapperr').style.display='block'"><i class="fa fa-plus-circle"></i> Nouveau Méd.</button> </h2>   
                        </div>
                       <div class="col-md-2">
                            <h2><button class="btn btn-primary btn-xl"><i class="fa fa-refresh"></i> Actualiser</button> </h2>   
                        </div>
                    </div>
                    <div class="row">
                         <div class="col-md-4">
                               
                            <form action="" method="POST" class="form-inline well">
                                <div class="form-group input-group">
                                    <input type="search" class="form-control search-input pull-left input-sm" data-table="customers-list" placeholder="Rechercher...">
                                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                                </div>
                            </form>
                                
                            </div>
                            <div class="col-md-8">
                                <div class="form-inline well" style="width: 100%">
                                    <div class="row">
                                        <form action="" method="POST" class="col-md-3 form-group">
                                            <button style="margin-top: 0" type="submit" class="btn btn-info"><i class="fa fa-print"></i> Imprimer</button>
                                        </form>
                                        <form action="" method="POST" class="col-md-9 form-group">
                                            <div class="row">
                                                <div class= "col-md-5">
                                                    <label style="margin-top: 5px">Trier par Catégorie</label>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                           
                                                            <select name="lignecat" class="form-control">
                                                                <option value="">Catégorie</option>
                                                                <%
                                                                    datac = datacat.Load();
                                                                    for(produit cat : datac){
                                                                %>
                                                                    <option value="<%= cat.getCategorie()%>"><%= cat.getCategorie() %></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <button name="btnSearch" style="margin-top: 0; width: 100%" type="submit" class="btn btn-info"><i class="fa fa-eye"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <hr />
                                 
                    <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Liste Médicaments
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover customers-list" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>N°</th>
                                                <th>Médicament</th>
                                                <th>Catégorie</th>
                                                <th>Prix unitaire</th>
                                                <th>Stock Alert</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if(request.getParameter("lignecat") != null){
                                                    String categ = request.getParameter("lignecat").toString();
                                                    data = daop.Search(categ);
                                                }else{
                                                     data = daop.Load();
                                                }
                                                for (produit p : data){
                                            %>
                                            <tr>
                                                <td> <%= p.getIdp() %> </td>
                                                <td> <%= p.getDesignation() %> </td>
                                                <td> <%= p.getCategorie() %> </td>
                                                <td class="text-center"> <%= p.getPvu()+" "+"$" %> </td>
                                                <td class="text-center"> <%= p.getStockAlert() %> </td>

                                                <td class="text-center">
                                                    <a class="btn btn-warning btn-xs" href="medicamentModif.jsp?id=<%= p.getIdp() %>"><i class="fa fa-edit"></i>Modifier</a>
                                                    <a class="btn btn-danger btn-xs" href="medicamentModif.jsp?id=<%= p.getIdp() %>">Supprimer.</a>
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
                    <div id="modal-wrapperr" class="modal">
                    <form action="servProduit" method="POST" class="modal-content animate">
                        <div class="imgcontainer">
                            <span onclick="document.getElementById('modal-wrapperr').style.display='none'" class="close" title="Fermer">X</span>
                            <h2 style="text-align: left; margin-left: 15px;"><i class="fa fa-pencil"></i> Médicament</h2>
                        </div>
                        <hr>
                        <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-md-12">
                                <input class="form-control" type="hidden" name="action" value="1">
                                <input class="form-control" type="hidden" name="id" value="0">
                                <div class="form-group"><input class="form-control" type="text" placeholder="Désignation" name="produit" id=""></div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                                    <input class="form-control" type="number" placeholder="Prix unitaire" name="pvu" id="">
                                </div>
                                <div class="form-group"><input class="form-control" type="number" placeholder="Stock alert" name="alert" id=""></div>
                                <div class="form-group">
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
                                </div>
                                <div class="row">
                                    <div class="col-lg-offset-4 col-lg-4">
                                        <button class="btn btn-success btn-block" name="btn" type="submit"><i class="glyphicon glyphicon-ok"></i> Enregistrer</button>
                                    </div>
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
