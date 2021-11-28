<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Tamilnadu Government Election</title>
     <script>
     function validateForm()
     {
     	var e= document.getElementById("EPIC_no").value;
     	var pd= document.getElementById("pd").value;
     	var pw= document.getElementById("pw").value;
     	
     	
     	if (e.trim()==null || e.trim()=="")
     		{
     		alert('EPIC number is invalid');
             

     		}
     	else if (pd.trim()==null || pd.trim()=="")
 		{
 		alert('Password is invalid');
         

 		}
     	else if (pw.trim()==null || pw.trim()=="")
     		{
     		alert('Password is invalid');
             

     		}

     	

     
     }
    function myFunction() {
  	  var x = document.getElementById("pd");
  	  if (x.type === "password") {
  	    x.type = "text";
  	  } else {
  	    x.type = "password";
  	  }
  	}
    function myFun() {
    	  var x = document.getElementById("pw");
    	  if (x.type === "password") {
    	    x.type = "text";
    	  } else {
    	    x.type = "password";
    	  }
    	}</script>

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
<style>
/* Style all input fields */
input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
}

/* Style the submit button */
input[type=submit] {
  background-color: #04AA6D;
  color: white;
}

/* Style the container for inputs */
.container {
  background-color: #f1f1f1;
  padding: 20px;
}

/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 35px;
  font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: & #10004;
}

/* Add a red text color and an "x" icon when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: & #10006;
}
</style>

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
                      <a class="nav-link" href="index.jsp">HOME </a>
                    </li>
                   
                    
                    
                    <li class="nav-item">
                      <div class="tm-nav-link-highlight"></div>
                      <a class="nav-link" href="user.jsp">USER LOGIN</a>
                    </li>

                  </ul>
                </div>
              </nav>
            </div>
          </div>
        </div>
        <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
            <div class="wrapper wrapper--w680">
                <div class="card card-4">
                    <div class="card-body">
                     
                  
                               <div style="color:  #FF0000;"><h4>${errorMsg}</h4>
                              
     
                              </div>
                                                                             <%
                          request.getSession().removeAttribute("errorMsg");
%>
                              
                              
                              
                        <h2 class="title">Reset your Password</h2>
                        <form onsubmit="validateForm()" action = "./reset" method="POST">
                            <div class>
                              
                                <div class>
                                    <div class="input-group">
                                        <label class="label">EPIC Number</label>
                                        <input class="input--style-4" id="EPIC_no" type="text" width="00" name="epic_no" placeholder = "Enter the EPIC number" pattern="(?=.*[0-9]).{10,}"
                                        title="Enter a valid EPIC number"required>
                                    </div>
                                </div>
                                
                                <div class=>
                                    <div class="input-group">
                                        <label class="label">Create New Password</label>
                                        <input class="input--style-4" type="password" id="pd" name="password" placeholder = "Enter the Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                         title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required><br>
                                    </div>
                                               <label class="radio-container">Show password
                                                <input type="radio" onclick="myFunction()"><br>
                                                <span class="checkmark"></span>
                                                </label>
                                    <div id="message">
                                      <h3>Password must contain the following:</h3>
                                      <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                      <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                      <p id="number" class="invalid">A <b>number</b></p>
                                      <p id="length" class="invalid">Minimum <b>8 characters</b></p>
                                    </div>
                                </div>
                                <div class=>
                                    <div class="input-group">
                                        <label class="label">Re-Enter Password</label>
                                        <input class="input--style-4" id = "pw" type="password" placeholder = "Re-enter the passsword" name="phone" required><br>
                                    </div>
                                </div>
                            </div>
                                                                      <label class="radio-container">Show password
                                                <input type="radio" onclick="myFun()"><br>
                                                <span class="checkmark"></span>
                                                </label>
                            <div class="input-group">
                               
                            </div>
                            <div class="p-t-15">
                                <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button><br>
                            </div>
                        </form>
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
    
    <script>
      var myInput = document.getElementById("pd");
      var letter = document.getElementById("letter");
      var capital = document.getElementById("capital");
      var number = document.getElementById("number");
      var length = document.getElementById("length");
      
      // When the user clicks on the password field, show the message box
      myInput.onfocus = function() {
        document.getElementById("message").style.display = "block";
      }
      
      // When the user clicks outside of the password field, hide the message box
      myInput.onblur = function() {
        document.getElementById("message").style.display = "none";
      }
      
      // When the user starts to type something inside the password field
      myInput.onkeyup = function() {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if(myInput.value.match(lowerCaseLetters)) {
          letter.classList.remove("invalid");
          letter.classList.add("valid");
        } else {
          letter.classList.remove("valid");
          letter.classList.add("invalid");
      }
      
        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if(myInput.value.match(upperCaseLetters)) {
          capital.classList.remove("invalid");
          capital.classList.add("valid");
        } else {
          capital.classList.remove("valid");
          capital.classList.add("invalid");
        }
      
        // Validate numbers
        var numbers = /[0-9]/g;
        if(myInput.value.match(numbers)) {
          number.classList.remove("invalid");
          number.classList.add("valid");
        } else {
          number.classList.remove("valid");
          number.classList.add("invalid");
        }
      
        // Validate length
        if(myInput.value.length >= 8) {
          length.classList.remove("invalid");
          length.classList.add("valid");
        } else {
          length.classList.remove("valid");
          length.classList.add("invalid");
        }
      }
      </script>
      <script>
        var password = document.getElementById("pd")
  , confirm_password = document.getElementById("pw");

function validatePassword(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
      </script>
  </body>
</html>