<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String phone=(String)session.getAttribute("phone");
int otp= (Integer) session.getAttribute("otp");
String otpvalue=request.getParameter("otpvalue");
int enterOtp=Integer.parseInt(otpvalue);
if(otp==enterOtp)
{
try
{
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","suvetha2002");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into public.student(name,email,phone)values('"+name+"','"+email+"','"+phone+"')");
out.println("Thank you for register.!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
}
else
{
out.println("OTP not matched");
}
%>