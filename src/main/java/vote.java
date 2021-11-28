

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
 * Servlet implementation class vote
 */
@WebServlet("/vote")
public class vote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vote() {
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
		Statement s = null;
		PreparedStatement objStmt = null;
		 PrintWriter out = response.getWriter(); 
		ResultSet rs1 = null,rs2=null, rs3=null;
		try
		{
						
			String e = request.getParameter("EPIC_no");
		    System.out.println(e);
		    int w = Integer.parseInt(request.getParameter("Ward_no"));
		    String g = request.getParameter("vote");
		   
		    
			
            Class.forName("org.postgresql.Driver");
            objConn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","postgres");
            s= objConn.createStatement();
            String strQuery = "INSERT INTO public.vote(\r\n"
            		+ "	\"EPIC_no\", \"Ward_no\", vote, \"currentTime\")\r\n"
            		+ "	VALUES (?, ?, PGP_SYM_ENCRYPT(?, 'AES_KEY')\r\n"
            		+ ", CURRENT_TIMESTAMP);";
            objStmt = objConn.prepareStatement(strQuery);
            objStmt.setString(1,e);
            objStmt.setInt(2,w);
            objStmt.setString(3,g);
            String q1 =  "SELECT COUNT(*)\r\n"
            		+ "	FROM public.\"vote\" WHERE \"EPIC_no\" = '"+e+"';"; 
             rs1 = s.executeQuery(q1);  
            rs1.next();
            String Countrow = rs1.getString(1);
            System.out.println(Countrow);
            String q2 = "SELECT COUNT(*)\r\n"
        			+ "	FROM public.\"userlogin\" WHERE \"EPIC_no\"='"+e+"'  ;";
        	rs2 = s.executeQuery(q2);  
            rs2.next();
            String Count = rs2.getString(1);
            System.out.println(Count);
            String q3 = "	SELECT COUNT(*) FROM public.\"Register\"\r\n"
            		+ "      WHERE  \"EPIC_no\" = '"+e+"' AND \"Ward_no\" ='"+w+"';";
            rs3 = s.executeQuery(q3);  
            rs3.next();
            String c = rs3.getString(1);
           
            if(Countrow.equals("0")){
            	//out.println("<b><h3><font color='green'>Your vote saved successfully!</font></h3></b>");
                //RequestDispatcher ds = request.getRequestDispatcher("./index.html");
                 //ds.include(request, response);
           
            	
                
            	if(Count.equals("0")) {
            	request.getSession().setAttribute("ErrorMsg", "No records found!!");
           	 response.sendRedirect("user.jsp");
                 
                 } 
            	else
            	{
            		 if(c.equals("1")) {
            		request.getSession().setAttribute("SuccessMsg", "Your vote is saved successfully!!");
                  	 response.sendRedirect("voting.jsp");
                  	objStmt.executeQuery();}
            		 else {
                     	request.getSession().setAttribute("errormsg", "WARNING: Entering invalid Ward number!!");
                       	 response.sendRedirect("voting.jsp");	
                     }
            	}
            		
            	
            }
            else
            {
            	//out.println("<b><h3><font color='DarkRed'>Warning:You are trying to vote again!</font></h3></b>");
                //RequestDispatcher ds = request.getRequestDispatcher("./user.html");
                // ds.include(request, response);
            	request.getSession().setAttribute("errormsg", "WARNING: You are trying to vote again!!");
           	 response.sendRedirect("voting.jsp");
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
			rs2.close();
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
