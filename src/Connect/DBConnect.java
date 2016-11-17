package Connect;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost/usniper?useUnicode=yes&characterEncoding=UTF-8","root","");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
