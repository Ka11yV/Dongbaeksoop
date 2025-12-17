package com.team.controller.user;

import com.team.dto.response.ApiResponse;
import com.team.dto.user.UserUpdateRequestDTO;
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
import com.google.gson.GsonBuilder;
import java.io.BufferedReader;
import java.sql.SQLException;

import static com.team.common.ServletResponseUtil.sendJsonResponse;

@WebServlet("/my-page/*")
public class MyPageServlet extends HttpServlet {
    // service
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/pages/my-page.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        StringBuilder jsonBuffer = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }
        String jsonBody = jsonBuffer.toString();
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(int.class, new com.google.gson.TypeAdapter<Integer>() {
                    @Override
                    public void write(com.google.gson.stream.JsonWriter out, Integer value) throws IOException {
                        out.value(value);
                    }

                    @Override
                    public Integer read(com.google.gson.stream.JsonReader in) throws IOException {
                        if (in.peek() == com.google.gson.stream.JsonToken.NULL) {
                            in.nextNull();
                            return 0;
                        }
                        if (in.peek() == com.google.gson.stream.JsonToken.STRING) {
                            String str = in.nextString();
                            if (str.isEmpty())
                                return 0;
                            try {
                                return Integer.parseInt(str);
                            } catch (NumberFormatException e) {
                                return 0;
                            }
                        }
                        return in.nextInt();
                    }
                })
                .create();

        if (pathInfo.equals("/change-dept-grade")) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedInUser");

            UserUpdateRequestDTO userUpdateRequestDTO = gson.fromJson(jsonBody, UserUpdateRequestDTO.class);
            userUpdateRequestDTO.setUserId(user.getUserId());

            try {
                boolean isUpdateDeptAndGrade = userService.updateDeptAndGrade(userUpdateRequestDTO);

                if (isUpdateDeptAndGrade) {
                    System.out.println("업데이트 성공");
                    ApiResponse<Void> successResponse = ApiResponse.success("업데이트 완료");
                    sendJsonResponse(response, HttpServletResponse.SC_OK, successResponse);
                }
            } catch (RuntimeException e) {
                System.out.println(e.getMessage());

                if (e.getMessage().contains("SQL")) {
                    ApiResponse<Void> errorResponse = ApiResponse.error("시스템 오류가 발생하였습니다.");
                    sendJsonResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, errorResponse);
                } else {
                    ApiResponse<Void> errorResponse = ApiResponse.error("일치하는 회원정보를 찾을 수 없습니다.");
                    sendJsonResponse(response, HttpServletResponse.SC_BAD_REQUEST, errorResponse);
                }
            }
        }

        if (pathInfo.equals("/change-password")) {
            UserUpdateRequestDTO userUpdateRequestDTO = gson.fromJson(jsonBody, UserUpdateRequestDTO.class);

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loggedInUser");

            userUpdateRequestDTO.setUserId(user.getUserId());

            boolean isUpdateDeptAndGrade = userService.updatePassword(userUpdateRequestDTO);

            if (isUpdateDeptAndGrade) { // 성공
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
