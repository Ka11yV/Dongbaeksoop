package com.team.controller.lecture;

import com.team.dto.lecture.LectureCardDTO;
import com.team.entity.User;
import com.team.service.AuthService;
import com.team.service.LectureService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/lecture-reviews")
public class LectureReviewsServlet extends HttpServlet {
    public LectureService lectureService = new LectureService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        RequestDispatcher dispatcher;

        if(user == null) {
            dispatcher = request.getRequestDispatcher("/view/pages/login.jsp");
        } else {
            ArrayList<LectureCardDTO> lectureList = lectureService.getLectureCards();
            request.setAttribute("lectureList", lectureList);
            dispatcher = request.getRequestDispatcher("/view/pages/lecture-reviews.jsp");
        }
        dispatcher.forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
