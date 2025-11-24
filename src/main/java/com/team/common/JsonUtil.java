package com.team.common;

import jakarta.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;

public class JsonUtil {

    /**
     * HttpServletRequest의 본문(Body) 스트림에서 전체 JSON 문자열을 읽어옵니다.
     * @param request 클라이언트 요청 객체
     * @return 요청 본문의 JSON 문자열
     * @throws IOException 스트림 읽기 중 오류 발생 시
     */
    public static String getJsonBody(HttpServletRequest request) throws IOException {
        // request.getReader()는 요청 본문을 읽기 위한 Reader 객체를 반환합니다.
        try (BufferedReader reader = request.getReader()) {
            StringBuilder jsonBody = new StringBuilder();
            String line;

            // 본문의 모든 줄을 읽어 StringBuilder에 추가합니다.
            while ((line = reader.readLine()) != null) {
                jsonBody.append(line);
            }

            return jsonBody.toString();
        }
    }
}