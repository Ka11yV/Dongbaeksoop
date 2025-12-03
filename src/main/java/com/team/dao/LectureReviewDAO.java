package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.lecture.LectureReviewDTO;
import com.team.entity.LectureReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class LectureReviewDAO {

    // 같은 id로 같은 강의를 여러 번 평가 남길 수 없게하는 중복검증
    public boolean existsByUserIdAndLectureIdAndSemester(LectureReview lectureReview) {
        String sql = "SELECT * FROM lecture_review WHERE user_id = ? AND lecture_id = ? AND course_semester = ?;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, lectureReview.getUser_id());
            pstmt.setInt(2, lectureReview.getLecture_id());
            pstmt.setString(3, lectureReview.getCourse_semester());

            int affectedRows = pstmt.executeUpdate();

            return affectedRows <= 0;  // 중복X = True / 중복O = False
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
