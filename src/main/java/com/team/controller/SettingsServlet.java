package com.team.controller;

import com.team.dao.UserDAO;
import com.team.entity.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/settings")
public class SettingsServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User loggedInUser = (session != null) ? (User) session.getAttribute("loggedInUser") : null;

        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        // Fetch latest user data
        User currentUser = userDAO.getByUserId(loggedInUser.getUserId());
        request.setAttribute("user", currentUser);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/settings.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User loggedInUser = (session != null) ? (User) session.getAttribute("loggedInUser") : null;

        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        boolean noticeAlert = "on".equals(request.getParameter("noticeAlert"));
        boolean assignmentAlert = "on".equals(request.getParameter("assignmentAlert"));

        boolean updated = userDAO.updateAlertSettings(loggedInUser.getUserId(), noticeAlert, assignmentAlert);

        if (updated) {
            // Update session
            loggedInUser.setNoticeAlertEnabled(noticeAlert);
            loggedInUser.setAssignmentAlertEnabled(assignmentAlert);
            session.setAttribute("loggedInUser", loggedInUser);

            request.setAttribute("successMessage", "설정이 저장되었습니다.");
        } else {
            request.setAttribute("errorMessage", "설정 저장에 실패했습니다.");
        }

        // Re-fetch and forward
        User currentUser = userDAO.getByUserId(loggedInUser.getUserId());
        request.setAttribute("user", currentUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/settings.jsp");
        dispatcher.forward(request, response);
    }
}
