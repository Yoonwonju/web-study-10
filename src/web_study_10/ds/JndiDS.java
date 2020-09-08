package web_study_10.ds;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JndiDS {
	private static DataSource ds;
	
	private JndiDS() {}
	
	static {
		try {
			InitialContext ic = new InitialContext();
			ds = (DataSource) ic.lookup("java:comp/env/jdbc/webstudy09");
			System.out.println("ds : " + ds);
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			return ds.getConnection();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}

