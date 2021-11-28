import java.rmi.*;
public class Clientrmi {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try 
		{
			RemoteInterface obj = (RemoteInterface) 
					Naming.lookup("//localhost/MyServer");
			int no = obj.factorial(4);
			System.out.println("The factorial is:" + no);
		}
		
		catch(Exception e)
		{
	         System.out.println(e);		
		}

	}

}
