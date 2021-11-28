<%@ page import = "java.sql.Connection"
import= "java.sql.DriverManager"
import = "java.sql.PreparedStatement"
import= "java.sql.ResultSet"
import = "java.sql.SQLException"
import  = "java.sql.Statement"
language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>

  <script type="text/javascript">
  
	function noBack() { window.history.forward(); }
	 setTimeout("noBack()", 0);
	    window.onunload=function(){null};

  function validateForm()
  {
  	var w= document.getElementById("Ward_no").value;
  	
  	
  	if (w.trim()==null || w.trim()=="")
  		{
  		alert('Ward number is invalid');
          

  		}
  
  }</script> 
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
  <body >
    <div class="parallax-window" data-parallax="scroll" data-image-src="background.jpeg">
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
                        <a class="nav-link" href="LogoutUser"><span class="sr-only">(current)</span>LOGOUT</a>
                      </li>
                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>

        <section>
          
          <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma","no-cache");
        response.setHeader("Expires","0");
                     if(session.getAttribute("EPIC_no")==null)
         {
        	 response.sendRedirect("user.jsp");
         }
              String e = (String)session.getAttribute("EPIC_no");
        %>          
            <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
                <div class="wrapper wrapper--w680">
                    <div class="card card-4">
                        <div class="card-body">
                        
                        
                              
                              <div  style="color: green;"><h3>${SuccessMsg}</h3>
                              
                              
                              </div>
                             <%  request.getSession().removeAttribute("SuccessMsg");%>
                              <div  style="color: red;"><h3>${errormsg}</h3>
                              
                              
                              </div>
                              
                                                                             <%
                     
                           
                          request.getSession().removeAttribute("errormsg");
%>
                        
                              
                                        
                            <h2 class="title">VOTE</h2>
                            <form  onsubmit="validateForm()"  id = "voteform" method="POST" action="./vote">
                                <div class>
                                    <div class>
                                      
                                        <div class>
                                            <div class="input-group">
                                                <label class="label">EPIC Number</label>
                                                <input class="input--style-4" type="text" id = "EPIC_no" value =  "${EPIC_no}"  width="00" pattern="(?=.*[A-Z]){3}(?=.*[0-9]){7}" name="EPIC_no" pattern="(?=.*[0-9]).{10,}"
                                        readonly="readonly"  required >
                                        
                                            </div>
                                        </div>
                                        
                                        <div class>
                                          <div class="input-group">
                                              <label class="label">Ward number</label>
                                              <input class="input--style-4" type="number" id="Ward_no"   placeholder  = "Enter the ward number"  width="00" name="Ward_no"  required/>
                                          </div>
                                      </div>
                                        <div class="input-group">
                                            <label class="label">அனைத்திந்திய அண்ணா திராவிட முன்னேற்றக் கழகம்</label>
                                            <div class="p-t-10">
                                                <label class="radio-container m-r-45"><label class="label"><img src="admk.jpeg" height="100" weight="100"></label>
                                                    <input type="radio" id = "vote" value="admk"name="vote" required /><br>
                                                    <span class="checkmark"></span>
                                                </label>
                                                
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <label class="label">திராவிட முன்னேற்றக் கழகம்</label>
                                            <div class="p-t-10">
                                                <label class="radio-container m-r-45"><label class="label"><img src="dmk.jpeg" height="100" weight="100"></label>
                                                    <input type="radio"  id = "vote" value="dmk" name="vote" required/><br>
                                                    <span class="checkmark"></span>
                                                </label>
                                                
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <label class="label">மக்கள் நீதி மய்யம்</label>
                                            <div class="p-t-10">
                                                <label class="radio-container m-r-45"><label class="label"><img src="mnm.jpeg" height="100" weight="100"></label>
                                                    <input type="radio" id="vote" value= "mnm" name="vote" required/><br>
                                                    <span class="checkmark"></span>
                                                </label>
                                                
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <label class="label">நாம் தமிழர் கட்சி</label>
                                            <div class="p-t-10">
                                                <label class="radio-container m-r-45"><label class="label"><img src="ntk.jpeg" height="100" weight="100"></label>
                                                    <input type="radio"  id = "vote" value = "ntk" name="vote" required><br>
                                                    <span class="checkmark"></span>
                                                </label>
                                                
                                            </div>
                                        </div>
                                       
                                        <div class="input-group">
                                            <label class="label">பாரதிய ஜனதா கட்சி</label>
                                            <div class="p-t-10">
                                                <label class="radio-container m-r-45"><label class="label"><img src="bjp.jpeg" height="100" weight="100"></label>
                                                    <input type="radio"value="bjp" id = "vote" name="vote" required><br>
                                                    <span class="checkmark"></span>
                                                </label>
                                                
                                            </div>
                                        </div>
                                        <div class="input-group">
                                            <label class="label">பாட்டாளி மக்கள் கட்சி</label>
                                            <div class="p-t-10">
                                                <label class="radio-container m-r-45"><label class="label"><img src="pmk.jpeg" height="100" weight="100"></label>
                                                    <input type="radio" value="pmk" id ="vote" name="vote" required/><br>
                                                    <span class="checkmark"></span>
                                                </label>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                   
                                <div class="input-group">
                                   
                                </div>
                                <div class="p-t-15">
                                  <a href="index.jsp">  <button class="btn btn--radius-2 btn--blue" type="submit"><font color="white">Submit</font></button></a><br>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
        <script>
          var w = document.getElementById("Ward_no")
    , e = document.getElementById("EPIC_no"),
    v=document.getElementById("vote");
  
  function validate(){
    if(w.value==null) {
      w.setCustomValidity("Please fill the Ward number!");
    } else if(e.value==null) {
      e.setCustomValidity('Please fill the EPIC number!');
    }
    else if(v.value==null)
    {
      v.setCustomValidity('Please place your vote!');
    }
  }
  
  w.onchange = validate;
  e.onchange = validate
  v.onchange =validate;
        </script>
      </body>
    </html>