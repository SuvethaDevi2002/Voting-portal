

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

/**
 * Servlet implementation class DatabaseConnection
 */
@WebServlet("/DatabaseConnection")
public class DatabaseConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DatabaseConnection() {
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

		
		try
		{
						
			String fnam = request.getParameter("fname");
			String lnam = request.getParameter("lname");
			String d = request.getParameter("Dob");
			
            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","suvetha2002");
            String strQuery = "INSERT INTO public.\"Details\"("
            		+ "	firstname, lastname, \"DOB\")"
            		+ "	VALUES (?, ?, ?);";
            objStmt = objConn.prepareStatement(strQuery);
            objStmt.setString(1,fnam);
            objStmt.setString(2,lnam);
            objStmt.setString(3,d);
            System.out.println("Successfull!");
			
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
