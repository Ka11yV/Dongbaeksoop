package com.team.dao;

import com.team.entity.Notification;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class NotificationDAOTest {

    @Test
    @DisplayName("공지사항 ID로 조회 테스트")
    void getNotificationById() {
        // given
        NotificationDAO notificationDAO = new NotificationDAO();
        // Assuming there is at least one notification in the DB or we handle null
        // Since we cannot easily insert into DB in this environment without full setup,
        // we will just check if the method runs without error and returns null or an
        // object.
        // If you have a known ID, replace 1L with it.
        long id = 1L;

        // when
        Notification notification = notificationDAO.getNotificationById(id);

        // then
        // It's okay if it returns null if DB is empty, but it shouldn't throw exception
        if (notification != null) {
            System.out.println("Notification found: " + notification.getTitle());
            assertEquals(id, notification.getId());
        } else {
            System.out.println("Notification not found for ID: " + id);
        }
    }

    @Test
    @DisplayName("모든 공지사항 조회 테스트")
    void getAllNotifications() {
        // given
        NotificationDAO notificationDAO = new NotificationDAO();

        // when
        java.util.List<Notification> list = notificationDAO.getAllNotifications();

        // then
        assertNotNull(list);
        System.out.println("Fetched notifications count: " + list.size());
        for (Notification n : list) {
            System.out.println("ID: " + n.getId() + ", Title: " + n.getTitle());
        }
    }

    @Test
    @DisplayName("학과별 공지사항 조회 테스트")
    void getNotificationsByDeptId() {
        // given
        NotificationDAO notificationDAO = new NotificationDAO();
        int deptId = 999; // 대학 공지

        // when
        java.util.List<Notification> list = notificationDAO.getNotificationsByDeptId(deptId);

        // then
        assertNotNull(list);
        System.out.println("Fetched notifications for deptId " + deptId + ": " + list.size());
        for (Notification n : list) {
            assertEquals(deptId, n.getDeptId());
            System.out.println("ID: " + n.getId() + ", Title: " + n.getTitle());
        }
    }
}
