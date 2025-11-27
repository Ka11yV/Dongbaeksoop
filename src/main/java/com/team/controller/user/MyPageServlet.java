package com.team.controller.user;
import com.team.dto.response.ApiResponse;
import com.team.dto.user.UpdateInfoDTO;
import com.team.entity.User;
import com.team.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.google.gson.Gson;
import java.io.BufferedReader;

import static com.team.common.ServletResponseUtil.sendJsonResponse;

@WebServlet("/my-page/*")
public class MyPageServlet  extends HttpServlet {
    UserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("loggedInUser");

        if(user != null) {  // setAttribute("loggedInUser")가 안 되어 있을 상황 방지
            String dept = userService.selectUserDept(user);
            request.setAttribute("dept_name", dept);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/my-page.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }
        String jsonBody = jsonBuffer.toString();

        if (jsonBody == null || jsonBody.trim().isEmpty()) {
            sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, ApiResponse.error("요청 본문이 비어 있습니다."));
            return;
        }

        Gson gson = new Gson();
        UpdateInfoDTO updateInfoDTO = gson.fromJson(jsonBody, UpdateInfoDTO.class);

        if (updateInfoDTO == null) {
            sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, ApiResponse.error("잘못된 요청 형식입니다."));
            return;
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        updateInfoDTO.setUser_id(user.getUserId());

        boolean isUpdateDeptAndGrade = userService.updateDeptAndGrade(updateInfoDTO);

        if(isUpdateDeptAndGrade) {  // 성공
            System.out.println("업데이트 성공");
            ApiResponse<Void> successResponse = ApiResponse.success("업데이트 완료");
            sendJsonResponse(response, HttpServletResponse.SC_OK, successResponse);
        } else {
            System.out.println("업데이트 실패");
            ApiResponse<Void> errorResponse = ApiResponse.error("필수 필드가 누락되었습니다.");
            sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo.equals("/change-dept-grade")) {
            StringBuilder jsonBuffer = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuffer.append(line);
                }
            }
            String jsonBody = jsonBuffer.toString();
            Gson gson = new Gson();

            UpdateInfoDTO updateInfoDTO = gson.fromJson(jsonBody, UpdateInfoDTO.class);

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedInUser");

            updateInfoDTO.setUser_id(user.getUserId());

            boolean isUpdateDeptAndGrade = userService.updateDeptAndGrade(updateInfoDTO);

            if(isUpdateDeptAndGrade) {  // 성공
                System.out.println("업데이트 성공");
                ApiResponse<Void> successResponse = ApiResponse.success("업데이트 완료");
                sendJsonResponse(response, HttpServletResponse.SC_OK, successResponse);
            } else {
                System.out.println("업데이트 실패");
                ApiResponse<Void> errorResponse = ApiResponse.error("필수 필드가 누락되었습니다.");
                sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
            }
        }
        if (pathInfo.equals("/change-password")) {
            StringBuilder jsonBuffer = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuffer.append(line);
                }
            }
            String jsonBody = jsonBuffer.toString();
            Gson gson = new Gson();

            UpdateInfoDTO updateInfoDTO = gson.fromJson(jsonBody, UpdateInfoDTO.class);

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedInUser");

            updateInfoDTO.setUser_id(user.getUserId());

            boolean isUpdateDeptAndGrade = userService.updatePassword(updateInfoDTO);

            if(isUpdateDeptAndGrade) {  // 성공
                System.out.println("업데이트 성공");
                ApiResponse<Void> successResponse = ApiResponse.success("업데이트 완료");
                sendJsonResponse(response, HttpServletResponse.SC_OK, successResponse);
            } else {
                System.out.println("업데이트 실패");
                ApiResponse<Void> errorResponse = ApiResponse.error("필수 필드가 누락되었습니다.");
                sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
            }
        }

    }
}
