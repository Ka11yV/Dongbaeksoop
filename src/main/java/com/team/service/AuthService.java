package com.team.service;

import com.oracle.wls.shaded.org.apache.bcel.verifier.VerificationResult;
import com.team.common.EmailAuthCodeGenerator;
import com.team.common.EmailSender;
import com.team.common.PasswordUtil;
import com.team.dao.AuthDAO;
import com.team.dao.UserDAO;
import com.team.dto.auth.VerificationResultDTO;
import com.team.dto.user.UserLoginDTO;
import com.team.entity.User;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;
import jakarta.xml.bind.ValidationException;

public class AuthService {

    private static final long AUTH_TIME_LIMIT_MS = 180 * 1000; // 3분 (180초)

    AuthDAO authDAO = new AuthDAO();
    UserDAO userDAO = new UserDAO();

     public User login(UserLoginDTO userLoginDTO) {  // userLoginDTO는 사용자가 로그인폼에 작성한 아이디, 비밀번호 묶음
         // 유효성 검사
         // 비어있는지
         if ((userLoginDTO.getUserId()).isEmpty()) {
             throw new RuntimeException("아이디가 비어있습니다.");
         } else if ((userLoginDTO.getPassword()).isEmpty()) {
             throw new RuntimeException("비밀번호가 비어있습니다.");
         }

         // 아이디로 조회 했을때 컬럼이 있는지 확인
         User user = authDAO.getByUserId(userLoginDTO.getUserId());  // SELECT user_id, password FROM user WHERE user_id = "userLoginDTO.getUSerId()";  쿼리 수행. 조회되면 User 객체 반환, 아니면 null 반환

         if(user != null) {  // 반환값 있으면
             String formPassword = userLoginDTO.getPassword();
             String dbPassword = user.getPassword();


             if(PasswordUtil.checkPassword(formPassword, dbPassword)) {
                 return user;
             } else {
                 throw new RuntimeException("비밀번호가 틀렸습니다.");
             }

         } else {  // 반환값 없으면
             throw new RuntimeException("아이디가 존재하지 않습니다.");
         }
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
