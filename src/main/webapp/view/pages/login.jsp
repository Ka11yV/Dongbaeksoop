<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인 - 동백숲</title>
        <link href="${pageContext.request.contextPath}/assets/styles/output.css" rel="stylesheet">
        <link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
        <style>
            body {
                font-family: 'Pretendard', sans-serif;
                background-color: #F8FAFC;
                color: #0F172A;
            }

            .glass-header {
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            }
        </style>
    </head>

    <body class="antialiased">
        <%@ include file="/view/common/header.jsp" %>

            <main class="pt-16 min-h-screen flex items-center justify-center bg-gray-50 p-4">
                <div
                    class="w-full max-w-md bg-white rounded-2xl shadow-xl border border-gray-100 flex flex-col items-center p-6 sm:p-8 space-y-6">

                    <header class="w-full flex flex-col items-center space-y-4 pt-4">
                        <div class="size-16 rounded-2xl flex items-center justify-center">
                            <img src="${pageContext.request.contextPath}/assets/images/mascot.svg" alt="동백숲 마스코트">
                        </div>
                        <h1 class="text-2xl font-bold text-dark">동백숲에 오신 것을 환영합니다</h1>
                        <p class="text-base text-gray-500">동양미래대 학생들을 위한 스마트 캠퍼스</p>
                    </header>

                    <div class="w-full border-t border-gray-100"></div>

                    <form class="w-full flex flex-col space-y-6" method="post" action="/auth/login">
                        <div class="w-full space-y-2">
                            <label for="username" class="text-sm font-medium text-dark">아이디</label>
                            <input id="username" name="id" type="text" placeholder="아이디를 입력하세요"
                                class="w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm placeholder-gray-400">
                        </div>

                        <div class="w-full space-y-2">
                            <label for="password" class="text-sm font-medium text-dark">비밀번호</label>
                            <input id="password" name="password" type="password" placeholder="비밀번호를 입력하세요"
                                class="w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm placeholder-gray-400">
                        </div>

                        <button type="submit" id="submit"
                            class="cursor-pointer w-full h-12 bg-primary hover:bg-secondary rounded-xl flex items-center justify-center transition-all shadow-lg shadow-blue-500/30 hover:shadow-blue-500/40 transform hover:-translate-y-0.5">
                            <span class="text-white text-base font-bold">로그인</span>
                        </button>

                        <div class="w-full text-center">
                            <a href="#" class="text-sm text-gray-500 hover:text-primary transition-colors">비밀번호를
                                잊으셨나요?</a>
                        </div>
                    </form>

                    <footer class="w-full flex items-center justify-center pt-4">
                        <span class="text-sm text-gray-500">계정이 없으신가요?</span>
                        <a href="${pageContext.request.contextPath}/register"
                            class="ml-2 text-sm font-bold text-primary hover:text-secondary transition-colors">회원가입</a>
                    </footer>
                </div>
            </main>
        <script src="${pageContext.request.contextPath}/assets/scripts/login.js"></script>
    <%@ include file="/view/common/footer.jsp" %>
    </body>

    </html>