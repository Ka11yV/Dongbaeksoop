package com.team.common;

import io.github.cdimascio.dotenv.Dotenv;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailSender {
    private static final Dotenv dotenv = Dotenv.load();
    private static final String HOST = dotenv.get("MAIL_HOST");
    private static final String PORT = dotenv.get("MAIL_PORT");
    private static final String USERNAME = dotenv.get("MAIL_USERNAME");
    private static final String PASSWORD = dotenv.get("MAIL_PASSWORD");


    public static void sendVerificationEmail(String toEmail, String authCode) throws MessagingException {
        // 1. SMTP 프로퍼티 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // 2. 인증 객체 생성
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });

        // 3. 메일 메시지 작성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(USERNAME));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject("[동백숲] 이메일 인증번호");

        // HTML 형식의 본문 (사용자 디자인 적용)
        // 자바 문자열 내부에서 HTML 속성의 따옴표(")는 \" 로 이스케이프 처리해야 합니다.
        String htmlContent =
                "<!DOCTYPE html>" +
                        "<html lang=\"ko\">" +
                        "<head>" +
                        "    <meta charset=\"UTF-8\">" +
                        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                        "    <title>동백숲 이메일 인증</title>" +
                        "</head>" +
                        "<body style=\"margin: 0; padding: 0; background-color: #F8FAFC; font-family: 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;\">" +
                        "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"" +
                        "        style=\"max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 16px; overflow: hidden; margin-top: 40px; margin-bottom: 40px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);\">" +
                        "        <!-- Header -->" +
                        "        <tr>" +
                        "            <td style=\"background-color: #2563EB; padding: 40px 0; text-align: center;\">" +
                        "                <h1 style=\"color: #ffffff; margin: 0; font-size: 24px; font-weight: bold;\">동백숲</h1>" +
                        "            </td>" +
                        "        </tr>" +
                        "        <!-- Body -->" +
                        "        <tr>" +
                        "            <td style=\"padding: 40px 30px;\">" +
                        "                <div style=\"text-align: center;\">" +
                        "                    <img src=\"https://cdn.jsdelivr.net/gh/Ka11yV/Dongbaeksoop@feature/register/src/main/webapp/assets/images/mascot.svg\"" +
                        "                        alt=\"동백숲 마스코트\" style=\"width: 100px; height: 100px; margin-bottom: 20px;\">" +
                        "                    <h2 style=\"color: #0F172A; font-size: 20px; font-weight: bold; margin: 0 0 10px 0;\">이메일 인증을 완료해주세요</h2>" +
                        "                    <p style=\"color: #64748B; font-size: 16px; line-height: 1.6; margin: 0 0 30px 0;\">" +
                        "                        안녕하세요! 동백숲 가입을 환영합니다.<br>" +
                        "                        아래의 인증번호 6자리를 회원가입 화면에 입력해주세요." +
                        "                    </p>" +
                        "                    <!-- Verification Code Box -->" +
                        "                    <div style=\"background-color: #F1F5F9; border-radius: 12px; padding: 20px; margin-bottom: 30px;\">" +
                        "                        <span style=\"color: #2563EB; font-size: 32px; font-weight: bold; letter-spacing: 8px;\">" +

                        // 여기가 핵심: ${Session} 대신 authCode 변수 삽입
                        authCode +

                        "                        </span>" +
                        "                    </div>" +
                        "                    <p style=\"color: #94A3B8; font-size: 14px; margin: 0;\">" +
                        "                        인증번호는 3분간 유효합니다.<br>" +
                        "                        본인이 요청하지 않았다면 이 메일을 무시해주세요." +
                        "                    </p>" +
                        "                </div>" +
                        "            </td>" +
                        "        </tr>" +
                        "        <!-- Footer -->" +
                        "        <tr>" +
                        "            <td style=\"background-color: #F8FAFC; padding: 20px; text-align: center; border-top: 1px solid #E2E8F0;\">" +
                        "                <p style=\"color: #94A3B8; font-size: 12px; margin: 0;\">" +
                        "                    © 2025 Dongbaeksoop. All rights reserved.<br>" +
                        "                    동양미래대학교 동백숲 프로젝트" +
                        "                </p>" +
                        "            </td>" +
                        "        </tr>" +
                        "    </table>" +
                        "</body>" +
                        "</html>";

        message.setContent(htmlContent, "text/html; charset=utf-8");

        // 4. 발송
        Transport.send(message);
        System.out.println("메일 발송 완료: " + toEmail);
    }

}
