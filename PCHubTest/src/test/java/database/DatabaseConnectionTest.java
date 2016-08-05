package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

public class DatabaseConnectionTest {
	protected Connection connection;
	protected Statement statement;
	
	@BeforeMethod
	public void beforeMethod() throws SQLException {
		
		try {
		//url = jdbc:sqlite:sqlite_database_file_path
		String url = "jdbc:sqlite:"
				+ pchub.utilities.Constants.dbFilePath;	
			Class.forName("org.sqlite.JDBC");
			connection = DriverManager.getConnection(url);
			statement = connection.createStatement();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@AfterMethod
	public void afterMethod() throws Exception {
		connection.close();
	}
}
