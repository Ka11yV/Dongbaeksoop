package com.team.common;

import java.sql.Connection;
import java.sql.Statement;

public class TableInitializer {
    public static void main(String[] args) {
        String dropSql = "DROP TABLE IF EXISTS assignment";
        String sql = "CREATE TABLE IF NOT EXISTS assignment (" +
                "id INT AUTO_INCREMENT PRIMARY KEY," +
                "user_id INT," +
                "course_name VARCHAR(100)," +
                "title VARCHAR(100)," +
                "submission_status VARCHAR(50)," +
                "due_date VARCHAR(50)," +
                "time_left VARCHAR(50)," +
                "FOREIGN KEY (user_id) REFERENCES user(id)" +
                ")";

        try (Connection conn = DBUtil.getConnection();
                Statement stmt = conn.createStatement()) {
            stmt.execute(dropSql);
            stmt.execute(sql);
            System.out.println("Table 'assignment' dropped and recreated.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
