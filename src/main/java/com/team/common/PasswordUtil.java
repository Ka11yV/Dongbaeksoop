package com.team.common;


import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    private static final int WORKLOAD = 10;

    /**
     * 평문 비밀번호를 안전하게 해시합니다.
     * 해시된 문자열에는 솔트(Salt) 정보가 함께 포함되어 있습니다.
     *
     * @param plainPassword 평문 비밀번호
     * @return 해시된 비밀번호 문자열
     */
    public static String hashPassword(String plainPassword) {
        if (plainPassword == null || plainPassword.isEmpty()) {
            throw new IllegalArgumentException("비밀번호는 비어있을 수 없습니다.");
        }
        // genSalt(WORKLOAD)로 솔트(Salt)를 생성하고, hashpw로 해시를 생성합니다.
        String salt = BCrypt.gensalt(WORKLOAD);
        return BCrypt.hashpw(plainPassword, salt);
    }

    /**
     * 주어진 평문 비밀번호와 저장된 해시된 비밀번호가 일치하는지 확인합니다.
     *
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

    // 간단한 테스트 예시
    public static void main(String[] args) {
        String originalPassword = "mySecurePassword123";

        // 1. 비밀번호 해시
        String hashedPassword = hashPassword(originalPassword);
        System.out.println("원본 비밀번호: " + originalPassword);
        // 해시된 비밀번호는 매번 다르게 생성됩니다.
        System.out.println("해시된 비밀번호: " + hashedPassword);

        // 2. 비밀번호 검증 (성공)
        boolean isMatchSuccess = checkPassword(originalPassword, hashedPassword);
        System.out.println("검증 결과 (성공): " + isMatchSuccess); // true

        // 3. 비밀번호 검증 (실패)
        boolean isMatchFailure = checkPassword("wrongPassword", hashedPassword);
        System.out.println("검증 결과 (실패): " + isMatchFailure); // false

        // 4. 두 번째 해시가 첫 번째 해시와 다른지 확인
        String anotherHash = hashPassword(originalPassword);
        System.out.println("두 번째 해시: " + anotherHash);
        System.out.println("첫 번째 해시와 두 번째 해시가 같은가? " + hashedPassword.equals(anotherHash)); // false (솔트가 다르기 때문)
    }
}
