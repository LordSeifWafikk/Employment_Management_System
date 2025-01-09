package src.ems;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        DatabaseHandler dbHandler = new DatabaseHandler();
        Connection connection = null;
        ResultSet resultSet = null;

        try {
            // Get a database connection
            connection = dbHandler.getConnection();
            System.out.println("Connected to the database!");

            //  Execute a query
            String query = "SELECT * FROM Employee";
            resultSet = dbHandler.executeQuery(connection, query);

            // Process the result set
            System.out.println("Employee Data:");
            while (resultSet.next()) {
                int employeeID = resultSet.getInt("EmployeeID"); // Ensure this matches the column name
                String name = resultSet.getString("Name"); // Ensure this matches the column name
                String position = resultSet.getString("Position"); // Ensure this matches the column name
                String department = resultSet.getString("DepartmentID"); // Ensure this matches the column name

                System.out.println("ID: " + employeeID + ", Name: " + name + ", Position: " + position + ", DepartmentID: " + department);
            }
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error connecting to the database!");
            e.printStackTrace();
        } finally {
            //  Close the resources
            dbHandler.closeResources(connection, null, resultSet);
        }
    }
}

