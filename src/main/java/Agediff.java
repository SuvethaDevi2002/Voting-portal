

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Agediff
 */
@WebServlet("/Agediff")
public class Agediff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Agediff() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 PrintWriter out = response.getWriter();
	        response.setContentType("text/html");
	        out.print("<html><head></head><body>"
	                + "<form method=\"get\">\n"
	                //+ "<form action=\"Servlets/src/main/webapp/WEB_INF/Verify.jsp\" method=\"get\">\n"
	                + "<div align=\"center\"><tr><td> DOB : </td>\n"
	                + "<td><input type=\"date\" id=\"dob\" name=\"dob\" maxlength=\"10\"/></td>\n"
	                + "</tr>"
	                + "<tr>\n"
	                + "<td colspan=\"2\" align=\"center\"><input type=\"submit\" id=\"sub\" name=\"sub\" value=\"Submit\"/>\n"
	                + "</td></tr></div>\n"
	                + "</body></html>");
	        String strDOB = request.getParameter("dob");
	        LocalDate oDate = LocalDate.parse(strDOB);
	        LocalDate cDate = LocalDate.now();
	        Period diff = Period.between(oDate, cDate);
	        int ageDiff = diff.getYears();
	        int m = diff.getMonths();
	        int d = diff.getDays();
	        if(strDOB.length()>0)
	        {       
	            out.print("<h2 align=\"center\">" + " Age Difference: "+ageDiff+" Years "+m+" Months "+d+"Days"+"</h2>");
	        }
	        else
	        {
	            out.print(" unsuccesfully logined ");
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
