package com.team.controller;

import com.team.entity.User;
import com.team.service.AdminDashboardService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    AdminDashboardService dashboardService = new AdminDashboardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            int userCount = dashboardService.getUserCount();

            List<User> userList = dashboardService.getUserList();

            request.setAttribute("userCount", userCount);
            request.setAttribute("userList", userList);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/admin.jsp");
        dispatcher.forward(request, response);
    }


}
