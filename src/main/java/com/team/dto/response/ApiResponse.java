package com.team.dto.response;

import com.google.gson.Gson; // JSON 변환 라이브러리 (Gson 사용 가정)

public class ApiResponse<T> {

    // 1. 응답의 성공/실패 여부
    private final boolean success;

    // 2. HTTP 상태 코드에 대응하는 비즈니스 상태 코드 (선택적)
    private final String message;

    // 3. 실제 반환할 데이터 (제네릭 타입 T)
    private final T data;

    // 모든 필드를 받는 private 생성자
    private ApiResponse(boolean success, String message, T data) {
        this.success = success;
        this.message = message;
        this.data = data;
    }

    // --- 정적 팩토리 메서드: 성공 응답 생성 ---

    // 데이터 없이 성공 메시지만 보낼 때 (예: 회원가입 성공)
    public static <T> ApiResponse<T> success(String message) {
        return new ApiResponse<>(true, message, null);
    }

    // 데이터와 함께 성공 응답을 보낼 때
    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(true, message, data);
    }

    // --- 정적 팩토리 메서드: 실패/오류 응답 생성 ---

    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(false, message, null);
    }

    // Getter 메서드 (JSON 직렬화를 위해 필요)
    public boolean isSuccess() { return success; }
    public String getMessage() { return message; }
    public T getData() { return data; }

    // DTO 객체를 최종 JSON 문자열로 변환하는 유틸리티 메서드
    public String toJson() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}