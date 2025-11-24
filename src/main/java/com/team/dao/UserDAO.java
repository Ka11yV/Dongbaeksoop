package com.team.dao;

import com.team.common.DBUtil;
import com.team.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public boolean insertUser(User user) {
        String sql = "INSERT INTO user (user_id, email, password, dept_id, grade) VALUES (?, ?, ?, ?, ?)";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = DBUtil.getPreparedStatement(conn, sql)) {

            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setInt(4, user.getDeptId());
            pstmt.setInt(5, user.getGrade());

            int affectedRows = pstmt.executeUpdate();

            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean isUserIdExists(String userId) {

        String sql = "SELECT COUNT(*) FROM user WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            return false;

        } catch (SQLException e) {
            System.err.println("DB Error during ID check: " + e.getMessage());
            throw new RuntimeException("Database error occurred while checking ID.", e);
        }
    }
}

