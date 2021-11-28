<%@ page import = "java.sql.Connection"
import= "java.sql.DriverManager"
import = "java.sql.PreparedStatement"
import= "java.sql.ResultSet"
import = "java.sql.SQLException"
import  = "java.sql.Statement"
language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Tamilnadu Government Election</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" />
    <link rel="stylesheet" href="css/all.min.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/templatemo-style.css" />
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
<!--
Parallo Template
https://templatemo.com/tm-534-parallo
-->
  </head>
  <body>
    <div class="parallax-window" data-parallax="scroll" data-image-src="register.jpeg">
      <div class="container-fluid">
        <div class="row tm-brand-row">
          <div class="col-lg-4 col-11">
            <div class="tm-brand-container tm-bg-white-transparent">
              
              <div class="logo1"><img src="logo.png" width="100" height="100"></div>
                <h1 class="text-uppercase tm-brand-name"><b>ELECTION COMMISION OF INDIA</b></h1>
                <div class="logo2"><img src="tn.png" width="100" height="100"></div>
                
              </div>
            </div>
          </div>
          <div class="col-lg-8 col-1">
            <div class="tm-nav">
              <nav class="navbar navbar-expand-lg navbar-light tm-bg-white-transparent tm-navbar">
                <button class="navbar-toggler" type="button"
                  data-toggle="collapse" data-target="#navbarNav"
                  aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav">
                                        <li class="nav-item">
                      <div class="tm-nav-link-highlight"></div>
                      <a class="nav-link" href="Res.jsp">RESULTS</a>
                    </li>
                    
                    
                    <li class="nav-item">
                      <div class="tm-nav-link-highlight"></div>
                      <a class="nav-link" href="Logout">LOGOUT</a>
                    </li>

                   </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma","no-cache");
        response.setHeader("Expires","0");
                     if(session.getAttribute("Loginid")==null)
         {
        	 response.sendRedirect("admin.jsp");
         }
        %>
        <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
            <div class="wrapper wrapper--w680">
                <div class="card card-4">
                    <div class="card-body">
                        <h2 class="title">RESULTS OF ELECTION</h2>
        <%
        Connection objconn = null;
		Statement objStmt = null;

		 ResultSet objRS  = null;
			try { 
				int a=0,d=0,m=0,n=0,b=0,p= 0;
				
				Class.forName("org.postgresql.Driver");
				objconn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","suvetha2002");
				objStmt = objconn.createStatement();
				
				String strquery = "SELECT \"Ward_no\",COUNT(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) FROM public.vote WHERE  LOWER(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) LIKE LOWER('admk')  GROUP BY \"Ward_no\";";
				objRS = objStmt.executeQuery(strquery);
				
				 while(objRS.next()){
				
					 %> <h4> <font color="green">Ward number : <%= objRS.getInt(1)%> </font></h4><% 
					 %> <h4> <font color="yellow green"><element>ADMK votes : </element>
 	<%= objRS.getInt(2)%> </font></h4><% 
					}
				 
				 strquery = "SELECT \"Ward_no\",COUNT(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) FROM public.vote WHERE  LOWER(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) LIKE LOWER('dmk')  GROUP BY \"Ward_no\";";
				objRS = objStmt.executeQuery(strquery);
				while(objRS.next()){
				
					%> <h4> <font color="green">Ward number : <%= objRS.getInt(1)%> </font></h4><% 
							 %> <h4> <font color="red"><element> DMK votes: </element>
		 	<%= objRS.getInt(2)%> </font></h4><% 
				}
				 strquery = "SELECT \"Ward_no\",COUNT(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) FROM public.vote WHERE  LOWER(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) LIKE LOWER('mnm')  GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
			
					 %> <h4 > <font color="green">Ward number : <%= objRS.getInt(1)%> </font></h4><% 
							 %> <h4 > <font  color="orange"><element>MNM votes : </element>
		 	<%= objRS.getInt(2)%> </font></h4><% 
					}
				 strquery = "SELECT \"Ward_no\",COUNT(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) FROM public.vote WHERE  LOWER(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) LIKE LOWER('ntk')  GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
					
					 %> <h4> <font color="green">Ward number : <%= objRS.getInt(1)%> </font></h4><% 
							 %> <h4> <font color="blue"><element>NTK votes : </element>
		 	<%= objRS.getInt(2)%> </font></h4><% 
					}
				 strquery = "SELECT \"Ward_no\",COUNT(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) FROM public.vote WHERE  LOWER(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) LIKE LOWER('bjp')  GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
			
						 %> <h4> <font color="green">Ward number : <%= objRS.getInt(1)%> </font></h4><% 
					 %> <h4> <font color="brown"><element>BJP votes : </element>
 	<%= objRS.getInt(2)%> </font></h4><% 
					}
				 strquery = "SELECT \"Ward_no\",COUNT(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) FROM public.vote WHERE  LOWER(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')) LIKE LOWER('pmk')  GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
					 %> <h4> <font color="green">Ward number : <%= objRS.getInt(1)%> </font></h4><% 
							 %> <h4> <font color="yellow"><element> PMK votes: </element>
		 	<%= objRS.getInt(2)%> </font></h4><% 
					}				}
				catch(Exception e)
				{
					e.printStackTrace();
					}
				finally
				{
					try
					{
						objRS.close();
						objStmt.close();
						objconn.close();
						
					}
					catch(SQLException e)
					{
						e.printStackTrace();
					}
				}
        %>                
                    </div>
                </div>
            </div>
        </div>
    
        <!-- Jquery JS-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/datepicker/moment.min.js"></script>
        <script src="vendor/datepicker/daterangepicker.js"></script>
    
        <!-- Main JS-->
        <script src="js/global.js"></script>

        
        <!-- Page footer -->
        <footer class="row">
          <p class="col-12 text-white text-center tm-copyright-text">
            Copyright &copy; tnelection
            Designed by <a href="#" class="tm-copyright-link">Indian Government</a>
          </p>
        </footer>
      </div>
      <!-- .container-fluid -->
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/parallax.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>