package com.team.controller.lecture;

import com.team.dto.lecture.LectureCardDTO;
import com.team.dto.lecture.LectureReviewDTO;
import com.team.entity.LectureReview;
import com.team.entity.User;
import com.team.service.LectureReviewService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

@WebServlet("/lecture-review-detail/*")
public class LectureReviewDetailServlet extends HttpServlet {
    LectureReviewService lectureReviewService = new LectureReviewService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lectureId = Integer.parseInt(request.getParameter("id"));
        int professorId = Integer.parseInt(request.getParameter("professorId"));

        try {
            LectureCardDTO lectureCardDTO = lectureReviewService.findLectureDetail(lectureId, professorId);
            request.setAttribute("currentLectureDetail", lectureCardDTO);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/lecture-review-detail.jsp");
        dispatcher.forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String semester = request.getParameter("semester");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String difficulty = request.getParameter("difficulty");
        String workload = request.getParameter("workload");
        String teamProject = request.getParameter("team_project");
        String attendanceMethod = request.getParameter("attendance_method");
        String content = request.getParameter("content");
        int lectureId = Integer.parseInt(request.getParameter("lectureId"));
        int professorId = Integer.parseInt(request.getParameter("professorId"));
        String deptName = request.getParameter("deptName");
        // int deptId = lectureReviewService.deptNameToId(deptName);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        int userId = user.getId();

        LectureReviewDTO lectureReviewDTO = new LectureReviewDTO(userId, lectureId, professorId, semester, rating, difficulty, workload, teamProject, attendanceMethod, content);

        boolean isDuplicate = lectureReviewService.isDuplicateReview(lectureReviewDTO);

        ArrayList<LectureReview> reviewArr = new ArrayList<>();

        if (!isDuplicate) {
            boolean success = lectureReviewService.insertReview(lectureReviewDTO);

            if (success) {
                LectureReview lectureReview = new LectureReview(userId, lectureId, professorId, semester, rating, difficulty, workload, teamProject,  attendanceMethod, content);
                reviewArr.add(lectureReview);
                session.setAttribute("reviewList", reviewArr);
                String redirectUrl = request.getContextPath() + "/lecture-review-detail" + "?id=" + lectureId + "&professorId=" + professorId;
                response.sendRedirect(redirectUrl);
            } else {
                session.setAttribute("errMsg", "리뷰 등록에 실패했습니다.");
                String redirectUrl = request.getContextPath() + "/lecture-review-detail" + "?id=" + lectureId + "&professorId=" + professorId;
                response.sendRedirect(redirectUrl);
            }
        } else { // 중복 O
            session.setAttribute("errMsg", "이미 평가를 남긴 강의입니다.");
            String redirectUrl = request.getContextPath() + "/lecture-review-detail" + "?id=" + lectureId + "&professorId=" + professorId;
            response.sendRedirect(redirectUrl);
        }

    }
}
