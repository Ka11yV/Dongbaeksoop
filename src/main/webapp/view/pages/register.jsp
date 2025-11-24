<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 동백숲</title>
    <link href="${pageContext.request.contextPath}/assets/styles/output.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simple-notify/dist/simple-notify.min.css" />
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
          class="w-full max-w-xl bg-white rounded-2xl shadow-xl border border-gray-100 flex flex-col items-center p-6 sm:p-8 space-y-6 my-8">

          <header class="w-full flex flex-col items-center space-y-2">
            <h1 class="text-2xl font-bold text-dark">회원가입</h1>
            <p class="text-base text-gray-500">동백숲에 가입하고 다양한 서비스를 이용하세요</p>
          </header>

          <div class="w-full border-t border-gray-100"></div>

          <form class="w-full flex flex-col space-y-6" action="${pageContext.request.contextPath}/users/register"
            method="POST">

            <div class="w-full space-y-2">
              <label for="userId" class="text-sm font-medium text-dark">아이디</label>
              <div class="flex gap-2">
                <input id="userId" name="userId" type="text" placeholder="아이디를 입력하세요"
                  class="flex-1 h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm placeholder-gray-400">
                <button type="button" id="check-id"
                  class="w-24 h-11 px-4 bg-white rounded-xl border border-gray-200 hover:bg-gray-50 hover:border-gray-300 transition-all flex items-center justify-center">
                  <span id="checkIdBtnText" class="text-dark text-sm font-medium">중복확인</span>
                </button>
              </div>
              <p id="idErrorMessage" class="text-red-500"></p>
            </div>

            <div class="w-full space-y-2">
              <label for="email" class="text-sm font-medium text-dark">학교 이메일</label>
              <div class="flex gap-2">
                <input id="email" name="email" type="email" placeholder="example@m365.dongyang.ac.kr"
                  class="flex-1 h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm placeholder-gray-400">
                <button type="button" id="send-email"
                  class="w-24 h-11 px-4 bg-white rounded-xl border border-gray-200 hover:bg-gray-50 hover:border-gray-300 transition-all flex items-center justify-center">
                  <span class="text-dark text-sm font-medium">인증하기</span>
                </button>
              </div>

              <!-- Email Verification Code Section (Hidden by default) -->
              <div id="verification-container" class="w-full space-y-2 hidden">
                <label class="text-sm font-medium text-dark">인증번호 입력</label>
                <div class="flex gap-1 justify-between">
                  <input type="text" maxlength="1"
                    class="verification-input w-12 h-12 text-center text-xl font-bold bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all">
                  <input type="text" maxlength="1"
                    class="verification-input w-12 h-12 text-center text-xl font-bold bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all">
                  <input type="text" maxlength="1"
                    class="verification-input w-12 h-12 text-center text-xl font-bold bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all">
                  <input type="text" maxlength="1"
                    class="verification-input w-12 h-12 text-center text-xl font-bold bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all">
                  <input type="text" maxlength="1"
                    class="verification-input w-12 h-12 text-center text-xl font-bold bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all">
                  <input type="text" maxlength="1"
                    class="verification-input w-12 h-12 text-center text-xl font-bold bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all">
                </div>
                <p class="text-xs text-gray-500 mt-1 pl-1">이메일로 전송된 6자리 인증번호를 입력해주세요</p>
              </div>
              <p class="text-xs text-gray-500 mt-1 pl-1">반드시 @m365.dongyang.ac.kr 이메일을 사용해야 합니다</p>
            </div>

            <div class="w-full space-y-2">
              <label for="password" class="text-sm font-medium text-dark">비밀번호</label>
              <input id="password" name="password" type="password" placeholder="8자 이상"
                class="w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm placeholder-gray-400">
            </div>

            <div class="w-full space-y-2">
              <label for="confirm-password" class="text-sm font-medium text-dark">비밀번호 확인</label>
              <input id="confirm-password" name="confirm-password" type="password" placeholder="비밀번호 재입력"
                class="w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm placeholder-gray-400">
            </div>

            <div class="grid grid-cols-2 gap-4">
              <div class="w-full space-y-2">
                <label for="dept_id" class="text-sm font-medium text-dark">학과</label>
                <div class="relative">
                  <select id="dept_id" name="dept_id"
                    class="appearance-none w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm text-gray-600">
                    <option value="" selected disabled>학과를 선택하세요</option>
                    <option value="1">기계공학과</option>
                    <option value="2">기계설계공학과</option>
                    <option value="3">자동화공학과</option>
                    <option value="4">로봇소프트웨어과</option>
                    <option value="5">전기공학과</option>
                    <option value="6">반도체전자공학과</option>
                    <option value="7">정보통신공학과</option>
                    <option value="8">소방안전관리과</option>
                    <option value="9">웹응용소프트웨어공학과</option>
                    <option value="10">컴퓨터소프트웨어공학과</option>
                    <option value="11">인공지능소프트웨어과</option>
                    <option value="12">생명화학공학과</option>
                    <option value="13">바이오융합공학과</option>
                    <option value="14">건축과</option>
                    <option value="15">실내건축디자인과</option>
                    <option value="16">시각디자인과</option>
                    <option value="17">AR·VR콘텐츠디자인과</option>
                    <option value="18">경영학과</option>
                    <option value="19">세무회계학과</option>
                    <option value="20">유통마케팅학과</option>
                    <option value="21">호텔관광학과</option>
                    <option value="22">경영정보학과</option>
                    <option value="23">빅데이터경영과</option>
                  </select>
                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-gray-500">
                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                      <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                    </svg>
                  </div>
                </div>
              </div>

              <div class="w-full space-y-2">
                <label for="grade" class="text-sm font-medium text-dark">학년</label>
                <div class="relative">
                  <select id="grade" name="grade"
                    class="appearance-none w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm text-gray-600">
                    <option value="" disabled selected>학년을 선택하세요</option>
                    <option value="1">1학년</option>
                    <option value="2">2학년</option>
                    <option value="3">3학년</option>
                    <option value="4">4학년</option>
                  </select>
                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-gray-500">
                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                      <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                    </svg>
                  </div>
                </div>
              </div>
            </div>

            <button id="submit" type="submit"
              class="cursor-pointer w-full h-12 bg-primary hover:bg-secondary rounded-xl flex items-center justify-center transition-all shadow-lg shadow-blue-500/30 hover:shadow-blue-500/40 transform hover:-translate-y-0.5 mt-4">
              <span class="text-white text-base font-bold">회원가입</span>
            </button>
          </form>

          <footer class="w-full flex items-center justify-center pt-4 border-t border-gray-100">
            <span class="text-sm text-gray-500">이미 계정이 있으신가요?</span>
            <a href="${pageContext.request.contextPath}/login"
              class="ml-2 text-sm font-bold text-primary hover:text-secondary transition-colors">로그인</a>
          </footer>
        </div>
      </main>
      <%@ include file="/view/common/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/simple-notify/dist/simple-notify.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/scripts/register.js"></script>
        <script>
          const contextPath = "${pageContext.request.contextPath}";
        </script>
  </body>


  </html>