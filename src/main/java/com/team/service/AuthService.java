package com.team.service;

import com.oracle.wls.shaded.org.apache.bcel.verifier.VerificationResult;
import com.team.common.EmailAuthCodeGenerator;
import com.team.common.EmailSender;
import com.team.dao.AuthDAO;
import com.team.dao.UserDAO;
import com.team.dto.auth.VerificationResultDTO;
import com.team.entity.User;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;

public class AuthService {
    AuthDAO authDAO = new AuthDAO();
    UserDAO userDAO = new UserDAO();

    private static final long AUTH_TIME_LIMIT_MS = 180 * 1000; // 3분 (180초)

    public User login(String loginId) {
        return authDAO.getByUserId(loginId);
    }

    public VerificationResultDTO sendVerificationCode(String email, HttpSession session) {
        if (email == null || !email.contains("@")) {
            return new VerificationResultDTO(false, "유효하지 않은 이메일 형식입니다.");
        }

        if (!email.endsWith("@m365.dongyang.ac.kr")) {
            return new VerificationResultDTO(false, "학교 이메일(\"@m365.dongyang.ac.kr\")만 사용할 수 있습니다.");
        }

        try {
            if (userDAO.isEmailExists(email)) {
                return new VerificationResultDTO(false, "중복된 이메일 입니다.");
            }

            // 6자리 랜덤 인증번호 생성
            String verificationCode = EmailAuthCodeGenerator.generateCode();
            System.out.println(verificationCode);

            // 세션에 인증번호 저장
            session.setAttribute("verificationCode", verificationCode);
            session.setAttribute("verificationTime", System.currentTimeMillis());
            session.setMaxInactiveInterval(300);

            EmailSender.sendVerificationEmail(email, verificationCode);

            return new VerificationResultDTO(true, "인증번호가 발송되었습니다. 3분 이내에 입력해주세요.");

        } catch (MessagingException e) {
            e.printStackTrace();
            return new VerificationResultDTO(false, "메일 서버 오류로 발송에 실패했습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return new VerificationResultDTO(false, "알 수 없는 서버 오류가 발생했습니다.");
        }

    }
}
