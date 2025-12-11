package com.team.common;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    private static final int WORKLOAD = 10;

    /**
     * 평문 비밀번호를 안전하게 해시
     * 해시된 문자열에는 솔트(Salt) 정보가 함께 포함되어 있습니다.
     * @param plainPassword 평문 비밀번호
     * @return 해시된 비밀번호 문자열
     */
    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.isEmpty()) {
            throw new IllegalArgumentException("비밀번호는 비어있을 수 없습니다.");
        }
        // genSalt(WORKLOAD)로 솔트(Salt)를 생성하고, hashpw로 해시를 생성
        String salt = BCrypt.gensalt(WORKLOAD);
        return BCrypt.hashpw(plainPassword, salt);
    }

    /**
     * 주어진 평문 비밀번호와 저장된 해시된 비밀번호가 일치하는지 확인
     * @param plainPassword 사용자가 입력한 평문 비밀번호
     * @param hashedPassword 데이터베이스에 저장된 해시된 비밀번호
     * @return 비밀번호가 일치하면 true, 그렇지 않으면 false
     */
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) {
            // 어느 하나라도 null이면 비교할 수 없으므로 false 반환
            return false;
        }

        // BCrypt.checkpw()가 내부적으로 해시된 문자열에서 솔트를 추출하여 비교합니다.
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}
