package com.team.controller.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.team.common.JsonUtil;
import com.team.dto.auth.VerificationResultDTO;
import com.team.dto.user.EmailRequestDTO;
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

    public AuthService authService = new AuthService();
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        // 로그인
        if (pathInfo.equals("/login")) {
            HttpSession session = request.getSession();

            if (session.getAttribute("user") != null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/login.jsp");
            dispatcher.forward(request, response);
        }

        // 로그아웃
        if(pathInfo.equals("/logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("loggedInUser");
            session.removeAttribute("successLogin");
            response.sendRedirect(request.getContextPath() + "/");
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

                System.out.println("로그인 아이디 : " + user.getUserId());
                System.out.println("로그인 비밀번호 : " + user.getPassword());

                // 로그인 성공
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", user);
                session.setAttribute("successLogin", true);
                response.sendRedirect("/");  // 로그인 성공 시 홈 화면으로 이동
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

            if (!resultDTO.isSuccess()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }

            String jsonResponse = gson.toJson(resultDTO);

            response.setContentType("application/json; charset=UTF-8");
            response.getWriter().write(jsonResponse);
        }

        if (pathInfo.equals("/verification")) {
            String body = JsonUtil.getJsonBody(request);
            HttpSession session = request.getSession();

            if (body.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"요청 본문이 비어있습니다.\"}");
                return;
            }

            JsonObject jsonObject = gson.fromJson(body, JsonObject.class);

            if (jsonObject == null || !jsonObject.has("code")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(gson.toJson(new VerificationResultDTO(false, "JSON 필드 'code'가 누락되었습니다.")));
                return;
            }

            // code 필드의 값을 문자열로 추출
            String code = jsonObject.get("code").getAsString();

            if (code.equals(session.getAttribute("verificationCode"))) {
                response.getWriter().write("{\"success\": true, \"message\": \"이메일 인증이 완료되었습니다.\"}");
                response.getWriter().flush();
                return;
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"인증번호가 일치하지 않습니다.\"}");
                response.getWriter().flush();
                return;
            }
        }
    }
}
