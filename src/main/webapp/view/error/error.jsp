<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동백숲 - 길을 잃으셨나요?</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #F5F5F7;
            height: 100vh;
            width: 100vw;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        /* Ambient Forest Background */
        .forest-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: radial-gradient(circle at 50% 50%, #FFFFFF 0%, #F2F2F7 100%);
        }

        .orb {
            position: absolute;
            border-radius: 50%;
            filter: blur(60px);
            opacity: 0.6;
            animation: float 8s ease-in-out infinite;
        }

        .orb-1 {
            width: 600px;
            height: 600px;
            background: linear-gradient(180deg, #D1FAE5 0%, #34D399 100%);
            /* Emerald Green */
            top: -20%;
            left: -10%;
            animation-delay: 0s;
        }

        .orb-2 {
            width: 500px;
            height: 500px;
            background: linear-gradient(180deg, #BFDBFE 0%, #60A5FA 100%);
            /* Blue */
            bottom: -10%;
            right: -10%;
            animation-delay: -2s;
        }

        .orb-3 {
            width: 300px;
            height: 300px;
            background: linear-gradient(180deg, #FECACA 0%, #F87171 100%);
            /* Red/Pink (Camellia) */
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0.4;
            animation-delay: -4s;
        }

        @keyframes float {

            0%,
            100% {
                transform: translateY(0) scale(1);
            }

            50% {
                transform: translateY(-20px) scale(1.05);
            }
        }

        /* Glass Card */
        .glass-card {
            background: rgba(255, 255, 255, 0.65);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            border: 1px solid rgba(255, 255, 255, 0.8);
            box-shadow:
                0 20px 40px rgba(0, 0, 0, 0.05),
                0 1px 3px rgba(0, 0, 0, 0.1);
            border-radius: 32px;
            padding: 64px;
            text-align: center;
            max-width: 560px;
            width: 90%;
            position: relative;
            z-index: 10;
        }

        /* Typography */
        .error-code {
            font-size: 140px;
            font-weight: 800;
            line-height: 1;
            letter-spacing: -0.04em;
            background: linear-gradient(135deg, #1D1D1F 0%, #424245 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 24px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .title {
            font-size: 32px;
            font-weight: 700;
            color: #1D1D1F;
            margin-bottom: 16px;
            letter-spacing: -0.02em;
        }

        .description {
            font-size: 19px;
            color: #86868B;
            line-height: 1.5;
            margin-bottom: 48px;
            font-weight: 400;
        }

        /* Button */
        .btn-home {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #1D1D1F;
            color: #FFFFFF;
            font-size: 17px;
            font-weight: 600;
            padding: 16px 32px;
            border-radius: 9999px;
            text-decoration: none;
            transition: all 0.2s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .btn-home:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            background-color: #000000;
        }

        .btn-home svg {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }
    </style>
</head>

<body>
    <div class="forest-bg"></div>
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>

    <div class="glass-card">
        <h1 class="error-code">
            <%= response.getStatus() == 200 ? "404" : response.getStatus() %>
        </h1>
        <h2 class="title">숲에서 길을 잃으셨나요?</h2>
        <p class="description">
            요청하신 페이지를 찾을 수 없습니다.<br>
            동백숲의 아름다운 산책로로 다시 안내해 드릴게요.
        </p>

        <a href="${pageContext.request.contextPath}/" class="btn-home">
            <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                </path>
            </svg>
            홈으로 돌아가기
        </a>
    </div>
</body>
</html>