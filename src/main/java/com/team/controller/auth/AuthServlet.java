package com.team.controller.auth;

import com.sun.net.httpserver.Request;
import com.team.dto.user.UserLoginDTO;
import com.team.entity.User;
import com.team.service.AuthService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/auth/*")
public class AuthServlet extends HttpServlet {
    AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo.equals("/login")) {  // 페이지 forward 용도
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo.equals("/login")) {  // login 로직
            String loginId = request.getParameter("id");
            String loginPassword = request.getParameter("password");

            UserLoginDTO userLoginDTO = new UserLoginDTO(loginId, loginPassword);

            try {
                // 로그인 시도
                User user = authService.login(userLoginDTO);  // true면 로그인 성공

                System.out.println(user.getUserId());
                System.out.println(user.getPassword());

                // 로그인 성공
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", user);
                response.sendRedirect("/view/pages/index.jsp");  // 로그인 성공 시 홈 화면으로 이동
            } catch(RuntimeException e) {
                // 로그인 실패
                e.printStackTrace();
                System.out.println("로그인 실패");
                request.setAttribute("loginErrorMsg", e.getMessage());
                System.out.println(request.getAttribute("loginErrorMsg"));
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/login.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
