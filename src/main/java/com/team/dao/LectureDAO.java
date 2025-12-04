package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.lecture.LectureCardDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LectureDAO {
    // review-detail 카드
    public ArrayList<LectureCardDTO> getLectureCard() {
        ArrayList<LectureCardDTO> lectureList = new ArrayList<>();
        String sql = "SELECT l.name AS lecture, l.course_type, p.name AS professor, d.name AS department, l.id as lectureId, p.id as professorId "
                +
                "FROM lecture l " +
                "JOIN lecture_detail ld ON l.id = ld.lecture_id " +
                "JOIN professor p ON ld.professor_id = p.id " +
                "JOIN department d ON ld.dept_id = d.id";

        try (
                Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String lecture_name = rs.getString("lecture");
                String courseType = rs.getString("course_type");
                String professor_name = rs.getString("professor");
                String dept_name = rs.getString("department");
                int lectureId = rs.getInt("lectureId");
                int professorId = rs.getInt("professorId");
                LectureCardDTO lectureCardDTO = new LectureCardDTO(lecture_name, courseType, professor_name, dept_name,
                        lectureId, professorId);

                lectureList.add(lectureCardDTO);
            }
            return lectureList;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("강의 목록 조회 중 데이터베이스 처리 오류", e);
        }
    }
}
