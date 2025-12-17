package com.team.dao;

import com.team.common.DBUtil;
import com.team.entity.Notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NotificationDAO {

    public Notification getNotificationById(long id) {
        String sql = "SELECT * FROM notification WHERE id = ?";
        Notification notification = null;

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    notification = new Notification();
                    notification.setId(rs.getLong("id"));
                    notification.setPostId(rs.getString("post_id"));
                    notification.setDeptId(rs.getInt("dept_id"));
                    notification.setTitle(rs.getString("title"));
                    notification.setUrl(rs.getString("url"));
                    notification.setContent(rs.getString("content"));

                    java.sql.Date dbDate = rs.getDate("posted_date");
                    if (dbDate != null) {
                        notification.setPostedDate(dbDate.toLocalDate());
                    }

                    notification.setSummation(rs.getString("summation"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching notification by ID", e);
        }
        return notification;
    }

    public java.util.List<Notification> getAllNotifications() {
        String sql = "SELECT * FROM notification ORDER BY posted_date DESC";
        java.util.List<Notification> list = new java.util.ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Notification notification = new Notification();
                notification.setId(rs.getLong("id"));
                notification.setPostId(rs.getString("post_id"));
                notification.setDeptId(rs.getInt("dept_id"));
                notification.setTitle(rs.getString("title"));
                notification.setUrl(rs.getString("url"));
                notification.setContent(rs.getString("content"));

                java.sql.Date dbDate = rs.getDate("posted_date");
                if (dbDate != null) {
                    notification.setPostedDate(dbDate.toLocalDate());
                }

                notification.setSummation(rs.getString("summation"));
                list.add(notification);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching all notifications", e);
        }
        return list;
    }

    public java.util.List<Notification> getNotificationsByDeptId(int deptId) {
        String sql = "SELECT * FROM notification WHERE dept_id = ? ORDER BY posted_date DESC";
        java.util.List<Notification> list = new java.util.ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, deptId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Notification notification = new Notification();
                    notification.setId(rs.getLong("id"));
                    notification.setPostId(rs.getString("post_id"));
                    notification.setDeptId(rs.getInt("dept_id"));
                    notification.setTitle(rs.getString("title"));
                    notification.setUrl(rs.getString("url"));
                    notification.setContent(rs.getString("content"));

                    java.sql.Date dbDate = rs.getDate("posted_date");
                    if (dbDate != null) {
                        notification.setPostedDate(dbDate.toLocalDate());
                    }

                    notification.setSummation(rs.getString("summation"));
                    list.add(notification);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching notifications by deptId", e);
        }
        return list;
    }
}
