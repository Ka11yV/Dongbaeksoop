package com.team.dao;

import com.mysql.cj.protocol.Resultset;
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
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

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

        try (
                Connection conn = DBUtil.getConnection();
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

    public boolean isEmailExists(String email) {

        String sql = "SELECT COUNT(*) FROM user WHERE email = ?";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            return false;

        } catch (SQLException e) {
            System.err.println("DB Error during email check: " + e.getMessage());
            throw new RuntimeException("Database error occurred while checking email.", e);
        }
    }

    public String selectUserDept(User user) {
        String sql = "SELECT name FROM department WHERE id = ?;";
        String dept = null;

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)
                ) {

            pstmt.setInt(1, user.getDeptId());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    dept = rs.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("An error occurred during department table lookup using dept_id  ", e);
        }

        return dept;
    }

    public boolean updateProfileInformation(int dept_id, int grade, String user_id) {
        String sql = "UPDATE user SET dept_id = ?, grade = ? WHERE user_id = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {

            pstmt.setInt(1, dept_id);
            pstmt.setInt(2, grade);
            pstmt.setString(3, user_id);

            int affectedRows = pstmt.executeUpdate();  // 해당 쿼리 실행으로 인해 데이터베이스에서 실제로 영향을 받은 행(Row)의 개수

            return affectedRows > 0;  // 1개라도 있으면 true, 없으면 false
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePassword(String password, String user_id) {
        String sql = "UPDATE user SET password = ? WHERE user_id = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {

            pstmt.setString(1, password);
            pstmt.setString(2, user_id);

            int affectedRows = pstmt.executeUpdate();  // 해당 쿼리 실행으로 인해 데이터베이스에서 실제로 영향을 받은 행(Row)의 개수

            return affectedRows > 0;  // 1개라도 있으면 true, 없으면 false
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

