import java.util.Scanner;
public class Palindrome {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str, rev = "" ;
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a string to check whether it is a palindrome or not:");
		str = sc.nextLine();
		int l = str.length();
		for (int i = l-1;i>=0;i--)
		{
			rev = rev+str.charAt(i);
		}
		if(str.equalsIgnoreCase(rev))
		{
			System.out.println(str + "  is a Palindrome");
		}
		else
		{
			System.out.println(str + " is not a Palindrome");
		}

	}

}
