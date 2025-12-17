package com.team.dao;

import com.team.entity.Assignment;
import com.team.common.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AssignmentDAO {

    public List<Assignment> getAssignmentsByUserId(int userId) {
        System.out.println(userId);
        List<Assignment> assignments = new ArrayList<>();
        String sql = "SELECT * FROM assignment WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Assignment assignment = new Assignment();
                    assignment.setUserId(rs.getString("user_id"));
                    assignment.setCourseName(rs.getString("course_name"));
                    assignment.setTitle(rs.getString("title"));
                    assignment.setSubmissionStatus(rs.getString("submission_status"));
                    assignment.setDueDate(rs.getString("due_date"));
                    assignment.setTimeLeft(rs.getString("time_left"));
                    assignments.add(assignment);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return assignments;
    }

    public boolean addAssignment(Assignment assignment) {
        String sql = "INSERT INTO assignment (user_id, course_name, title, submission_status, due_date, time_left) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, assignment.getUserId());
            pstmt.setString(2, assignment.getCourseName());
            pstmt.setString(3, assignment.getTitle());
            pstmt.setString(4, assignment.getSubmissionStatus());
            pstmt.setString(5, assignment.getDueDate());
            pstmt.setString(6, assignment.getTimeLeft());

            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
