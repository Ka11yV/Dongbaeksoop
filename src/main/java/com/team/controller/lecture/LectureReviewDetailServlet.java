package com.team.controller.lecture;

import com.team.dto.lecture.LectureInfoDTO;
import com.team.dto.lecture.ReviewInfoDTO;
import com.team.dto.lecture.ReviewRegistrationDTO;
import com.team.dto.lecture.ReviewSummaryDTO;
import com.team.entity.User;
import com.team.service.LectureService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/lecture-review-detail")
public class LectureReviewDetailServlet extends HttpServlet {
    LectureService lectureService = new LectureService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strLectureId = request.getParameter("id");
        String strProfessorId = request.getParameter("professorId");

        if (strLectureId == null || strProfessorId == null || strLectureId.isEmpty() || strProfessorId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/lecture-reviews");
            return;
        }

        try {
            int lectureId = Integer.parseInt(strLectureId);
            int professorId = Integer.parseInt(strProfessorId);
            LectureInfoDTO lectureInfoDTO = lectureService.getLectureInfo(lectureId, professorId);
            request.setAttribute("lectureInfoDTO", lectureInfoDTO);
            ArrayList<ReviewInfoDTO> lectureReviews = lectureService.getLectureReviews(lectureId, professorId);
            ReviewSummaryDTO reviewSummaryDTO = lectureService.getReviewSummary(lectureId, professorId);

            if(lectureReviews.isEmpty()) {
                request.setAttribute("emptyReview", "아직 등록된 강의 평가가 없어요.");
            } else {
                request.setAttribute("lectureReviews", lectureReviews);
                request.setAttribute("reviewSummaryDTO", reviewSummaryDTO);
            }


        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/lecture-review-detail.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String courseSemester = request.getParameter("courseSemester");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String difficulty = request.getParameter("difficulty");
        String workload = request.getParameter("workload");
        String teamProject = request.getParameter("teamProject");
        String attendanceMethod = request.getParameter("attendanceMethod");
        String content = request.getParameter("content");
        int lectureId = Integer.parseInt(request.getParameter("lectureId"));
        int professorId = Integer.parseInt(request.getParameter("professorId"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        ReviewRegistrationDTO reviewRegistrationDTO = new ReviewRegistrationDTO(user.getId(), lectureId, professorId, courseSemester, rating, difficulty, workload, teamProject, attendanceMethod, content);

        try {
            lectureService.registerLectureReview(reviewRegistrationDTO);
        } catch (RuntimeException e) {
            e.printStackTrace();
        }

        String redirectURL = request.getContextPath()
                + "/lecture-review-detail?id=" + lectureId
                + "&professorId=" + professorId;

        response.sendRedirect(redirectURL);
    }
}
