

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Changedata
 */
@WebServlet("/Changedata")
public class Changedata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Changedata() {
        super();
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
		//doGet(request, response);
		Connection objConn = null;
		PreparedStatement objStmt = null;
		
        
		try
		{
						
			String d =request.getParameter("deact");
		    String p ="0";
		    
		    String strQuery = "UPDATE public.\"Counter\"\r\n"
		    		+ "	SET value=?\r\n"
		    		+ "	WHERE \"id\"='1';";

            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","suvetha2002");
           objStmt = objConn.prepareStatement(strQuery);
           objStmt.setString(1,p);
           
           HttpSession session = request.getSession();
       	session.setAttribute("act",d);
       	request.getSession().setAttribute("successMsg", "Portal Deactivated");
		response.sendRedirect("changeAnyData.jsp");
		objStmt.executeQuery(); 
          
         
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
		try
		{
			
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
