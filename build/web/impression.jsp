<%-- 
    Document   : index
    Created on : 22 janv. 2020, 00:15:08
    Author     : Wabthomas Bin Wisdom
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="header.jsp"/>
        <script language="javascript">
<!--
window.print()
//-->
</script>
<!--//Metis Menu -->
</head> 
<body>
    <%
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ex_gest_hop","wabthomas","0060032");

        String idm=request.getParameter("id");
        pst=con.prepareStatement("select * from tbl_personne where id=?");
        pst.setString(1, idm);
        rs=pst.executeQuery();
        while(rs.next())
        {
            out.println("<font color=#'43b200'><center><h4>REPUBLIQUE DEMOCRATIQUE DU CONGO <br>Ministere de sante<br> GESTION HOPITAL</center></font>");

        %>
	
		<div id="page-wrapper">
			<div class="main-page">
				<div class="container">
				 <div class="col-12 col-lg-10">
                                    <div class="forms">
					<div class="form-grids row widget-shadow" data-example-id="basic-forms"> 
						<div class="form-title">
                                                    <h4>FICHE DU PATIENT N° 00<strong><%=rs.getString("id")%></strong></h4>
						</div>
						<div class="form-body">
                                                    <form action="" method="POST" > 
							<div class="form-group col-md-4"> 
							<label for="pvdetail">NOM : <%=rs.getString("nom")%></label>
							</div> 
							<div class="form-group col-md-4"> 
							<label for="pvgros">POSTNOM : <%=rs.getString("postnom")%></label>
							</div> 
                                                            <div class="row">
                                                                <div class="form-group col-md-4">
                                                                    <label fo="pvcasse">PRENOM : <%=rs.getString("prenom")%></label>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label fo="pvcasse">TELEPHONE : <%=rs.getString("tel")%></label>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="stsecurite">ADRESSE : <%=rs.getString("adresse")%></label>
                                                                </div>
                                                                <div class="row">
                                                                <div class="form-group col-md-4">
                                                                    <label>SEXE : <%=rs.getString("sexe")%></label>
                                                                </div>
                                                                </div>
                                                            </div>
                                                                <%}%>      
                                                    </form> 
                                                    <br><font face="century gothic" size="3">Fait a Goma, le <%= (new java.util.Date()).toLocaleString() %><div id="message"></div></font>
                                                                        
                                                                                
                                                                         
                                                                        <script>
                                                                            function Imprimer() {
                                                                                window.print();}
                                                                            </script>
						</div>
					 </div>
                                       </div>
                            </div>  
                </div>
            </div>
                        
                     
                                                    <br>
                   
                                 
        <script>
            (function() {
                'use strict';

                // Self Initialize DOM Factory Components
                domFactory.handler.autoInit();
            });
        </script>
                                                    
                                      
                                         <br>
                                        
				<div class="clearfix"> </div>
			</div>
		</div>
		<!--footer-->
		<div class="footer">
		   <p>&copy; 2019-2020 Gestion Hopital. Tous droits reserves | Design by <a href="https://www.wab-infos.com/" target="_blank">Wabthomas</a></p>
		</div>
        <!--//footer-->
	</div>
	<!-- Classie -->
		<script src="../js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!--scrolling js-->
	<script src="../js/jquery.nicescroll.js"></script>
	<script src="../js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="../js/bootstrap.js"> </script>
</body>
    </body>
</html>

