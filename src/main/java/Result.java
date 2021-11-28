import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Result {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection objconn = null;
		Statement objStmt = null;

		 ResultSet objRS  = null;
			try { 
				int a=0,d=0,m=0,n=0,b=0,p= 0;
				
				Class.forName("org.postgresql.Driver");
				objconn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","suvetha2002");
				objStmt = objconn.createStatement();
				String strquery = "SELECT \"Ward_no\",COUNT(\"vote\")\r\n"
						+ "	FROM public.vote WHERE \"vote\"='admk' GROUP BY \"Ward_no\";";
				objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
					  a=a+objRS.getInt(2);
						System.out.println("Ward number : "+objRS.getInt(1) +" admk=" + objRS.getInt(2));
					}
				 strquery = "SELECT \"Ward_no\",COUNT(\"vote\")\r\n"
				 		+ "	FROM public.vote WHERE \"vote\"='dmk' GROUP BY \"Ward_no\";";
				objRS = objStmt.executeQuery(strquery);
				while(objRS.next()){
					d = d+objRS.getInt(2);
					System.out.println("Ward number : " + objRS.getInt(1) +" dmk= " + objRS.getInt(2));
				}
				 strquery = "SELECT \"Ward_no\",COUNT(\"vote\")\r\n"
				 		+ "	FROM public.vote WHERE \"vote\"='mnm' GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
					 m = m+objRS.getInt(2);
						System.out.println("Ward number : "+objRS.getInt(1) +" mnm=" + objRS.getInt(2));
					}
				 strquery = "SELECT \"Ward_no\",COUNT(\"vote\")\r\n"
				 		+ "	FROM public.vote WHERE \"vote\"='ntk' GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
					 n = n+objRS.getInt(2);
						System.out.println("Ward number : "+objRS.getInt(1) +" ntk=" + objRS.getInt(2));
					}
				 strquery = "SELECT \"Ward_no\",COUNT(\"vote\")\r\n"
				 		+ "	FROM public.vote WHERE \"vote\"='bjp' GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
					 b = b+objRS.getInt(2);
						System.out.println("Ward number : "+objRS.getInt(1) +" bjp=" + objRS.getInt(2));
					}
				 strquery = "SELECT \"Ward_no\",COUNT(\"vote\")\r\n"
				 		+ "	FROM public.vote WHERE \"vote\"='pmk' GROUP BY \"Ward_no\";";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
					 p = p+objRS.getInt(2);
						System.out.println("Ward number : "+objRS.getInt(1) +" pmk=" + objRS.getInt(1));
					}				}
				catch(Exception e)
				{
					e.printStackTrace();
					}
				finally
				{
					try
					{
						objRS.close();
						objStmt.close();
						objconn.close();
						
					}
					catch(SQLException e)
					{
						e.printStackTrace();
					}
				}
	}

}
