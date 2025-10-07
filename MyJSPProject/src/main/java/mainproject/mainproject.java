package mainproject;

import jakarta.servlet.*;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import myData.*;
import java.util.concurrent.*;
import myThreads.*;


/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class mainproject implements ServletContextListener {

    /**
     * Default constructor. 
     */
	ScheduledExecutorService se;
	Connection con;
	public mainproject() {
        // TODO Auto-generated constructor stub
    }
    
    public void contextInitialized(ServletContextEvent sce)
    {
    	
    	ServletContext sc=sce.getServletContext();
    	
    	try
    	{
    	InitialContext ic=new InitialContext();
    	DataSource dc=(DataSource)ic.lookup("java:/comp/env/jdbc/TestDB");
    	con=dc.getConnection();
    	
    	GetData g=new GetData(con);
    	
    	g.returnResultSet();
    	sc.setAttribute("myResults", g);
    	
    	se=Executors.newSingleThreadScheduledExecutor();
    	
    	se.scheduleAtFixedRate(new Reload(g), 0, 1, TimeUnit.SECONDS);
    	
    	}
    	catch(NamingException ne)
    	{
    		ne.printStackTrace();
    	}
    	catch(SQLException se)
    	{
    		se.printStackTrace();
    	}
    	
    }
    
    public void contextDestroyed(ServletContextEvent sce)
    {
    	
    	
    	try
    	{
    		con.close();
    		
    	}
    	catch(SQLException se)
    	{
    		se.printStackTrace();
    	}
    }
    
	
}
