package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnector implements DBConnector {
	private final String ADDRESS = "jdbc:mysql://localhost:3306/sqlbasic";
	private final String USERNAME = "root";
	private final String PASSWORD = "1111";
	private final String CLASS_NAME = "com.mysql.cj.jdbc.Driver";

	@Override
	public Connection makeConnection() {
		try {
			Class.forName(CLASS_NAME);
			Connection connection = DriverManager.getConnection(ADDRESS, USERNAME, PASSWORD);

			return connection;

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
