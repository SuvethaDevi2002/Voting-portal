import java.awt.*;
import java.applet.Applet;
@SuppressWarnings("deprecation")
public class AppletJava extends Applet{
	     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public void paint(Graphics g)
	     
	     {
	    	 int x[]= {50,150,150,150};
	    	 int y[] = {50,50,150,150};
	    	 
	    	 g.setColor(Color.black);
	    	 g.drawString("Rectangle", 300, 380);
	    	 x =new int[] {250,450,450,250};
	    	 y=new int[] {250,250,350,350};
	    	 g.drawPolygon(x,y,4);
	    	 g.setColor(Color.yellow);
	    	 g.fillPolygon(x,y,4);

	    	 
	     }
	     }
