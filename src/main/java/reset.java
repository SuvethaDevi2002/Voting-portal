

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class reset
 */
@WebServlet("/reset")
public class reset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reset() {
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
		Statement st = null;
        ResultSet rs1 = null;
        PrintWriter out = response.getWriter(); 
		try
		{
						
			String e =request.getParameter("epic_no");
		    String p = request.getParameter("password");
		    
			
            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","suvetha2002");
           st = objConn.createStatement();
            
            String strQuery = "UPDATE public.\"Register\"\r\n"
            		+ "	SET  \"password\"= PGP_SYM_ENCRYPT('"+p+"','AES_KEY')\r\n"
            		+ "	WHERE \"EPIC_no\"='"+e+"';";
            objStmt = objConn.prepareStatement(strQuery);
            
            String q1 =  "SELECT *\r\n"
            		+ "	FROM public.\"Register\" WHERE \"EPIC_no\"='"+e+"';"; 
            rs1 = st.executeQuery(q1); 
            
            if(rs1.next()) {
                //out.println("<b><h3><font color='green'>Resetted the password</font></h3></b>");
               // RequestDispatcher ds = request.getRequestDispatcher("/user.html");
               // ds.include(request, response);
                request.getSession().setAttribute("successmessage", "Successfully! Resetted the password");
     			response.sendRedirect("user.jsp");
                objStmt.executeQuery();
           }
            else
            {
            	 request.getSession().setAttribute("errormsg", "No records are found!!");
            	 response.sendRedirect("reset.jsp");

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
