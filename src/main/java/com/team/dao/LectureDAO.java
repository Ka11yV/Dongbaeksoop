package com.team.dao;

import com.team.common.DBUtil;
import com.team.dto.lecture.LectureInfoDTO;
import com.team.dto.lecture.ReviewInfoDTO;
import com.team.dto.lecture.ReviewSummaryDTO;
import com.team.entity.LectureReview;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
        String sql = "select lecture_id, professor_id, course_semester, rating, difficulty, workload, team_project, attendance_method, content, created_at " +
                "FROM lecture_review " +
                "WHERE lecture_id = ? AND professor_id = ? " +
                "order by created_at desc;";
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
                Timestamp createdAt = rs.getTimestamp("created_at");
                
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

    public ReviewSummaryDTO selectSummaryStatistics(int lectureId, int professorId) {
        String sql = "SELECT " +
                "AVG(rating) AS average_rating, " +
                "COUNT(*) AS total_reviews, " +
                "COUNT(rating = 5 OR NULL) AS count_5star, " +
                "COUNT(rating = 4 OR NULL) AS count_4star, " +
                "COUNT(rating = 3 OR NULL) AS count_3star, " +
                "COUNT(rating = 2 OR NULL) AS count_2star, " +
                "COUNT(rating = 1 OR NULL) AS count_1star " +
                "FROM lecture_review " +
                "WHERE lecture_id = ? AND professor_id = ?;";
        ReviewSummaryDTO reviewSummaryDTO;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);



            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    DecimalFormat df = new DecimalFormat("#.#");
                    double avg = Double.parseDouble(df.format(rs.getDouble("average_rating")));

                    reviewSummaryDTO = new ReviewSummaryDTO(
                            avg,
                            rs.getInt("total_reviews"),
                            rs.getInt("count_5star"),
                            rs.getInt("count_4star"),
                            rs.getInt("count_3star"),
                            rs.getInt("count_2star"),
                            rs.getInt("count_1star"),
                            null,
                            null,
                            null,
                            null
                    );
                } else {
                    return new ReviewSummaryDTO(0, 0, 0, 0, 0, 0, 0, null, null, null, null);
                }
            }

            return reviewSummaryDTO;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selectSummaryStatistics", e);
        }
    }

    public String selectDifficultyMode(int lectureId, int professorId) {
        String sql = "SELECT difficulty " +
                "FROM lecture_review " +
                "WHERE lecture_id = ? AND professor_id = ? " +
                "GROUP BY difficulty " +
                "ORDER BY COUNT(*) DESC " +
                "limit 1;";
        String difficulty;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    difficulty = rs.getString("difficulty");
                } else {
                    return null;
                }
            }

            return difficulty;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selectDifficultyMode", e);
        }
    }

    public String selectWorkloadMode(int lectureId, int professorId) {
        String sql = "SELECT workload " +
                "FROM lecture_review " +
                "WHERE lecture_id = ? AND professor_id = ? " +
                "GROUP BY workload " +
                "ORDER BY COUNT(*) DESC " +
                "limit 1;";
        String workload;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    workload = rs.getString("workload");
                } else {
                    return null;
                }
            }

            return workload;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selectWorkloadMode", e);
        }
    }

    public String selectTeamProjectMode(int lectureId, int professorId) {
        String sql = "SELECT team_project " +
                "FROM lecture_review " +
                "WHERE lecture_id = ? AND professor_id = ? " +
                "GROUP BY team_project " +
                "ORDER BY COUNT(*) DESC " +
                "limit 1;";
        String teamProject;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    teamProject = rs.getString("team_project");
                } else {
                    return null;
                }
            }

            return teamProject;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selectTeamProjectMode", e);
        }
    }

    public String selectAttendanceMethodMode(int lectureId, int professorId) {
        String sql = "SELECT attendance_method " +
                "FROM lecture_review " +
                "WHERE lecture_id = ? AND professor_id = ? " +
                "GROUP BY attendance_method " +
                "ORDER BY COUNT(*) DESC " +
                "limit 1;";
        String attendanceMethod;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, lectureId);
            pstmt.setInt(2, professorId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    attendanceMethod = rs.getString("attendance_method");
                } else {
                    return null;
                }
            }

            return attendanceMethod;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selectAttendanceMethodMode", e);
        }
    }

    public Map<String, ReviewSummaryDTO> selectAllLecturesSummaryStatistics() {
        String sql = "SELECT " +
                "lecture_id, " +
                "professor_id, " +
                "AVG(rating) AS average_rating, " +
                "COUNT(*) AS total_reviews  " +
                "FROM lecture_review " +
                "GROUP BY lecture_id, professor_id;";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            Map<String, ReviewSummaryDTO> summaryMap = new HashMap<>();

               while(rs.next()) {
                   int lectureId = rs.getInt("lecture_id");
                   int professorId = rs.getInt("professor_id");
                   DecimalFormat df = new DecimalFormat("#.#");
                   double avg = Double.parseDouble(df.format(rs.getDouble("average_rating")));

                   ReviewSummaryDTO reviewSummaryDTO = new ReviewSummaryDTO(
                           avg,
                           rs.getInt("total_reviews"),
                           0,
                           0,
                           0,
                           0,
                           0,
                           null,
                           null,
                           null,
                           null
                   );

                   summaryMap.put(lectureId + "_" + professorId, reviewSummaryDTO);
               }
               return summaryMap;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("SQL Exception 발생하였습니다. - selectAllLecturesSummaryStatistics", e);
        }
    }
}
