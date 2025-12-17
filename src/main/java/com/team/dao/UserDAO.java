package com.team.dao;

import com.mysql.cj.protocol.Resultset;
import com.team.common.DBUtil;
import com.team.dto.user.UserUpdateRequestDTO;
import com.team.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

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
                    user.setPassword(rs.getString("password")); // 보안상 비밀번호는 해시된 값이어야 합니다.
                    user.setSchoolPassword(rs.getString("school_password"));
                    user.setEmail(rs.getString("email"));
                    user.setGrade(rs.getInt("grade"));
                    user.setDeptId(rs.getInt("dept_id"));
                    user.setIsBan(rs.getBoolean("is_ban"));
                    user.setNoticeAlertEnabled(rs.getBoolean("is_notice_alert_enabled"));
                    user.setAssignmentAlertEnabled(rs.getBoolean("is_assignment_alert_enabled"));
                    user.setRole(rs.getString("role"));

                    // [수정된 부분] java.sql.Date -> java.sql.Timestamp -> LocalDateTime 변환
                    java.sql.Timestamp dbTime = rs.getTimestamp("created_at");
                    if (dbTime != null) {
                        user.setCreatedAt(dbTime.toLocalDateTime());
                    }

                    return user;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null; // 예외 발생 시 null 반환 (또는 예외를 다시 던지는 것을 권장)
        }
        return null; // 해당 userId가 없을 경우 null 반환
    }

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

    public boolean updateDeptAndGradeByUserId(UserUpdateRequestDTO userUpdateRequestDTO) {
        String sql = "UPDATE user SET dept_id = ?, grade = ? WHERE user_id = ?;";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userUpdateRequestDTO.getDeptId());
            pstmt.setInt(2, userUpdateRequestDTO.getGrade());
            pstmt.setString(3, userUpdateRequestDTO.getUserId());

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - updateDeptAndGradeByUserId", e);
        }
    }

    public String selectUserDept(User user) {
        String sql = "SELECT name FROM department WHERE id = ?;";
        String dept = null;

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

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
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, dept_id);
            pstmt.setInt(2, grade);
            pstmt.setString(3, user_id);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - updateProfileInformation", e);
        }
    }

    public boolean updatePassword(String password, String user_id) {
        String sql = "UPDATE user SET password = ? WHERE user_id = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, password);
            pstmt.setString(2, user_id);

            int affectedRows = pstmt.executeUpdate(); // 해당 쿼리 실행으로 인해 데이터베이스에서 실제로 영향을 받은 행(Row)의 개수

            return affectedRows > 0; // 1개라도 있으면 true, 없으면 false
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateSchoolPassword(String userId, String schoolPassword) {
        String sql = "UPDATE user SET school_password = ? WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, schoolPassword);
            pstmt.setString(2, userId);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated == 0) {
                throw new RuntimeException("User not found or password not updated");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error updating school password", e);
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

    public List<User> getAllUsers() {

        // 모든 유저 데이터를 조회하는 SQL
        String sql = """
                    SELECT u.*, d.name AS dept_name\s
                        FROM user u\s
                        LEFT JOIN department d ON u.dept_id = d.id;
                """;

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

                    java.sql.Timestamp createdAt = rs.getTimestamp("created_at");

                    // DB 컬럼 이름을 사용하여 User 객체의 필드에 데이터 설정
                    // 컬럼 이름은 실제 DB 스키마에 맞게 조정해야 합니다.
                    user.setUserId(rs.getString("user_id"));
                    user.setEmail(rs.getString("email"));
                    user.setGrade(rs.getInt("grade"));
                    user.setIsBan(rs.getBoolean("is_ban"));
                    user.setAssignmentAlertEnabled(rs.getBoolean("is_assignment_alert_enabled"));
                    user.setNoticeAlertEnabled(rs.getBoolean("is_notice_alert_enabled"));
                    user.setDeptName(rs.getString("dept_name"));
                    if (createdAt != null) {
                        user.setCreatedAt(createdAt.toLocalDateTime());
                    }
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

    public Boolean updateBanStatus(String userId, boolean isBan) {
        String sql = "UPDATE user SET is_ban = ? WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // 파라미터 바인딩
            pstmt.setBoolean(1, isBan);
            pstmt.setString(2, userId);

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateAlertSettings(String userId, boolean noticeAlert, boolean assignmentAlert) {
        String sql = "UPDATE user SET is_notice_alert_enabled = ?, is_assignment_alert_enabled = ? WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setBoolean(1, noticeAlert);
            pstmt.setBoolean(2, assignmentAlert);
            pstmt.setString(3, userId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
