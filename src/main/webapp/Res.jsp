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
                      <a class="nav-link" href="Result.jsp">DETAILED RESULTS</a>
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
                        <h2 class="title">ELECTION RESULTS</h2>
        <%
        Connection objconn = null;
		Statement objStmt = null;

		 ResultSet objRS  = null;
			try { 
				int a=1,d=1,m=1,n=1,b=1,p= 1,y=1,c=1,s=1,o=1;
				String x = null, z = null, u = null, v = null, q = null, r = null, j = null,k = null, g = null,h = null , temp1 = null,temp2 = null,
						temp3 = null,temp4 = null, temp5=null,temp6 = null, e = null,f = null, i = null,l=null;
				
				Class.forName("org.postgresql.Driver");
				objconn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","suvetha2002");
				objStmt = objconn.createStatement();
				String  strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '1' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				            if(a!=2) {
				               x = objRS.getString(2);
				               %> <h4> <ul><li><font color="Purple"> Party that wins the Ward number 1 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="Purple"><element> Highest votes scored:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}	
				            else {
				            	z = objRS.getString(2);
				            	if(x.equals(z))
				            	{
				            		%> <h4> <ul><li><font color="Purple"> Party that wins the Ward number 1 is :</font> <font color="red"><%= objRS.getString(1)%> </font></li></ul></h4><% 
											 %> <h4> <font color="Purple"><element> scored equal votes:</font> </element>
						 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				            		
				            	}
				            	
				            }
				            a=a+1;
				 }
				 strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '2' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(d!=2) {
				        	 u=objRS.getString(2);
				        	 %> <h4> <ul><li><font color="yellow green"> Party that wins the Ward number 2 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
									 %> <h4> <font color="yellow green"><element> Highest votes scored:</font> </element>
				 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 

					}	
				         else
				         {
				        	 v=objRS.getString(2);
				        	 if(u.equals(v))
				        	 {
				        		 %> <h4> <ul><li><font color="yellow green"> Party that wins the Ward number 2 is :</font> <font color="Violet"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="yellow green"><element> scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	 }
				         }
				         d=d+1;
				 }
				 strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '3' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(b!=2) {
				        	 q = objRS.getString(2);
				        	 
				        	 %> <h4> <ul><li><font color="Maroon"> Party that wins the Ward number 3 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
									 %> <h4> <font color="Maroon"><element> Highest votes scored:</font> </element>
				 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}	
				         else
				         {
				        	 r = objRS.getString(2);
				        	 
				        	 if(q.equals(r))
				        	 {
				        		 %> <h4> <ul><li><font color="Maroon"> Party that wins the Ward number 3 is :</font> <font color="Orange"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="Maroon"><element> scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	 }
				         }
				         b=b+1;}
				 strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '4' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				           if(c!=2) {
				        	   j = objRS.getString(2);
				        	   %> <h4> <ul><li><font color="black"> Party that wins the Ward number 4 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="black"><element> Highest votes scored:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}	
				           else
				           {   k = objRS.getString(2);
				        	   if(j.equals(k))
				        	   {
				        		   %> <h4> <ul><li><font color="black"> Party that wins the Ward number 4 is :</font> <font color="blue"><%= objRS.getString(1)%> </font></li></ul></h4><% 
											 %> <h4> <font color="black"><element> scored equal votes:</font> </element>
						 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	   }
				           }
				           c=c+1;}
				 strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '5' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(p!=2) {
				        	 g = objRS.getString(2);
				        		%> <h4> <ul><li><font color="Orange"> Party that wins the Ward number 5 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="Orange"><element> Highest votes scored:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}	
				         else
				         {
				        	 h = objRS.getString(2);
				        	 if(g.equals(h)) {
				        		 %> <h4> <ul><li><font color="Orange"> Party that wins the Ward number 5 is :</font> <font color="Maroon"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="Orange"><element> scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	 }
				         }
				         p=p+1;}
				         strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '6' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ;";
				         
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(n!=2) {
				        	temp1 = objRS.getString(2);
				        	%> <h4> <ul><li><font color="Blue"> Party that wins the Ward number 6 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
									 %> <h4> <font color="Blue"><element> Highest votes scored:</font> </element>
				 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}	
				        else
				        {
				        	temp2 = objRS.getString(2);
				        	if(temp1.equals(temp2))
				        	{
				        		%> <h4> <ul><li><font color="Blue"> Party that wins the Ward number 6 is :</font> <font color="black"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="Blue"><element>scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	}
				        }
				        n=n+1;}
				 strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '7' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(m!=2) {
				        	 temp3 = objRS.getString(2);
				        	 %> <h4> <ul><li><font color="Brown"> Party that wins the Ward number 7 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
									 %> <h4> <font color="Brown"><element> Highest votes scored:</font> </element>
				 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}	
				         else
				         {
				        	 temp4 = objRS.getString(2);
				        	 if(temp3.equals(temp4))
				        	 {
				        		 %> <h4> <ul><li><font color="Brown"> Party that wins the Ward number 7 is :</font> <font color="yellow green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="Brown"><element> scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	 }
				         }
				         m=m+1;
				 }
				 strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '8' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY') ORDER BY c DESC ";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(o!=2) {
				        	temp5 = objRS.getString(2);
				        	 %> <h4> <ul><li><font color="yellow"> Party that wins the Ward number 8 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
									 %> <h4> <font color="yellow"><element> Highest votes scored:</font> </element>
				 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}
				        else
				        {
				        	temp6 = objRS.getString(2);
				        	if(temp5.equals(temp6))
				        	{
				        		%> <h4> <ul><li><font color="yellow"> Party that wins the Ward number 8 is :</font> <font color="red"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="yellow"><element> scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	}
				        }
				        o = o+1;}
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '9' GROUP BY \"vote\" ORDER BY c DESC";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(s!=2) {
				        	e = objRS.getString(2);
				        	 %> <h4> <ul><li><font color="DarkRed"> Party that wins the Ward number 9 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
									 %> <h4> <font color="DarkRed"><element> Highest votes scored:</font> </element>
				 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				    
				 }	
				        else
				        {
				        	f = objRS.getString(2);
				        	if(e.equals(f))
				        	{
				        		 %> <h4> <ul><li><font color="DarkRed"> Party that wins the Ward number 9 is :</font> <font color="yellow green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="DarkRed"><element> scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	}
				        }
				        s=s+1;}
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") AS c FROM public.vote WHERE \"Ward_no\" = '10' GROUP BY \"vote\" ORDER BY c DESC";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(y!=2) {
				        	i = objRS.getString(2);
				        	 %> <h4> <ul><li><font color="pink"> Party that wins the Ward number 10 is :</font> <font color="green"><%= objRS.getString(1)%> </font></li></ul></h4><% 
									 %> <h4> <font color="pink"><element> Highest votes scored:</font> </element>
				 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
					}	
				        else
				        {
				        	l = objRS.getString(2);
				        	if(i.equals(l))
				        	{
				        		 %> <h4> <ul><li><font color="pink"> Party that wins the Ward number 10 is :</font> <font color="Black"><%= objRS.getString(1)%> </font></li></ul></h4><% 
										 %> <h4> <font color="pink"><element> scored equal votes:</font> </element>
					 	<font color="green"><%= objRS.getString(2)%> </font></h4><% 
				        	}
				        }
				     y=y+1;
				 }
				 }
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

        %> <p><i><h3>For more details about difference of votes</h3></i></p>
       <b><h4><a href = "Result.jsp"><font color="Purple">CLICK HERE</font> </a> </h4>  </b>   
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