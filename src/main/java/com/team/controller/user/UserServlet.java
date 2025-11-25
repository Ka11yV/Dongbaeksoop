package com.team.controller.user;

import com.google.gson.Gson;
import com.team.dto.user.UserRegisterDTO;
import com.team.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.DoubleStream;

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
            System.out.println("checkId");
            String userId = request.getParameter("id");

            boolean isAvailable = userService.isUserIdExists(userId);

            Map<String, Object> responseMap = new HashMap<>();
            responseMap.put("available", !isAvailable);
            responseMap.put("message", isAvailable ? "이미 사용 중인 ID입니다." : "사용 가능한 ID입니다.");

            String jsonResponse = gson.toJson(responseMap);
            response.setContentType("application/json; charset=UTF-8");
            response.getWriter().write(jsonResponse);
            response.getWriter().flush();
            response.getWriter().close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserRegisterDTO userDTO = getRegisterDTO(request);

        userService.registerUser(userDTO);
    }

    // request에서 parameter를 추출해 UserRegisterDTO로 반환합니다.
    private UserRegisterDTO getRegisterDTO(HttpServletRequest request) {

        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        int deptId = Integer.parseInt(request.getParameter("deptId"));
        int grade = Integer.parseInt(request.getParameter("grade"));

        return new UserRegisterDTO(userId, email, password, confirmPassword, deptId, grade);
    }
}
