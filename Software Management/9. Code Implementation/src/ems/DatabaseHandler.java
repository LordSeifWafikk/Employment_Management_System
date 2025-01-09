package src.ems;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseHandler {
    // Database connection details

    private static final String URL = "jdbc:sqlserver://WIN-B4JCQ04440H:1433;databaseName=EMS;integratedSecurity=true;encrypt=true;trustServerCertificate=true";

    // Method to establish a database connection
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        // Step 1: Load the JDBC driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        // Step 2: Establish a connection to the database
        return DriverManager.getConnection(URL);
    }

    // Method to execute a query and return the result set
    public ResultSet executeQuery(Connection connection, String query) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeQuery(query);
    }

    // Method to close the database resources
    public void closeResources(Connection connection, Statement statement, ResultSet resultSet) {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
            System.out.println("Database connection closed.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
