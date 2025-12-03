package com.team.controller.lecture;

import com.team.entity.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/lecture-review-detail")
public class LectureReviewDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/lecture-review-detail.jsp");
        dispatcher.forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");


        String semester = request.getParameter("semester");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String difficulty = request.getParameter("difficulty");
        String workload = request.getParameter("workload");
        String team_project = request.getParameter("team_project");
        String attendance_method = request.getParameter("attendance_method");
        String content = request.getParameter("content");

        // id, lecture id,학기, 평점, 어려움, 과제량, 팀플, 출결, 내용
        // LectureReviewDTO lectureReviewWriteDTO = new LectureReviewDTO(user.getId(), semester, rating, difficulty, workload, team_project, attendance_method, content);

    }
}
