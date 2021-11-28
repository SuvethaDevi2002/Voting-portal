<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.time.LocalTime"%>
<%@ page import ="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Date display</title>
</head>
<body>
<%
Date d = new Date();
SimpleDateFormat ft = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a");
%>
<h1><%= ft.format(d)%></h1>
</body>
</html>