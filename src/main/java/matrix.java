import java.util.Scanner;
public class matrix {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the no of rows:");
		int rows = sc.nextInt();
		System.out.println("Enter the no of columns:");
		int cols= sc.nextInt();
		int matrix[][]= new int [rows][cols];
		System.out.println("Enter the elements:");
		for(int i = 0;i<rows;i++)
		{
			for (int j = 0;j<cols;j++)
			{
				matrix[i][j] = sc.nextInt();
			}
		}
		System.out.println("The input matrix :");
		for(int i = 0;i<rows;i++)
		{
			for (int j = 0;j<cols;j++)
			{
				System.out.print(matrix[i][j]+"\t");
			}
			System.out.println();
		}
        //SYMMETRIC CHECKING
		
		if(rows!=cols) {
			System.out.println("The given matrix is not a square matrix, The square matrix cannot be a symmetric!!");
		}
		else
		{
			boolean symm = true;
			for(int i = 0;i<rows;i++)
			{
				for (int j = 0;j<cols;j++)
				{
					if(matrix[i][j]!=matrix[j][i])
					{
						symm = false;
						break;
					}
				}
				System.out.println();
			}
			
			
			if(symm)
			{
				System.out.print("The given matrix is symmetric");
			}
			else
			{
				System.out.print("The given matrix is not a symmetric !!");
			}
			
		}
		sc.close();
		
		

	}

}
