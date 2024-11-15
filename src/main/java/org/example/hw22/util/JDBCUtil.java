package org.example.hw22.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private static Connection conn = null;

    public static Connection getConnection() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/OSS24_22100575?user=OSS24_22100575&password=GiMaith3");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Database connection error", e);
        }
        return conn;
    }

    public static void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                conn = null; // Reset the connection to ensure it can be re-established
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error closing connection", e);
        }
    }

    public static void main(String[] args) {
        Connection conn = JDBCUtil.getConnection();
        if (conn != null) {
            System.out.println("DB연결 완료");
            JDBCUtil.closeConnection();
        }
    }
}
