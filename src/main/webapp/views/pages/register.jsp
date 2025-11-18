<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
  <title>동백숲</title>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>
<div class="min-h-screen flex items-center justify-center bg-gray-50 p-4">
  <div class="w-full max-w-xl bg-white rounded-2xl shadow-xl border border-black/10 flex flex-col items-center p-6 sm:p-8 space-y-6">

    <header class="w-full flex flex-col items-center space-y-1">
      <h1 class="text-2xl font-medium text-neutral-950">회원가입</h1>
      <p class="text-base text-gray-500">동백숲에 가입하고 다양한 서비스를 이용하세요</p>
    </header>

    <hr class="w-full border-t border-gray-200" />

    <section class="w-full flex flex-col space-y-6">

      <div class="w-full space-y-2">
        <label for="id" class="text-sm font-medium text-neutral-950">아이디</label>
        <div class="flex gap-2">
          <input id="id" type="text" placeholder="아이디를 입력하세요" class="flex-1 h-10 px-3 py-2 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm placeholder-gray-500">
          <button class="w-24 h-10 px-4 py-2 bg-white rounded-lg border border-gray-300 hover:bg-gray-50 transition duration-150 flex items-center justify-center">
            <span class="text-neutral-950 text-sm font-medium">중복확인</span>
          </button>
        </div>
      </div>

      <div class="w-full space-y-2">
        <label for="email" class="text-sm font-medium text-neutral-950">학교 이메일</label>
        <div class="flex gap-2">
          <input id="email" type="email" value="example@m365.dongyang.ac.kr" class="flex-1 h-10 px-3 py-2 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm placeholder-gray-500">
          <button class="w-24 h-10 px-4 py-2 bg-white rounded-lg border border-gray-300 hover:bg-gray-50 transition duration-150 flex items-center justify-center">
            <span class="text-neutral-950 text-sm font-medium">인증하기</span>
          </button>
        </div>
        <p class="text-xs text-gray-500 mt-1">반드시 @m365.dongyang.ac.kr 이메일을 사용해야 합니다</p>
      </div>

      <div class="w-full space-y-2">
        <label for="password" class="text-sm font-medium text-neutral-950">비밀번호</label>
        <input id="password" type="password" placeholder="8자 이상" class="w-full h-10 px-3 py-2 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm placeholder-gray-500">
      </div>

      <div class="w-full space-y-2">
        <label for="confirm-password" class="text-sm font-medium text-neutral-950">비밀번호 확인</label>
        <input id="confirm-password" type="password" placeholder="비밀번호 재입력" class="w-full h-10 px-3 py-2 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm placeholder-gray-500">
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div class="w-full space-y-2">
          <label for="major" class="text-sm font-medium text-neutral-950">전공</label>
          <div class="relative">
            <select id="major" class="appearance-none w-full h-10 px-3 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm text-gray-500">
              <option value="" disabled selected>전공을 선택하세요</option>
            </select>
            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-500 opacity-50">
              <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
            </div>
          </div>
        </div>

        <div class="w-full space-y-2">
          <label for="grade" class="text-sm font-medium text-neutral-950">학년</label>
          <div class="relative">
            <select id="grade" class="appearance-none w-full h-10 px-3 bg-zinc-100 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-sky-500 text-sm text-gray-500">
              <option value="" disabled selected>학년을 선택하세요</option>
            </select>
            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-500 opacity-50">
              <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
            </div>
          </div>
        </div>
      </div>

      <button class="w-full h-10 bg-sky-700 hover:bg-sky-800 rounded-lg flex items-center justify-center transition duration-150 mt-4">
        <span class="text-white text-base font-medium">회원가입</span>
      </button>
    </section>

    <footer class="w-full flex items-center justify-center pt-4 border-t border-gray-200">
      <span class="text-sm text-gray-600">이미 계정이 있으신가요?</span>
      <a href="#" class="ml-1 text-sm font-medium text-sky-700 hover:text-sky-800 transition duration-150">로그인</a>
    </footer>
  </div>
</div>
</body>
</html>
