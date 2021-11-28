

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DatabaseConnection
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection objConn = null;
		PreparedStatement objStmt = null;
		Statement s =null;
		ResultSet rs1 = null;
		PrintWriter out = response.getWriter(); 
		
		try
		{
						
			String Login = request.getParameter("Login_id");
		    String Pw = request.getParameter("password");
			
            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","postgres");
            String strQuery = "INSERT INTO public.adminlogin(\r\n"
            		+ "	\"Loginid\", password, \"Currenttimestamp\")\r\n"
            		+ "	VALUES (?, crypt(?, gen_salt('bf')),CURRENT_TIMESTAMP);";
            objStmt = objConn.prepareStatement(strQuery);
            objStmt.setString(1,Login);
            objStmt.setString(2,Pw);
            String a = "19876";
            String b = "Admin20";
            String q1 =  "	SELECT COUNT(*) FROM public.\"adminlogin\" \r\n"
            		+ "WHERE  \"Loginid\" = '19876';"; 
            s = objConn.createStatement();
            rs1 = s.executeQuery(q1);  
            rs1.next();
            String Countrow = rs1.getString(1);
            System.out.println(Countrow);
            if(Countrow.equals("0"))
            {
            if(Login.equals(a) && Pw.equals(b) )
            {
            	HttpSession session = request.getSession();
            	session.setAttribute("Loginid",Login);
            	request.getSession().setAttribute("successMsg", "Success");
			response.sendRedirect("admin view.jsp");
			 objStmt.executeQuery(); 
		}
              else {
            	
            	
            	//RequestDispatcher ds = request.getRequestDispatcher("./admin.html");
          
            	//ds.include(request, response);   
            	request.getSession().setAttribute("errorMsg", "Please enter the valid data");
            	response.sendRedirect("admin.jsp");
            	//out.println("<b><h4><font color='DarkRed'>Oops! Enter a valid data!</font></h4></b>");
            	}
}
            else
            {
            	HttpSession session = request.getSession();
            	session.setAttribute("Loginid",Login);
            	request.getSession().setAttribute("errorMsg", "Already logined with another device");
			response.sendRedirect("admin.jsp");

            	
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
			rs1.close();
		   objStmt.close();
		   objConn.close();
		}
		catch (SQLException e)
		{
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
			
		}

			}
	

}
