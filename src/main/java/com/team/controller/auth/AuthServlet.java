package com.team.controller.auth;

import com.google.gson.Gson;
import com.team.common.JsonUtil;
import com.team.dto.auth.VerificationResultDTO;
import com.team.dto.user.EmailRequestDTO;
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

    public AuthService authService = new AuthService();
    private final Gson gson = new Gson();

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
            User loginUser = AuthService.login(loginId);
        }

        if (pathInfo.equals("/verification-code")) {
            String body = JsonUtil.getJsonBody(request);
            HttpSession session = request.getSession();

            if (body.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"요청 본문이 비어있습니다.\"}");
                return;
            }

            EmailRequestDTO emailDTO = gson.fromJson(body, EmailRequestDTO.class);

            VerificationResultDTO resultDTO = authService.sendVerificationCode(emailDTO.getEmail(), session);

            String jsonResponse = gson.toJson(resultDTO);

            response.setContentType("application/json; charset=UTF-8");
            response.getWriter().write(jsonResponse);
        }
    }
}
