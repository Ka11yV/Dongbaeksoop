package com.team.dto.auth;

/**
 * 이메일 인증 서비스의 결과를 담는 DTO (Data Transfer Object)
 * success: 인증 성공/실패 여부 (boolean)
 * message: 사용자에게 보여줄 메시지 (String)
 */
public class VerificationResultDTO {
    private final boolean success;
    private final String message;

    public VerificationResultDTO(boolean success, String message) {
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