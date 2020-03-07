<%-- 
    Document   : menu
    Created on : 17 janv. 2020, 08:15:00
    Author     : GEDEON
--%>

<html>
    <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">Examen</a> 
        </div>
        <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> 
            Dernier accès : 10 Janvier 2020 &nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Déconnexion</a> 
        </div>
    </nav>   
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                    <li class="text-center">
                        <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                    </li>
                <li>
                    <a class="active-menu"  href="index.jsp"><i class="fa fa-home fa-3x"></i> Accueil</a>
                </li>
                <li>
                    <a  href="medicament.jsp"><i class="fa fa-hospital-o fa-3x"></i> Médicament <span class="fa arrow"></span> </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="medicament.jsp">Nouveau</a>
                        </li>
                        <li>
                            <a href="approvisionnement.jsp">Approvisionnement</a>
                        </li>
                        <li>
                            <a href="sortie.jsp">Sortie en Stock</a>
                        </li>
                        <li>
                            <a href="stock.jsp">En Stock</a>
                        </li>
                    </ul>
                </li>           
                <li>
                    <a  href="stock.jsp"><i class="fa fa-hospital-o fa-3x"></i> Fournisseurs</a>
                </li>
                 <li>
                    <a  href="identificationp.jsp"><i class="fa fa-hospital-o fa-3x"></i> Clients/Malades</a>
                </li>
                 <li>
                    <a  href="configuration.jsp"><i class="fa fa-hospital-o fa-3x"></i> Configuration</a>
                </li>
            </ul>
        </div>
    </nav>  
</html>
