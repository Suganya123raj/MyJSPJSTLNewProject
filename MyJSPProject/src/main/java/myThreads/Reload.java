package myThreads;
import myData.*;
import java.sql.*;

public class Reload implements Runnable{
	
	
	GetData g;
	
	public Reload(GetData g)
	{
		this.g=g;
	}
	
	
	public void run()
	{
		synchronized(g)
		{
			g.returnResultSet();
		}
	}

}
