
import java.awt.*;
public class Gui {

	public static void main(String S[]) {

		Frame F= new Frame("Register");
		F.setSize(300, 400);
		F.setBackground(Color.GRAY);
		F.setLayout(new FlowLayout(FlowLayout.LEFT));
		                     
		Label t = new Label("First name");   
		TextField tf = new TextField(30);
		
		
		Label t1 = new Label("Last Name");   
		TextField tf1 = new TextField(30);
		
		
		Label t2 = new Label("Email");   
		TextField tf2 = new TextField(50);
		
		Button btn2 = new Button("SUBMIT");
		
		F.add(t);
		F.add(tf);
		//F.add(btn);
		F.add(t1);
		F.add(tf1);
		F.add(btn2);
		
		F.setVisible(true);
	}
}
