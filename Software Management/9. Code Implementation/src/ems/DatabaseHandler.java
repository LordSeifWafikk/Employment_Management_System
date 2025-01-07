package src.ems;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseHandler {
    // Database connection details

    private static final String URL = "jdbc:sqlserver://WIN-B4JCQ04440H:1433;databaseName=EMS;integratedSecurity=true;encrypt=true;trustServerCertificate=true";

    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the JDBC driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            //  Establish a connection to the database
            connection = DriverManager.getConnection(URL);
            System.out.println("Connected to the database!");

            //  Create a statement
            statement = connection.createStatement();

            //  Execute a query
            String query = "SELECT * FROM Employee";
            resultSet = statement.executeQuery(query);

            //  Process the result set
            System.out.println("Employee Data:");
            while (resultSet.next()) {
                int employeeID = resultSet.getInt("EmployeeID"); // Ensure this matches the column name
                String name = resultSet.getString("Name"); // Ensure this matches the column name
                String position = resultSet.getString("Position"); // Ensure this matches the column name
                String department = resultSet.getString("DepartmentID"); // Ensure this matches the column name

                System.out.println("ID: " + employeeID + ", Name: " + name + ", Position: " + position + ", Department: " + department);
            }
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error connecting to the database!");
            e.printStackTrace();
        } finally {
            //  Close the resources
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
}