<%-- 
    Document   : index
    Created on : 7 févr. 2020, 13:29:31
    Author     : GEDEON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="Style/css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="Style/css/animate.css">
        <link rel="stylesheet" href="Style/css/owl.carousel.min.css">
        <link rel="stylesheet" href="Style/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="Style/css/magnific-popup.css">
        <link rel="stylesheet" href="Style/css/aos.css">
        <link rel="stylesheet" href="Style/css/ionicons.min.css">
        <link rel="stylesheet" href="Style/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="Style/css/jquery.timepicker.css">
        <link rel="stylesheet" href="Style/css/flaticon.css">
        <link rel="stylesheet" href="Style/css/icomoon.css">
        <link href="Style/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="Style/css/style.css">
        <link href="style_login.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="./assets/icons/favicon.ico">
        <title>Examen JSP</title>
         
       
    </head>
   <body>
  

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco-bg-dark" id="ftco-navbar">
        <div class="container d-flex align-items-center">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
            <p class="button-custom order-lg-last mb-0"><a href="#" class="btn btn-secondary py-2 px-3" onclick="document.getElementById('login_form').style.display='block'">Se Connecter</a></p>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <div class="navbar-header" style="margin-right: 20px">
                    <div class="navbar-brand">
                        <h1><img src="images/logo_medi.png" alt="Medi+"></h1>
                    </div>
                </div>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><a href="index.jsp" class="nav-link pl-0">Accueil</a></li>
                    <li class="nav-item"><a href="" class="nav-link">A Propos</a></li>
                    <li class="nav-item"><a href="" class="nav-link">Docteurs</a></li>
                    <li class="nav-item"><a href="" class="nav-link">Département</a></li>
                    <li class="nav-item"><a href="" class="nav-link">Tarifications</a></li>
                    <li class="nav-item"><a href="" class="nav-link">Contacts</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END nav -->

    <section class="home-slider owl-carousel">
        <div class="slider-item" style="background-image:url(Style/images/bg_1.jpg);" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
                    <div class="col-md-6 text ftco-animate">
                        <h1 class="mb-4">Helping Your <span>Reste Souriant</span></h1>
                        <h3 class="subheading">Chaque jour nous apportons l'Espoir et le Sourire Au Patient</h3>
                        <p><a href="#" class="btn btn-secondary px-4 py-3 mt-3">Voir Plus</a></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="slider-item" style="background-image:url(Style/images/bg_3.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
                    <div class="col-md-6 text ftco-animate">
                        <h1 class="mb-4">Nous Soignons <span>Devise</span></h1>
                        <h3 class="subheading">Votre Santé, Notre Priorité.</h3>
                        <p><a href="#" class="btn btn-secondary px-4 py-3 mt-3">Voir Plus</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="slider-item" style="background-image:url(Style/images/image_6.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-start" data-scrollax-parent="true">
                    <div class="col-md-6 text ftco-animate">
                        <h1 class="mb-4">Nous Soignons <span>Devise</span></h1>
                        <h3 class="subheading">Votre Santé, Notre Priorité.</h3>
                        <p><a href="#" class="btn btn-secondary px-4 py-3 mt-3">Voir Plus</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

  
    <div class="animate" id="login_form">
        <form action="identificationp.jsp" method="post">
            <h1>Login</h1>
            <div class="textb">
                <input type="text" autocomplete="off" name="username" reset placeholder="Nom d'utilisateur">
            </div>
            <div class="textb">
                <input type="password" autocomplete="off" name="password" placeholder="Mot de passe">
            </div>
            <input type="submit" class="logbtn" value="Connexion">
        </form>
    </div>

    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


    <script src="Style/js/jquery.min.js"></script>
    <script src="Style/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="Style/js/popper.min.js"></script>
    <script src="Style/js/bootstrap.min.js"></script>
    <script src="Style/js/jquery.easing.1.3.js"></script>
    <script src="Style/js/jquery.waypoints.min.js"></script>
    <script src="Style/js/jquery.stellar.min.js"></script>
    <script src="Style/js/owl.carousel.min.js"></script>
    <script src="Style/js/jquery.magnific-popup.min.js"></script>
    <script src="Style/js/aos.js"></script>
    <script src="Style/js/jquery.animateNumber.min.js"></script>
    <script src="Style/js/bootstrap-datepicker.js"></script>
    <script src="Style/js/jquery.timepicker.min.js"></script>
    <script src="Style/js/scrollax.min.js"></script>
    <script src="Style/js/google-map.js"></script>
    <script src="Style/js/main.js"></script>

</body>

</html>
