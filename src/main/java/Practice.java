import java.util.Scanner;
import java.lang.Math;
public class Practice {
	public static int total(int n)
	{
		int t=0;
		while(n!=0)
		{
			t=t+n;
			n--;
		}
		return t;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the number of terms to be displayed:");
	    int  n = sc.nextInt();
		int sum = 0;
		
			for(int i=1;i<=n;i++)
			{
				sum = sum+(total(i));
			}
      	}
	

}
