package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.user.UserLoginDTO;
import com.team.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthDAO {
    public User getByUserId(String userId) {
        String sql = "SELECT user_id, password FROM user WHERE user_id = ?;";
        User user = new User();

        try(
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);

            ResultSet rs = pstmt.executeQuery();

            String login_id = rs.getString("user_id");
            String password = rs.getString("password");

            user.setUserId(login_id);
            user.setPassword(password);

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return user;
    }
}
