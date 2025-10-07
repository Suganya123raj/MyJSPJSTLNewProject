package myData;
import java.sql.*;

public class GetData {
	
	Connection con;
	public ResultSet rs;
	
	public GetData(Connection con)
	{
	this.con=con;	
	}
	
	public ResultSet returnResultSet()
	{
		
		try
		{
		Statement st=con.createStatement();
		rs=st.executeQuery("select * from employees");
		
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		
		return rs;
		
		
		
	}

}
