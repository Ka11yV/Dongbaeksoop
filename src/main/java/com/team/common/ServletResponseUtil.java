package com.team.common;

import com.team.dto.response.ApiResponse;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletResponseUtil {

    /**
     * ApiResponse 객체를 JSON으로 직렬화하여 클라이언트에 응답을 전송
     * @param response 서블릿 응답 객체
     * @param statusCode 응답할 HTTP 상태 코드
     * @param apiResponse ApiResponse 객체 (성공/실패 포함)
     * @throws IOException 스트림 작성 중 오류 발생 시
     */
    public static <T> void sendJsonResponse(HttpServletResponse response, int statusCode, ApiResponse<T> apiResponse) throws IOException {

        // HTTP 상태 코드 설정
        response.setStatus(statusCode);

        // Content Type 설정 (JSON 전송 필수)
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // DTO 객체를 JSON 문자열로 변환 (ApiResponse 내부의 toJson() 사용)
        String jsonString = apiResponse.toJson();

        // 응답 본문에 작성 및 플러시
        response.getWriter().write(jsonString);
        response.getWriter().flush();
    }
}