import java.rmi.*;
public interface RemoteInterface extends Remote {
	int factorial(int x) throws RemoteException;

}
