<%-- 
    Document   : report
    Created on : 12 févr. 2020, 12:36:10
    Author     : GEDEON
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="application/pdf" %>
<%@page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.InputStream"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Database"%>

<!DOCTYPE HTML>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <%
            Database bd = new Database();
            Connection conn = null;
            try {
               // Class.forName("com.mysql.jdbc.Driver");
                conn = bd.dbConnect(); //DriverManager.getConnection("jdbc:mysql://localhost:3306/ex_gest_hop", "root", "");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            File reportFile = new File(application.getRealPath("/listePatient.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
        %>
    </body>
</html>
