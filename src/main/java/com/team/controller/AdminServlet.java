    package com.team.controller;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.team.common.JsonUtil;
import com.team.dto.response.ApiResponse;
import com.team.entity.User;
import com.team.service.AdminDashboardService;
import com.team.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.team.exception.ValidationException;
import java.io.IOException;
import java.util.List;

import static com.team.common.ServletResponseUtil.sendJsonResponse;

@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {

    private static class UpdateRequest {
        String userId;
        boolean isBan;
    }
    Gson gson = new Gson();
    UserService userService = new UserService();
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



        protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String pathInfo = request.getPathInfo();
            UpdateRequest dto = null;

            if (pathInfo.equals("/status")) {
                String body = JsonUtil.getJsonBody(request);

                try {
                    dto = gson.fromJson(body, UpdateRequest.class);
                } catch (JsonSyntaxException e) {
                    ApiResponse<Void> errorResponse = ApiResponse.error("요청 본문이 비어있습니다.");
                    sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
                    return;
                }

                try {
                    Boolean Success = userService.updateBanStatus(dto.userId, dto.isBan);

                    ApiResponse<Void> successResponse = ApiResponse.success("유저 상태 변경에 성공했습니다.");
                    sendJsonResponse(response, HttpServletResponse.SC_OK, successResponse);

                } catch(ValidationException e) {
                    e.printStackTrace();
                    ApiResponse<Void> errorResponse = ApiResponse.error(e.getMessage());
                    sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
                }
            }
        }


}
