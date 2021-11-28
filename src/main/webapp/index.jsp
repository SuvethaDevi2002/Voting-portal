<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<!--
Parallo Template
https://templatemo.com/tm-534-parallo
-->
  </head>
  <script type="text/javascript">

    function validateForm()
    {
    	var e= document.getElementById("msg").value;
    
    	
    	if (e.trim()==null || e.trim()=="")
    		{
    		alert('Complaint is invalid');
            

    		}
    	
    	
    }</script>
  
  <body>
    <div class="parallax-window" data-parallax="scroll" data-image-src="background.jpg">
      <div class="container-fluid">
        <div class="row tm-brand-row">
          <div class="col-lg-4 col-11">
            <div class="tm-brand-container tm-bg-white-transparent">
              
              <div class="logo3"><img src="logo.png" width="100" height="100"></div>
                <h1 class="text-uppercase tm-brand-name"><b>ELECTION COMMISION OF INDIA</b></h1>
                <div class="logo4"><img src="tn.png" width="100" height="100"></div>
                
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
                    <li class="nav-item active">
                      <div class="tm-nav-link-highlight"></div>
                      <a class="nav-link" href="index.jsp">HOME<span class="sr-only">(current)</span> </a>
                    </li>
                    <li class="nav-item">
                      <div class="tm-nav-link-highlight"></div>
                      <a class="nav-link" href="admin.jsp">ADMIN LOGIN</a>
                    </li>
                    
                    
                    <li class="nav-item">
                      <div class="tm-nav-link-highlight"></div>
                      <a class="nav-link" href="user.jsp">USER LOGIN</a>
                    </li>

                    <li class="nav-item">
                      <div class="tm-nav-link-highlight"></div>
                      <a class="nav-link" href="register.jsp">REGISTER</a>
                    </li>
                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>

        <section class="row" id="tmHome">
          <div class="col-12 tm-home-container">
            <div class="text-white tm-home-left">
              <p class="text-uppercase tm-slogan"></p>
              <hr class="tm-home-hr" />
              <h2 class="tm-home-title">TAMILNADU ELECTION</h2>
              <p class="tm-home-text">
                If you didn't register your name in this website,
              </p>
              <a href="register.jsp" class="btn btn-primary">Register here</a>
            </div>
            <div class="tm-home-right">
              <img src="voting_machine.png" height="500" alt="App on Mobile mockup" />
            </div>
          </div>
        </section>
              

         
        <!-- Features -->
        <div class="row" id="tmFeatures">
          <div class="col-lg-4">
            <div class="tm-bg-white-transparent tm-feature-box">
            <h3 class="tm-feature-name">Cash for votes</h3>
            
            <div class="tm-feature-icon-container">
              <img src="wrong.png" width="90" height="90">
            </div>

            <p class="text-center">A large chunk of money spent by candidates is used to pay voters for votes in cash or liquor, or to pay the visitors of rallies for their time.</p>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="tm-bg-white-transparent tm-feature-box">
                <h3 class="tm-feature-name">Misuse of religion or caste</h3>

                <div class="tm-feature-icon-container">
                  <img src="wrong.png" width="90" height="90">
                </div>
                <p class="text-center">Members of one or more communities are motivated to vote on religious or caste lines.
                </p>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="tm-bg-white-transparent tm-feature-box">
                <h3 class="tm-feature-name">100% vote</h3>

                <div class="tm-feature-icon-container">
                   <img src="tick.png" width="90" height="90">
                </div>
                <p class="text-center">Vote and have his or her vote accurately counted.
                </p>
            </div>
          </div>
        </div>
        <!-- Call to Action -->      
        <section class="row" id="tmCallToAction">
          <div class="col-12 tm-call-to-action-col">
            <img src="complaint.jpeg" height="400" width="400" alt="Image"  />
            <div class="tm-bg-white tm-call-to-action-text">
              <h2 class="tm-call-to-action-title">For Complaints</h2>
              <p class="tm-call-to-action-description">
                <a rel="nofollow" href="https://www.toocss.com"></a> If you have faced any issues while registering your account, voting , and other things , Write down here   
    
              </p>
               <div style="color:  #FF0000;"><h4>${Errormsg}</h4>
                              
     
                              </div>
                                                                             <%
                          request.getSession().removeAttribute("Errormsg");
%>
 <div style="color:  green;"><h4>${Successmsg}</h4>
                              
     
                              </div>
                                                                             <%
                          request.getSession().removeAttribute("Successmsg");
%>
              <form onsubmit="validateForm()"  action="./contact" method="post" class="tm-call-to-action-form">                
               
                <input class="input--style-4" type="text" size="30" id = "msg" placeholder = "Enter the message..." width="00" name="msg" required >
                <button type="submit" class="btn btn-secondary">SEND</button>
              </form>
            </div>
          </div>
        </section>

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