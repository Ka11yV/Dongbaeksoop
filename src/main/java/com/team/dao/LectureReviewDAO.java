package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.lecture.LectureCardDTO;
import com.team.dto.lecture.LectureReviewDTO;
import com.team.entity.LectureReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LectureReviewDAO {
    public LectureCardDTO selectLectureDetail(int lectureId, int professorId) throws SQLException {
        String sql = "SELECT l.name AS lecture, l.course_type, p.name AS professor, d.name AS department, l.id as lectureId, p.id as professorId "
                +
                "FROM lecture l " +
                "JOIN lecture_detail ld ON l.id = ld.lecture_id " +
                "JOIN professor p ON ld.professor_id = p.id " +
                "JOIN department d ON ld.dept_id = d.id " +
                "WHERE l.id = ? AND p.id = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) { // SQL에 맞는 행이 나오면
                    String lecture_name = rs.getString("lecture");
                    String courseType = rs.getString("course_type");
                    String professorName = rs.getString("professor");
                    String deptName = rs.getString("department");

                    LectureCardDTO lectureCardDTO = new LectureCardDTO(lecture_name, courseType, professorName,
                            deptName, lectureId, professorId);

                    return lectureCardDTO;
                } else {
                    return null;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("강의 목록 조회 중 데이터베이스 처리 오류", e);
        }
    }

    public int changeDeptNameToDeptId(String deptName) {
        String sql = "SELECT id FROM department WHERE deptName = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, deptName);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) { // SQL에 맞는 행이 나오면
                    return rs.getInt("id");
                } else {
                    return 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    // 같은 id로 같은 강의를 여러 번 평가 남길 수 없게하는 중복검증
    public boolean existsByUserIdAndLectureIdAndSemester(LectureReview lectureReview) {
        String sql = "SELECT * FROM lecture_review WHERE user_id = ? AND lecture_id = ? AND course_semester = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, lectureReview.getUser_id());
            pstmt.setInt(2, lectureReview.getLecture_id());
            pstmt.setString(3, lectureReview.getCourse_semester());

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next(); // 행이 존재하면 true(중복), 없으면 false(중복 아님)
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertLectureReview(LectureReview lectureReview) {
        String sql = "INSERT INTO lecture_review(user_id, lecture_id, professor_id, course_semester, rating, difficulty, workload, team_project, attendance_method, content) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, lectureReview.getUser_id());
            pstmt.setInt(2, lectureReview.getLecture_id());
            pstmt.setInt(3, lectureReview.getProfessor_id());
            pstmt.setString(4, lectureReview.getCourse_semester());
            pstmt.setInt(5, lectureReview.getRating());
            pstmt.setString(6, lectureReview.getDifficulty());
            pstmt.setString(7, lectureReview.getWorkload());
            pstmt.setString(8, lectureReview.getTeam_project());
            pstmt.setString(9, lectureReview.getAttendance_method());
            pstmt.setString(10, lectureReview.getContent());

            int affectedRows = pstmt.executeUpdate();

            return affectedRows <= 0; // 중복X = True / 중복O = False
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
