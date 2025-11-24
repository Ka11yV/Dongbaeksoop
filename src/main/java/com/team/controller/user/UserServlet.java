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


@WebServlet("/users/*")
public class UserServlet extends HttpServlet {

    private final Gson gson = new Gson();
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo.equals("/register")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/register.jsp");
            dispatcher.forward(request, response);

        }

        if(pathInfo.startsWith("/check-id")) {
            String userId = request.getParameter("userId");
            System.out.println(userId);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
