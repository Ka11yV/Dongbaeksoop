package com.team.controller.notice;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/notifications/*")
public class NotificationsServlet extends HttpServlet {

    private final com.team.service.NotificationService notificationService = new com.team.service.NotificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // 대학 공지 (dept_id = 999)
            java.util.List<com.team.entity.Notification> universityNotifications = notificationService
                    .getUniversityNotifications();
            request.setAttribute("universityNotifications", universityNotifications);

            // 학과 공지 (로그인한 사용자의 dept_id)
            jakarta.servlet.http.HttpSession session = request.getSession(false);
            com.team.entity.User loggedInUser = (session != null)
                    ? (com.team.entity.User) session.getAttribute("loggedInUser")
                    : null;

            if (loggedInUser != null) {
                java.util.List<com.team.entity.Notification> departmentNotifications = notificationService
                        .getDepartmentNotifications(loggedInUser.getDeptId());
                request.setAttribute("departmentNotifications", departmentNotifications);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/notifications.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            // /notifications/{id} 처리
            String idStr = pathInfo.substring(1); // "/" 제거
            long id = Long.parseLong(idStr);

            com.team.entity.Notification notification = notificationService.getNotification(id);

            if (notification != null) {
                request.setAttribute("notification", notification);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/notification-detail.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Notification not found");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notification ID");
        }
    }
}
