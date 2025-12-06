package com.team.exception;

// 비즈니스 로직에서 발생하는 유효성 검증 실패 시 사용할 커스텀 예외 클래스입니다.
public class ValidationException extends RuntimeException {

    // 기본 생성자
    public ValidationException() {
        super();
    }

    // 에러 메시지를 포함하는 생성자 (가장 많이 사용)
    public ValidationException(String message) {
        super(message);
    }

    // 에러 메시지와 원인 예외를 함께 넘기는 생성자 (디버깅용)
    public ValidationException(String message, Throwable cause) {
        super(message, cause);
    }
}