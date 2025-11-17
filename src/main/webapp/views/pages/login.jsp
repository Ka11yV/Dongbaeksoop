<%--
  Created by IntelliJ IDEA.
  User: sergiopear
  Date: 2025. 11. 17.
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>
    <div class="min-h-screen flex items-center justify-center bg-gray-50 p-4">
        <div class="w-full max-w-md bg-white rounded-2xl shadow-xl border border-black/10 flex flex-col items-center p-6 sm:p-8 space-y-6">

            <header class="w-full flex flex-col items-center space-y-4 pt-4">
                <div class="size-16 bg-sky-700 rounded-xl flex items-center justify-center">
                    <div class="text-4xl">🌲</div>
                </div>
                <h1 class="text-2xl font-medium text-neutral-950">동백숲에 오신 것을 환영합니다</h1>
                <p class="text-base text-gray-500">동양미래대 학생들을 위한 강의 평가 서비스</p>
            </header>

            <hr class="w-full border-t border-gray-200" />

            <section class="w-full flex flex-col space-y-6">

                <div class="w-full space-y-2">
                    <label for="username" class="text-sm font-medium text-neutral-950">아이디</label>
                    <input id="username" type="text" placeholder="아이디를 입력하세요" class="w-full h-10 px-3 py-2 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm placeholder-gray-500">
                </div>

                <div class="w-full space-y-2">
                    <label for="password" class="text-sm font-medium text-neutral-950">비밀번호</label>
                    <input id="password" type="password" placeholder="비밀번호를 입력하세요" class="w-full h-10 px-3 py-2 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm placeholder-gray-500">
                </div>

                <button class="w-full h-10 bg-sky-700 hover:bg-sky-800 rounded-lg flex items-center justify-center transition duration-150">
                    <span class="text-white text-base font-medium">로그인</span>
                </button>

                <div class="w-full text-center">
                    <a href="#" class="text-sm text-gray-600 hover:text-gray-800 transition duration-150">비밀번호를 잊으셨나요?</a>
                </div>
            </section>

            <footer class="w-full flex items-center justify-center pt-4">
                <span class="text-sm text-gray-600">계정이 없으신가요?</span>
                <a href="#" class="ml-1 text-sm font-medium text-sky-700 hover:text-sky-800 transition duration-150">회원가입</a>
            </footer>
        </div>
    </div>
</body>
</html>
