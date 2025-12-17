package com.team.controller.assignment;

import com.team.dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/assignments")
public class AssignmentsServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        jakarta.servlet.http.HttpSession session = request.getSession(false);
        com.team.entity.User loggedInUser = (session != null)
                ? (com.team.entity.User) session.getAttribute("loggedInUser")
                : null;

        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        // DB에서 최신 유저 정보 조회 (세션 정보가 낡았을 수 있음)
        com.team.entity.User currentUser = userDAO.getByUserId(loggedInUser.getUserId());

        if (currentUser.getSchoolPassword() == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/school-login.jsp");
            dispatcher.forward(request, response);
        } else {
            com.team.dao.AssignmentDAO assignmentDAO = new com.team.dao.AssignmentDAO();
            java.util.List<com.team.entity.Assignment> assignments = assignmentDAO
                    .getAssignmentsByUserId(currentUser.getId());
            request.setAttribute("assignments", assignments);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/assignments.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        jakarta.servlet.http.HttpSession session = request.getSession(false);
        com.team.entity.User loggedInUser = (session != null)
                ? (com.team.entity.User) session.getAttribute("loggedInUser")
                : null;

        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        String schoolPassword = request.getParameter("schoolPassword");

        if (schoolPassword != null && !schoolPassword.trim().isEmpty()) {
            try {
                // 1. 이메일에서 아이디 추출
                String email = loggedInUser.getEmail();
                String username = email.split("@")[0];

                // 2. Webhook을 통한 검증
                VerificationResult verificationResult = verifySchoolAccount(username, schoolPassword);

                if (verificationResult.isSuccess()) {
                    // 3. 검증 성공 시 암호화 및 저장
                    String encryptedPassword = com.team.common.AES256Util.encrypt(schoolPassword);
                    userDAO.updateSchoolPassword(loggedInUser.getUserId(), encryptedPassword);

                    // 세션 정보 업데이트
                    loggedInUser.setSchoolPassword(encryptedPassword);
                    session.setAttribute("loggedInUser", loggedInUser);

                    response.sendRedirect(request.getContextPath() + "/assignments");
                } else {
                    // 4. 검증 실패 시 에러 메시지 표시
                    request.setAttribute("errorMessage", verificationResult.getMessage());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/school-login.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "학교 계정 연동 중 오류가 발생했습니다.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/school-login.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "비밀번호를 입력해주세요.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/school-login.jsp");
            dispatcher.forward(request, response);
        }
    }

    private VerificationResult verifySchoolAccount(String username, String password) {
        String webhookUrl = "http://209.97.165.251:5678/webhook/a87c9e2b-81c3-49a7-808e-8cc85099d751";
        try {
            java.net.URL url = new java.net.URL(webhookUrl);
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setDoOutput(true);

            com.google.gson.JsonObject jsonInput = new com.google.gson.JsonObject();
            jsonInput.addProperty("username", username);
            jsonInput.addProperty("password", password);

            try (java.io.OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInput.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            java.io.InputStream inputStream;
            if (responseCode >= 200 && responseCode < 300) {
                inputStream = conn.getInputStream();
            } else {
                inputStream = conn.getErrorStream();
            }

            if (inputStream == null) {
                return new VerificationResult(false, "학교 서버와 통신할 수 없습니다. (HTTP " + responseCode + ")");
            }

            try (java.io.BufferedReader br = new java.io.BufferedReader(
                    new java.io.InputStreamReader(inputStream, java.nio.charset.StandardCharsets.UTF_8))) {
                StringBuilder response = new StringBuilder();
                String responseLine = null;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }

                try {
                    com.google.gson.JsonObject jsonResponse = com.google.gson.JsonParser
                            .parseString(response.toString()).getAsJsonObject();
                    boolean success = false;
                    if (jsonResponse.has("success")) {
                        success = Boolean.parseBoolean(jsonResponse.get("success").getAsString());
                    }
                    String message = "학교 계정 연동에 실패했습니다.";
                    if (jsonResponse.has("message")) {
                        message = jsonResponse.get("message").getAsString();
                    }

                    return new VerificationResult(success, message);
                } catch (Exception e) {
                    return new VerificationResult(false, "학교 서버 응답을 처리할 수 없습니다. (HTTP " + responseCode + ")");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return new VerificationResult(false, "학교 서버 통신 중 오류가 발생했습니다.");
        }
    }

    private static class VerificationResult {
        private final boolean success;
        private final String message;

        public VerificationResult(boolean success, String message) {
            this.success = success;
            this.message = message;
        }

        public boolean isSuccess() {
            return success;
        }

        public String getMessage() {
            return message;
        }
    }
}
