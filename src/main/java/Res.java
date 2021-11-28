import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Res {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection objconn = null;
		Statement objStmt = null;

		 ResultSet objRS  = null;
			try { 
				int a=1,d=1,m=1,n=1,b=1,p= 1,y=1,c=1,s=1,o=1;
				String x = null, z = null, u = null, v = null, q = null, r = null, j = null,k = null, g = null,h = null , temp1 = null,temp2 = null,
						temp3 = null,temp4 = null, temp5=null,temp6 = null, e = null,f = null, i = null,l=null;
				
				Class.forName("org.postgresql.Driver");
				objconn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","postgres");
				objStmt = objconn.createStatement();
				String  strquery = "SELECT MAX(PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY')),\r\n"
						+ "	COUNT(\"vote\") \r\n"
						+ "	FROM public.vote WHERE \"Ward_no\" = '1' GROUP BY PGP_SYM_DECRYPT(\"vote\"::bytea, 'AES_KEY');" ;
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				            if(a!=2) {
				               x = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +"  maximum votes  scored in Ward number: 1 is  " + objRS.getInt(2));
					}	
				            else {
				            	z = objRS.getString(2);
				            	if(x.equals(z))
				            	{
				            		System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 1 is  " + objRS.getInt(2));
				            		
				            	}
				            	
				            }
				            a=a+1;
				 }
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '2' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(d!=2) {
				        	 u=objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +"  maximum votes  scored in Ward number: 2 is " + objRS.getInt(2));
					}	
				         else
				         {
				        	 v=objRS.getString(2);
				        	 if(u.equals(v))
				        	 {
				        		 System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 2 is  " + objRS.getInt(2));
				        	 }
				         }
				         d=d+1;
				 }
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '3' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(b!=2) {
				        	 q = objRS.getString(2);
				        	 
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 3 is " + objRS.getInt(2));
					}	
				         else
				         {
				        	 r = objRS.getString(2);
				        	 
				        	 if(q.equals(r))
				        	 {
				        		 System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 3 is  " + objRS.getInt(2));
				        	 }
				         }
				         b=b+1;}
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '4' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				           if(c!=2) {
				        	   j = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 4 is " + objRS.getInt(2));
					}	
				           else
				           {   k = objRS.getString(2);
				        	   if(j.equals(k))
				        	   {
				        		   System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 4 is  " + objRS.getInt(2));
				        	   }
				           }
				           c=c+1;}
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '5' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(p!=2) {
				        	 g = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 5 is " + objRS.getInt(2));
					}	
				         else
				         {
				        	 h = objRS.getString(2);
				        	 if(g.equals(h)) {
				        		 System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 5 is  " + objRS.getInt(2));
				        	 }
				         }
				         p=p+1;}
				         strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '6' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(n!=2) {
				        	temp1 = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 6 is " + objRS.getInt(2));
					}	
				        else
				        {
				        	temp2 = objRS.getString(2);
				        	if(temp1.equals(temp2))
				        	{
				        		System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 6 is  " + objRS.getInt(2));
				        	}
				        }
				        n=n+1;}
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '7' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				         if(m!=2) {
				        	 temp3 = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 7 is " + objRS.getInt(2));
					}	
				         else
				         {
				        	 temp4 = objRS.getString(2);
				        	 if(temp3.equals(temp4))
				        	 {
				        		 System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 7 is  " + objRS.getInt(2));
				        	 }
				         }
				         m=m+1;
				 }
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '8' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(o!=2) {
				        	temp5 = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 8 is " + objRS.getInt(2));
					}
				        else
				        {
				        	temp6 = objRS.getString(2);
				        	if(temp5.equals(temp6))
				        	{
				        		 System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 8 is  " + objRS.getInt(2));
				        	}
				        }
				        o = o+1;}
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '9' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(s!=2) {
				        	e = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 9 is " + objRS.getInt(2));
				    
				 }	
				        else
				        {
				        	f = objRS.getString(2);
				        	if(e.equals(f))
				        	{
				        		 System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 9 is  " + objRS.getInt(2));
				        	}
				        }
				        s=s+1;}
				 strquery = "SELECT MAX(\"vote\"),COUNT(\"vote\") FROM public.vote WHERE \"Ward_no\" = '10' GROUP BY \"vote\"";
				 objRS = objStmt.executeQuery(strquery);
				 while(objRS.next()){
				        if(y!=2) {
				        	i = objRS.getString(2);
						System.out.println("Party : "+objRS.getString(1) +" maximum votes  scored in Ward number: 10 is " + objRS.getInt(2));
					}	
				        else
				        {
				        	l = objRS.getString(2);
				        	if(i.equals(l))
				        	{
				        		 System.out.println("Party : "+objRS.getString(1) +"  scored equal votes  in Ward number: 10 is  " + objRS.getInt(2));
				        	}
				        }
				     y=y+1;
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



