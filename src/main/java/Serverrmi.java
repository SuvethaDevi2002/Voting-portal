import java.rmi.*;
import java.rmi.server.UnicastRemoteObject;
public class Serverrmi extends UnicastRemoteObject implements RemoteInterface{
	public Serverrmi() throws RemoteException{
		super();
	}
	public int factorial (int x) throws RemoteException{
		if(x==0||x==1)
		{
			return 1;
		}
		else
		{
			return x*factorial(x-1);
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Serverrmi remoteServer =  new Serverrmi();
			Naming.rebind("MyServer", remoteServer);
			System.out.println("System is ready");
		}
		catch (Exception e)
		{
			System.out.println(e);
		}

	}

}
