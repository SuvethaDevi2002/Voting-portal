

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
       // PrintWriter out=response.getWriter();  
        Connection objConn = null;
		Statement objStmt = null;
       // ResultSet rs1 = null;
        try {
       Class.forName("org.postgresql.Driver");
       objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","postgres");
       objStmt = objConn.createStatement();
        String q1 =  "TRUNCATE  TABLE public.adminlogin;";
         objStmt.executeUpdate(q1);
         
        HttpSession session=request.getSession(); 
        session.removeAttribute("Loginid");
        session.invalidate(); 
        request.getSession().setAttribute("successmsg", "Sucessfully logged out");
        response.sendRedirect("admin.jsp");
       // out.println("<b><h3><font color='green'>You are successfully logged out!</font></h3></b>");
       // request.getRequestDispatcher("/index.html").include(request, response);  
         
        //out.close();
        }
        catch(Exception e)
		{
			e.printStackTrace();
		}

        finally
		{
		try
		{
			
			//rs1.close();	
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
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
