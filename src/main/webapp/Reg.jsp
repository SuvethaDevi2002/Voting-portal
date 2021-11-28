<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration page</title>
<script>
function verify()
{
	var fn= document.getElementById("fname").value;
	var ln= document.getElementById("lname").value;
	var dob= document.getElementById("Dob").value;
	if (fn.trim()!=null || fn.trim()!="")
		{
		alert('Firstname is mandatory');
        

		}
	else if (ln.trim()!=null || ln.trim()!="")
		{
		alert('Lastname is mandatory');

		}
		else
		{
		callAjax();
		}
	
	}
	function callAjax()
	{
		var fn = document.getElementById("fn").value;
		var ln = document.getElementById("ln").value;
		var str= "fn="+ fn +"&ln="+ln;
		alert(str);
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function();
		if(this.readyState ==4 && this.status ==200 )
			{
			document.getElementById("msg").innerHTML = this.responseText;
			}
	};
	xhttp.open("POST","../DatabaseConnection",true);
	xhttp.setRequestHeader("Content-type","application/x-www.form-urlencoded");
	xhttp.send(str);
</script>
</head>
<body background-color = "aqua">
<form id = "verify"  method="post" >
<div id = "error"></div>
<table border="1">
<tr>
<td align ="left"> First Name:</td>
<td align="left"> <input type="text" id = "fname" name ="fname" maxlength="10"/></td>
</tr>
<tr>
<td align="right"> Last Name:</td>
<td align="right"> <input type="text" id = "lname" name ="lname" maxlength="10"/></td>
</tr>
<tr>
<td align="right"> DOB:</td>
<td align="right"> <input type="text" id = "Dob" name ="Dob" maxlength="10"/>(dd-mm-yyyy)</td>
</tr>

<tr>

<td colspan ="2" align = "center"> <input type="submit" id = "sub" name ="Submit" onclick = "verify()"/></td>
</tr>

</table>
<div id = "msg"></div>
</form>


</body>
</html>

