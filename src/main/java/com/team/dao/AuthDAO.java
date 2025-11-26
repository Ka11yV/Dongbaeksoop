package com.team.dao;

import com.team.common.DBUtil;
import com.team.entity.User;

import java.sql.*;

public class AuthDAO {
    public User getByUserId(String userId) {
        String sql = "SELECT user_id, password, role FROM user WHERE user_id = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getString("user_id"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));

                    return user;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }
}
