package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.lecture.LectureInfoDTO;
import com.team.dto.lecture.ReviewInfoDTO;
import com.team.entity.LectureReview;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

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

    public LectureInfoDTO findLectureInfoByLectureAndProfessor(int lectureId, int professorId) {
        String sql = "select l.name as lecture_name, l.course_type, p.name as professor_name, d.name as dept_name, p.id as professor_id, d.id as dept_id, l.id as lecture_id "
                + "from lecture as l "
                + "inner join lecture_detail as ld on ld.lecture_id = l.id "
                + "inner join professor as p on ld.professor_id = p.id "
                + "inner join department as d on ld.dept_id = d.id "
                + "where lecture_id = ? and professor_id = ?;";
        LectureInfoDTO lectureInfoDTO;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    String lectureName = rs.getString("lecture_name");
                    String courseType = rs.getString("course_type");
                    String professorName = rs.getString("professor_name");
                    String deptName = rs.getString("dept_name");
                    int deptId = rs.getInt("dept_id");
                    lectureInfoDTO = new LectureInfoDTO(lectureName, courseType, professorName, deptName, professorId, deptId, lectureId);

                    return lectureInfoDTO;
                }
            }
            return null;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - getLectureInfoByLectureAndProfessor", e);
        }
    }

    public boolean insertLectureReview(LectureReview lectureReview) {
        String sql = "insert into " +
                "lecture_review(user_id, lecture_id, professor_id, course_semester, rating, difficulty, workload, team_project, attendance_method, content) " +
                "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureReview.getUserId());
            pstmt.setInt(2, lectureReview.getLectureId());
            pstmt.setInt(3, lectureReview.getProfessorId());
            pstmt.setString(4, lectureReview.getCourseSemester());
            pstmt.setInt(5, lectureReview.getRating());
            pstmt.setString(6, lectureReview.getDifficulty());
            pstmt.setString(7, lectureReview.getWorkload());
            pstmt.setString(8, lectureReview.getTeamProject());
            pstmt.setString(9, lectureReview.getAttendanceMethod());
            pstmt.setString(10, lectureReview.getContent());

            int affectedRows = pstmt.executeUpdate();

            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - insertLectureReview", e);
        }
    }

    public ArrayList<ReviewInfoDTO> selectLectureReviewsByLectureAndProfessor(int lectureId, int professorId) {
        String sql = "SELECT r.lecture_id as lecture_id, r.professor_id as professor_id, course_semester,rating, difficulty, workload, team_project,  attendance_method,  content, created_at "
        + "FROM lecture_review as r "
        + "INNER JOIN lecture as l on r.lecture_id = l.id "
        + "INNER JOIN professor as p on r.professor_id = p.id "
        + "WHERE lecture_id = ? AND professor_id = ?";
        ArrayList<ReviewInfoDTO> lectureReviews = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String courseSemester = rs.getString("course_semester");
                int rating = rs.getInt("rating");
                String difficulty = rs.getString("difficulty");
                String workload = rs.getString("workload");
                String teamProject = rs.getString("team_project");
                String attendanceMethod = rs.getString("attendance_method");
                String content = rs.getString("content");
                Timestamp createdAt = (java.sql.Timestamp)rs.getObject("created_at");
                
                ReviewInfoDTO reviewInfoDTO = new ReviewInfoDTO(
                        lectureId,
                        professorId,
                        courseSemester,
                        rating,
                        difficulty,
                        workload,
                        teamProject,
                        attendanceMethod,
                        content,
                        createdAt
                );

                lectureReviews.add(reviewInfoDTO);
            }

            return lectureReviews;


        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selecLectureReviewsByLectureAndProfessor", e);
        }
    }
}
