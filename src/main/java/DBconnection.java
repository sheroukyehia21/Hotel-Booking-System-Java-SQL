import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database connection helper for the Hotel Management System.
 *
 * Configure DB_URL, DB_USER, and DB_PASSWORD through environment variables or
 * the application configuration before running the application. No credentials
 * are stored in this source file.
 */
public class DBconnection {

    private static final String URL = System.getenv().getOrDefault(
            "DB_URL",
            "jdbc:mysql://localhost:3306/hotel?useSSL=false&serverTimezone=UTC");

    public static Connection getConnection() {
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        if (user == null || user.isBlank() || password == null || password.isBlank()) {
            System.err.println(
                    "Database configuration is incomplete. Set DB_USER and DB_PASSWORD before starting the application.");
            return null;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, user, password);
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC driver not found: " + e.getMessage());
            return null;
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            return null;
        }
    }

    public static void main(String[] args) {
        try (Connection connection = getConnection()) {
            if (connection != null) {
                System.out.println("Connected successfully.");
            } else {
                System.out.println("Connection failed. Configure DB_USER and DB_PASSWORD.");
            }
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
        }
    }
}

}
