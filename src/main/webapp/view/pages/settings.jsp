<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>설정 - 동백숲</title>
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

      <main class="pt-24 pb-12 min-h-screen">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <!-- Header Section -->
          <div class="mb-8">
            <div class="flex items-center gap-3 mb-3">
              <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-50 text-primary">
                <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
              </div>
              <h1 class="text-3xl md:text-4xl font-bold text-dark">설정</h1>
            </div>
            <p class="text-lg text-gray-600">알림 설정을 관리하세요.</p>
          </div>

          <!-- Notification Settings -->
          <div class="mb-8 p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
            <div class="flex items-start gap-4 mb-6 pb-6 border-b border-gray-100">
              <div class="h-12 w-12 rounded-2xl bg-blue-50 flex items-center justify-center text-primary">
                <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.477 6.326 6 8.309 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                </svg>
              </div>
              <div>
                <h2 class="text-xl font-bold text-dark">공지 알림 설정</h2>
                <p class="text-gray-500">구독한 공지사항에 대한 이메일 알림을 관리합니다.</p>
              </div>
            </div>

            <div class="space-y-6">
              <div class="flex items-center justify-between">
                <div>
                  <h3 class="font-bold text-dark">이메일 알림 받기</h3>
                  <p class="text-sm text-gray-500">구독한 카테고리의 새 공지사항을 이메일로 받습니다.</p>
                </div>
                <div
                  class="relative inline-flex h-6 w-11 items-center rounded-full bg-primary cursor-pointer transition-colors">
                  <span
                    class="translate-x-6 inline-block h-4 w-4 transform rounded-full bg-white transition-transform"></span>
                </div>
              </div>

              <div class="p-4 rounded-xl bg-blue-50 border border-blue-100">
                <div class="flex items-start gap-3">
                  <svg class="w-5 h-5 text-primary mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <div>
                    <p class="text-sm font-bold text-blue-900 mb-1">알림이 발송되는 경우:</p>
                    <ul class="list-disc pl-4 text-sm text-blue-800 space-y-1">
                      <li>구독 관리에서 설정한 카테고리의 새 공지가 등록될 때</li>
                      <li>설정한 키워드가 포함된 공지가 등록될 때</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Assignment Settings -->
          <div class="mb-8 p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
            <div class="flex items-start gap-4 mb-6 pb-6 border-b border-gray-100">
              <div class="h-12 w-12 rounded-2xl bg-orange-50 flex items-center justify-center text-orange-500">
                <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
              <div>
                <h2 class="text-xl font-bold text-dark">과제 알림 설정</h2>
                <p class="text-gray-500">과제 마감 기한 알림을 관리합니다.</p>
              </div>
            </div>

            <div class="space-y-6">
              <div class="flex items-center justify-between">
                <div>
                  <h3 class="font-bold text-dark">과제 마감 알림 받기</h3>
                  <p class="text-sm text-gray-500">과제 마감일이 다가오면 이메일로 알림을 받습니다.</p>
                </div>
                <div
                  class="relative inline-flex h-6 w-11 items-center rounded-full bg-primary cursor-pointer transition-colors">
                  <span
                    class="translate-x-6 inline-block h-4 w-4 transform rounded-full bg-white transition-transform"></span>
                </div>
              </div>

              <div class="space-y-2">
                <h3 class="text-sm font-bold text-dark">알림 시점</h3>
                <div class="relative">
                  <select
                    class="w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all appearance-none">
                    <option>마감 3일 전</option>
                    <option>마감 1일 전</option>
                    <option>마감 12시간 전</option>
                  </select>
                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                    </svg>
                  </div>
                </div>
                <p class="text-xs text-gray-500">과제 마감일 기준으로 선택한 일수 전에 이메일 알림이 발송됩니다.</p>
              </div>

              <div class="p-4 rounded-xl bg-orange-50 border border-orange-100">
                <div class="flex items-start gap-3">
                  <svg class="w-5 h-5 text-orange-500 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <div>
                    <p class="text-sm font-bold text-orange-900 mb-1">알림이 발송되는 경우:</p>
                    <ul class="list-disc pl-4 text-sm text-orange-800 space-y-1">
                      <li>학교 포털에서 크롤링한 과제의 마감일이 다가올 때</li>
                      <li>매일 오전 9시에 해당하는 과제가 있는지 확인합니다</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Email Info -->
          <div class="mb-8 p-6 rounded-2xl bg-white border border-gray-100 shadow-sm flex items-start gap-4">
            <div class="mt-1 text-gray-400">
              <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M3 8l7.84 5.23L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
            </div>
            <div>
              <h3 class="font-bold text-dark">알림 수신 이메일</h3>
              <p class="text-gray-600">모든 알림은 회원가입 시 등록한 학교 이메일(<span
                  class="text-primary font-bold">@m365.dongyang.ac.kr</span>)로 발송됩니다.</p>
            </div>
          </div>

          <!-- Save Button -->
          <div class="flex justify-end">
            <button
              class="px-8 py-3 bg-primary hover:bg-secondary text-white font-bold rounded-xl shadow-lg shadow-blue-500/30 transition-all flex items-center gap-2">
              <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
              </svg>
              설정 저장
            </button>
          </div>
        </div>
      </main>

      <%@ include file="/view/common/footer.jsp" %>
        <script>
      document.addEventListener('DOMContentLoaded', () => {
        const toggles = document.querySelectorAll('.relative.inline-flex.cursor-pointer');
        toggles.forEach(toggle => {
          toggle.addEventListener('click', () => {
            const knob = toggle.querySelector('span');
            if (toggle.classList.contains('bg-primary')) {
              toggle.classList.replace('bg-primary', 'bg-gray-200');
              knob.classList.replace('translate-x-6', 'translate-x-1');
            } else {
              toggle.classList.replace('bg-gray-200', 'bg-primary');
              knob.classList.replace('translate-x-1', 'translate-x-6');
            }
          });
        });
      });
        </script>
  </body>

  </html>