package com.team.dao;

import com.team.common.DBUtil;
import com.team.entity.User;

import java.sql.*;

public class AuthDAO {
    public User getByUserId(String userId) {
        String sql = "SELECT * FROM user WHERE user_id = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUserId(rs.getString("user_id"));
                    user.setPassword(rs.getString("password"));
                    user.setSchoolPassword(rs.getString("school_password"));
                    user.setEmail(rs.getString("email"));
                    user.setGrade(rs.getInt("grade"));
                    user.setDeptId(rs.getInt("dept_id"));
                    user.setIsBan(rs.getBoolean("is_ban"));
                    user.setNoticeAlertEnabled(rs.getBoolean("is_notice_alert_enabled"));
                    user.setAssignmentAlertEnabled(rs.getBoolean("is_assignment_alert_enabled"));
                    user.setRole(rs.getString("role"));
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    if (createdAt != null) {
                        user.setCreatedAt(createdAt.toLocalDateTime());
                    }

                    return user;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public String findDeptNameByDeptId(int deptId) {
        String sql = "SELECT name FROM department WHERE id = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, deptId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (!rs.next()) { // 조회된 데이터가 없으면
                    return null;
                }
                return rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - findDeptNameByDeptId", e);
        }
    }
}
