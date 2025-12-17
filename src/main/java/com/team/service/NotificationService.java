package com.team.service;

import com.team.dao.NotificationDAO;
import com.team.entity.Notification;

public class NotificationService {
    private final NotificationDAO notificationDAO = new NotificationDAO();

    public Notification getNotification(long id) {
        return notificationDAO.getNotificationById(id);
    }

    public java.util.List<Notification> getAllNotifications() {
        return notificationDAO.getAllNotifications();
    }

    public java.util.List<Notification> getUniversityNotifications() {
        return notificationDAO.getNotificationsByDeptId(999);
    }

    public java.util.List<Notification> getDepartmentNotifications(int deptId) {
        return notificationDAO.getNotificationsByDeptId(deptId);
    }
}
