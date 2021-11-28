

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DatabaseConnection
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserLogin() {
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
		Statement objStmt = null;
        PreparedStatement p = null;
        ResultSet rs1 =null,rs2= null,rs3=null;
        PrintWriter out = response.getWriter(); 
		try
		{
						
			
			String  epicno = request.getParameter("EPIC_no");
		    String pwd = request.getParameter("password");
		    
			
            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","postgres");
            objStmt = objConn.createStatement();
            String strQuery = "INSERT INTO public.userlogin(\r\n"
            		+ "	\"EPIC_no\", password, \"CurrentTimestamp\")\r\n"
            		+ "	VALUES (?, PGP_SYM_ENCRYPT(?,'AES_KEY'),CURRENT_TIMESTAMP);";
            p = objConn.prepareStatement(strQuery);
            p.setString(1,epicno);
            p.setString(2,pwd);
            
             String q1 =  "	SELECT COUNT(*) FROM public.\"Register\" \r\n"
            		+ "WHERE LOWER(PGP_SYM_DECRYPT(password::bytea, 'AES_KEY')) LIKE LOWER('"+pwd+"') AND \"EPIC_no\" = '"+epicno+"';"; 
             rs1 = objStmt.executeQuery(q1);  
            rs1.next();
            String Countrow = rs1.getString(1);
            
            String  q3 ="SELECT value FROM public.\"Counter\"";
            rs3= objStmt.executeQuery(q3); 
            rs3.next();
            String a = rs3.getString(1);
            System.out.println(a);
            if(a.equals("1")) {
            if(Countrow.equals("0")){
            	//out.println("<b><h3><font color='DarkRed'>No records found for this data,Try to register Yourself or Enter valid data!</font></h3></b>");
            	//RequestDispatcher ds = request.getRequestDispatcher("/user.html");
               // ds.include(request, response);
                request.getSession().setAttribute("errormessage", "No records found for this data,Try to register Yourself or Enter valid data!");
           	 response.sendRedirect("user.jsp");

            }
           
            else{
            	 String q2 =  " SELECT COUNT(*)\r\n"
            	 		+ "        	FROM public.userlogin WHERE \"EPIC_no\"='"+epicno+"' AND LOWER(PGP_SYM_DECRYPT(password::bytea, 'AES_KEY')) LIKE LOWER('"+pwd+"') ;"; 
                  rs2 = objStmt.executeQuery(q2);  
                 rs2.next();
                 String Count = rs2.getString(1);
                 System.out.println(Count);
                 if(Count.equals("0")){
                	 
                     
                     HttpSession session = request.getSession();
                 	session.setAttribute("EPIC_no",epicno);
                 	request.getSession().setAttribute("SuccessMsg", "Successfully logined");
     			response.sendRedirect("voting.jsp");
     			
                     p.executeQuery();
                  	//RequestDispatcher ds = request.getRequestDispatcher("./voting.html");
                      //ds.include(request, response);
                 }
                 else {
                	
                  	//RequestDispatcher ds = request.getRequestDispatcher("/user.html");
                     // ds.include(request, response);
                	 request.getSession().setAttribute("errormessage", "Warning:You are trying to logging in again to vote");
                	 response.sendRedirect("user.jsp");
                	 
                 }
                 	
            	rs2.close();
            

        	
            } 
            }
            else
            {
            	 request.getSession().setAttribute("errormessage", "This process is closed now");
            	 response.sendRedirect("error.jsp");
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
