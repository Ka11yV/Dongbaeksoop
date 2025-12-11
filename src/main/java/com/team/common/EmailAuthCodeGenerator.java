package com.team.common;

import java.security.SecureRandom;

public class EmailAuthCodeGenerator {

    // 암호학적으로 강력한 난수 생성기 (비용이 조금 더 들지만 보안 필수)
    private static final SecureRandom secureRandom = new SecureRandom();

    /**
     * 6자리 숫자 인증번호를 생성
     * @return 6자리 숫자 문자열 (예: "048219")
     */
    public static String generateCode() {
        StringBuilder code = new StringBuilder();

        // 0~9 사이의 난수를 6번 뽑아서 이어 붙임
        for (int i = 0; i < 6; i++) {
            int randomNum = secureRandom.nextInt(10); // 0 이상 10 미만
            code.append(randomNum);
        }

        return code.toString();
    }


}