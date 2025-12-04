package com.team.controller.user;

import static com.team.common.ServletResponseUtil.sendJsonResponse;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.team.common.JsonUtil;
import com.team.dto.response.ApiResponse;
import com.team.dto.user.UserRegisterDTO;
import com.team.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.xml.bind.ValidationException;
import java.io.IOException;

@WebServlet("/users/*")
public class UserServlet extends HttpServlet {

    private final Gson gson = new Gson();
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo.equals("/register")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/register.jsp");
            dispatcher.forward(request, response);
        }

        else if (pathInfo.equals("/check/id")) {
            String userId = request.getParameter("id");

            boolean isAvailable = userService.isUserIdExists(userId);


            if (isAvailable) {
                ApiResponse<Void> errorResponse = ApiResponse.error("이미 사용중인 아이디입니다.");
                sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
            } else {
                ApiResponse<Void> errorResponse = ApiResponse.success("사용 가능한 ID 입니다.");
                sendJsonResponse(response, HttpServletResponse.SC_OK, errorResponse);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String body = JsonUtil.getJsonBody(request);
        UserRegisterDTO dto = null;

        try {
            dto = gson.fromJson(body, UserRegisterDTO.class);
        } catch (JsonSyntaxException e) {
            ApiResponse<Void> errorResponse = ApiResponse.error("요청 본문이 비어있습니다.");
            sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
            return;
        }

        if (dto == null || dto.getEmail() == null || dto.getPassword() == null || dto.getDeptId() == null || dto.getGrade() == null) {
            ApiResponse<Void> errorResponse = ApiResponse.error("필수 필드가 누락되었습니다.");
            sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
            return;
        }

        try {
            userService.registerUser(dto);

            ApiResponse<Void> successResponse = ApiResponse.success("회원가입에 성공했습니다.");
            sendJsonResponse(response, HttpServletResponse.SC_OK, successResponse);


        } catch (ValidationException e) {
            ApiResponse<Void> errorResponse = ApiResponse.error(e.getMessage());
            sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
        } catch (Exception e) {
            e.printStackTrace();
            ApiResponse<Void> errorResponse = ApiResponse.error(e.getMessage());
            sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
        }
    }
}
