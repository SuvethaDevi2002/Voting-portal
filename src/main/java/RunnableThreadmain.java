
public class RunnableThreadmain {
	
	public static void main(String s[])
	{
		System.out.println("Main Thread");
		RunnableThread R = new RunnableThread();
		Thread tc = new Thread(R);
		tc.start();
		System.out.println("Successfull");
	}

}
