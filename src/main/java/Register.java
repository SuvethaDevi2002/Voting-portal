

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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		    String n = request.getParameter("name");
		    String d = request.getParameter("dob");
		    String g = request.getParameter("gender");
		    int s = Integer.parseInt(request.getParameter("serial_noSS"));
		    int w = Integer.parseInt(request.getParameter("Ward_no"));
		    String ph = request.getParameter("phone");
		    String p = request.getParameter("password");
		    
			
            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","postgres");
           st = objConn.createStatement();
            
            String strQuery = "INSERT INTO public.\"Register\"(\r\n"
            		+ "	\"EPIC_no\", \"Name\", \"DOB\", \"Gender\", \"Ward_no\", \"Serial_no\", phone_no, password, \"Currenttime\")\r\n"
            		+ "	VALUES (?, ?, ?, ?, ?, ?, ?, PGP_SYM_ENCRYPT(?,'AES_KEY'), CURRENT_TIMESTAMP);";
            objStmt = objConn.prepareStatement(strQuery);
            objStmt.setString(1,e);
            objStmt.setString(2,n);
            objStmt.setString(3,d);
            objStmt.setString(4,g);
            objStmt.setInt(5,w);
            objStmt.setInt(6,s);
            objStmt.setString(7,ph);
            objStmt.setString(8,p);
            
              String q1 =  "SELECT COUNT(*)\r\n"
            		+ "	FROM public.\"Register\" WHERE  \"EPIC_no\" = '"+e+"'  ;"; 
            rs1 = st.executeQuery(q1);  
            rs1.next();
            String Countrow = rs1.getString(1);
            System.out.println(Countrow);
            
            if(Countrow.equals("0")){
            	//out.println("<b><h3><font color='green'>You are successfully registered!</font></h3></b>");
            	//RequestDispatcher ds = request.getRequestDispatcher("/user.html");
               // ds.include(request, response);
            	
            	request.getSession().setAttribute("successmessage", "Registered successfully!!");
              	 response.sendRedirect("user.jsp");
              	objStmt.executeQuery();
                
            	
            }
            else{
            	//out.println("<b><h3><font color='DarkRed'>You have already registered,Please go and login yourself!</font></h3></b>");
            	//RequestDispatcher ds = request.getRequestDispatcher("/user.html");
                //ds.include(request, response);
            	request.getSession().setAttribute("errorMsg", "You have already registered!!");
              	 response.sendRedirect("register.jsp");
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


