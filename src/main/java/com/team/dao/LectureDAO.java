package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.lecture.LectureCardDTO;
import com.team.dto.lecture.LectureReviewDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class LectureDAO {
    //  review-detail 카드
    public ArrayList<LectureCardDTO> getAllLectures() {
        ArrayList<LectureCardDTO> lectureList = new ArrayList<>();
        String sql = "SELECT lecture.id, lecture.course_type, professor.name, department.name"
                + "from lecture, professor, department;";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int affectedRows = pstmt.executeUpdate();

            if(affectedRows == 0) {  // 조회된 내용이 없을 때
                return null;
            } else {  // 조회 성공
                return lectureList;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("강의 목록 조회 중 데이터베이스 처리 오류", e);
        }
    }
}
