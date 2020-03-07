<%-- 
    Document   : allmenu
    Created on : 1 févr. 2020, 14:16:21
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
            <a class="navbar-brand" href="index.jsp">H. Management</a> 
        </div>
        <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> 
            Dernier accès : 10 Décémbre 2019 &nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Déconnexion</a> 
        </div>
    </nav>   
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu"> 
                <li>
                    <a class=""  href="index.jsp"><i class="fa fa-home fa-3x"></i> Accueil</a>
                </li>
                <li>
                    <a  href="ui.jsp"><i class="fa fa-plus-circle fa-3x"></i> Nos Services<span class="fa arrow"></span></a>
                    <ul class="nav nav-third-level">
                        <li>
                            <a href="espaceReception.jsp">Nouveau</a>
                        </li>
                        <li>
                            <a href="#">Patients</a>
                        </li>
                    </ul>
                </li> 
                <li>
                    <a  href="login.jsp"><i class="fa fa-sign-in fa-3x"></i> Connexion</a>
                </li>				                
                <li>
                    <a  href="#"><i class="fa fa-info-circle fa-3x"></i> A propos</a>
                </li>	
            </ul>
        </div>
    </nav>  
</html>
