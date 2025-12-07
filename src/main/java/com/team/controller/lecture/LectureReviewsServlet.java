package com.team.controller.lecture;

import com.google.gson.Gson;
import com.team.dto.lecture.LectureInfoDTO;
import com.team.dto.response.ApiResponse;
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
import java.util.HashMap;
import java.util.Map;
import static com.team.common.ServletResponseUtil.sendJsonResponse;

@WebServlet("/lecture-reviews")
public class LectureReviewsServlet extends HttpServlet {
    public LectureService lectureService = new LectureService();
    private final Gson gson = new Gson();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         HttpSession session = request.getSession();
         User user = (User) session.getAttribute("loggedInUser");

         if(user == null) {
             RequestDispatcher dispatcher =
             request.getRequestDispatcher("/view/pages/login.jsp");
             dispatcher.forward(request, response);
             return;
         }

        // 초기 페이지 로딩
        try {
            ArrayList<LectureInfoDTO> lectureList = lectureService.getAllLecturesInfoList();
            int allLecture = lectureService.getTotalLectureCount();

            // 초기화면용
            request.setAttribute("lectureList", lectureList);
            request.setAttribute("countLectures", allLecture);

            // 필터링에 사용
            String allLecturesJson = gson.toJson(lectureList);
            request.setAttribute("allLecturesJson", allLecturesJson);
        } catch (RuntimeException e) {
            System.out.println(e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/lecture-reviews.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {}
}
