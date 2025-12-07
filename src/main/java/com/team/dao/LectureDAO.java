package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.lecture.LectureInfoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LectureDAO {
    public ArrayList<LectureInfoDTO> selectAllLecturesWithDetails() {
        String sql = "select l.name as lecture_name, l.course_type, p.name as professor_name, d.name as dept_name, p.id as professor_id, d.id as dept_id, l.id as lecture_id "
                +
                "from lecture as l " +
                "inner join lecture_detail as ld on ld.lecture_id = l.id " +
                "inner join professor as p on ld.professor_id = p.id " +
                "inner join department as d on ld.dept_id = d.id;";
        ArrayList<LectureInfoDTO> lectureList = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();) {

            while (rs.next()) {
                String lectureName = rs.getString("lecture_name");
                String courseType = rs.getString("course_type");
                String professorName = rs.getString("professor_name");
                String deptName = rs.getString("dept_name");
                int professorId = rs.getInt("professor_id");
                int deptId = rs.getInt("dept_id");
                int lectureId = rs.getInt("lecture_id");

                LectureInfoDTO lectureInfoDTO = new LectureInfoDTO(lectureName, courseType, professorName, deptName,
                        professorId, deptId, lectureId);
                lectureList.add(lectureInfoDTO);
            }

            return lectureList;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selectAllLecturesWithDetails", e);
        }
    }

    public int countAllLectures() {
        String sql = "select count(*) from lecture_detail;";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();) {
            int allLecture;

            if (rs.next()) {
                allLecture = rs.getInt("count(*)");
            } else {
                allLecture = 0;
            }

            return allLecture;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - countAllLectures", e);
        }
    }
}
