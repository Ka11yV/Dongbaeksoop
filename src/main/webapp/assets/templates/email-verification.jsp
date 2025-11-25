<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동백숲 이메일 인증</title>
</head>

<body
    style="margin: 0; padding: 0; background-color: #F8FAFC; font-family: 'Apple SD Gothic Neo', 'Malgun Gothic', sans-serif;">
    <table border="0" cellpadding="0" cellspacing="0" width="100%"
        style="max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 16px; overflow: hidden; margin-top: 40px; margin-bottom: 40px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);">
        <!-- Header -->
        <tr>
            <td style="background-color: #2563EB; padding: 40px 0; text-align: center;">
                <h1 style="color: #ffffff; margin: 0; font-size: 24px; font-weight: bold;">동백숲</h1>
            </td>
        </tr>

        <!-- Body -->
        <tr>
            <td style="padding: 40px 30px;">
                <div style="text-align: center;">
                    <!-- 현재 feature/register 호스팅이라서 merge 후 바꿔야함 -->
                    <img src="https://jumpshare.com/share/jMSJRQaD1CVzKtdFSgrr?b=3AjmC66E3TR8QZo0iiQX"
<%--                    <img src="https://cdn.jsdelivr.net/gh/Ka11yV/Dongbaeksoop@feature/register/src/main/webapp/assets/images/mascot.svg"--%>
                        alt="동백숲 마스코트" style="width: 100px; height: 100px; margin-bottom: 20px;">

                    <h2 style="color: #0F172A; font-size: 20px; font-weight: bold; margin: 0 0 10px 0;">이메일 인증을 완료해주세요
                    </h2>
                    <p style="color: #64748B; font-size: 16px; line-height: 1.6; margin: 0 0 30px 0;">
                        안녕하세요! 동백숲 가입을 환영합니다.<br>
                        아래의 인증번호 6자리를 회원가입 화면에 입력해주세요.
                    </p>

                    <!-- Verification Code Box -->
                    <div style="background-color: #F1F5F9; border-radius: 12px; padding: 20px; margin-bottom: 30px;">
                        <span
                            style="color: #2563EB; font-size: 32px; font-weight: bold; letter-spacing: 8px;">${Session}</span>
                    </div>

                    <p style="color: #94A3B8; font-size: 14px; margin: 0;">
                        인증번호는 3분간 유효합니다.<br>
                        본인이 요청하지 않았다면 이 메일을 무시해주세요.
                    </p>
                </div>
            </td>
        </tr>

        <!-- Footer -->
        <tr>
            <td style="background-color: #F8FAFC; padding: 20px; text-align: center; border-top: 1px solid #E2E8F0;">
                <p style="color: #94A3B8; font-size: 12px; margin: 0;">
                    © 2025 Dongbaeksoop. All rights reserved.<br>
                    동양미래대학교 동백숲 프로젝트
                </p>
            </td>
        </tr>
    </table>
</body>

</html>