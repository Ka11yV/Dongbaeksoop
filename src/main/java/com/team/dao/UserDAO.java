package com.team.dao;

import com.mysql.cj.protocol.Resultset;
import com.team.common.DBUtil;
import com.team.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
            System.err.println("isEmailException에 실패했습니다: UserDAO" + e.getMessage());
            throw new RuntimeException("Database error occurred while checking email.", e);
        }
    }

    public int getUserCount() {

        String sql = "SELECT COUNT(*) FROM user";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            try (
                    // 3. 쿼리 실행 (ResultSet)
                    ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
            return 0;

        } catch (SQLException e) {
            System.err.println("getUserCount에 실패했습니다. UserDAO" + e.getMessage());
            throw new RuntimeException("Database error occurred while fetching user count.", e);
        }
    }

    public List<User> getUserList() {

        // 모든 유저 데이터를 조회하는 SQL
        String sql = "SELECT * FROM user";

        // 최종적으로 반환할 User 객체 리스트 초기화
        List<User> userList = new ArrayList<>();

        try (
                // 1. DB 연결 (Connection)
                Connection conn = DBUtil.getConnection();
                // 2. SQL 준비 (PreparedStatement)
                // 인자가 없으므로 setString 등의 호출이 필요 없습니다.
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            try (
                    // 3. 쿼리 실행 (ResultSet)
                    ResultSet rs = pstmt.executeQuery()) {

                // 결과 집합(ResultSet)을 순회하며 User 객체로 매핑합니다.
                while (rs.next()) {
                    User user = new User();

                    // DB 컬럼 이름을 사용하여 User 객체의 필드에 데이터 설정
                    // 컬럼 이름은 실제 DB 스키마에 맞게 조정해야 합니다.
                    user.setUserId(rs.getString("user_id"));
                    user.setEmail(rs.getString("email"));
                    user.setGrade(rs.getInt("grade"));
                    user.setIsBan(rs.getBoolean("ban"));
                    user.setAssignmentAlertEnabled(rs.getBoolean("is_assignment_alert_enabled"));
                    user.isNoticeAlertEnabled(rs.getBoolean("is_notice_alert_enabled"));
                    user.getCreatedAt().setTime(rs.getLong("created_at"));

                    // 매핑된 User 객체를 리스트에 추가
                    userList.add(user);
                }
            }
            // 4. 모든 처리가 끝나면 userList를 반환 (비어있을 경우 빈 리스트 반환)
            return userList;

        } catch (SQLException e) {
            // DB 접속 또는 쿼리 실행 중 오류 발생 시 에러 처리
            System.err.println("DB Error during fetching user list: " + e.getMessage());
            throw new RuntimeException("Database error occurred while fetching user list.", e);
        }
    }
}

