

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class contact
 */
@WebServlet("/contact")
public class contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contact() {
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
		
		PrintWriter out = response.getWriter(); 
		
		try
		{
						
			String msg = request.getParameter("msg");
		    
			
            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","postgres");
            String strQuery = "INSERT INTO public.contact(\r\n"
            		+ "	complaints, currenttime)\r\n"
            		+ "	VALUES (?, CURRENT_TIMESTAMP);";
            objStmt = objConn.prepareStatement(strQuery);
            objStmt.setString(1,msg);
            System.out.println("message is"+msg);
            String str = msg;
            int i=str.length();
            System.out.println(i);
            
            if(str.trim()=="" ||str.trim()==null) {
            	// out.println("<b><h4><font color='green'>Your complaint has sent!</font></h4></b>");
             	//RequestDispatcher ds = request.getRequestDispatcher("./index.html");
           
             	//ds.include(request, response); 
            	request.getSession().setAttribute("Errormsg", "Invalid complaint!!");
           	 response.sendRedirect("index.jsp"); 
            }
            else
            {
            	 //out.println("<b><h4><font color='DarkRed'>Send a valid complaint!!</font></h4></b>");
            	// RequestDispatcher ds = request.getRequestDispatcher("./index.html");
                 
              	//ds.include(request, response);
            	
            	 request.getSession().setAttribute("Successmsg", "Complaint has been send successfully!!");
             	 response.sendRedirect("index.jsp");
                 objStmt.executeQuery(); 

            	

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
