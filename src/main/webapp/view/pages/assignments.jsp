<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>과제 관리 - 동백숲</title>
    <link href="${pageContext.request.contextPath}/styles/output.css" rel="stylesheet">
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
        <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
          <!-- Header Section -->
          <div class="mb-10">
            <h1 class="text-3xl md:text-4xl font-bold text-dark mb-3">과제 관리</h1>
            <p class="text-lg text-gray-600">학교 포털과 연동하여 과제 마감일을 확인하고 알림을 받아보세요.</p>
          </div>

          <!-- Warning Alert -->
          <div
            class="mb-10 flex items-start gap-4 p-4 rounded-xl bg-orange-50 border border-orange-100 text-orange-800">
            <svg class="w-6 h-6 shrink-0 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.398 16c-.77 1.333.192 3 1.732 3z" />
            </svg>
            <p class="text-sm md:text-base font-medium">과제 관리 기능을 사용하려면 먼저 학교 포털 계정을 연동해야 합니다.</p>
          </div>

          <!-- Connect Action Card -->
          <div
            class="mb-10 flex flex-col items-center justify-center rounded-2xl bg-white border border-gray-100 p-10 shadow-lg text-center">
            <div class="mb-6 flex h-20 w-20 items-center justify-center rounded-full bg-blue-50">
              <svg class="h-10 w-10 text-primary" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>

            <div class="mb-8 max-w-md">
              <h2 class="mb-3 text-2xl font-bold text-dark">학교 포털 연동이 필요합니다</h2>
              <p class="text-gray-600 leading-relaxed">
                마이페이지에서 학교 포털 계정을 연동하면<br>
                수강 과목의 과제를 자동으로 불러올 수 있습니다.
              </p>
            </div>

            <a href="${pageContext.request.contextPath}/my-page"
              class="inline-flex items-center justify-center px-8 py-3 rounded-full bg-primary text-white font-bold shadow-lg shadow-blue-500/30 hover:bg-secondary hover:shadow-blue-500/40 transition-all transform hover:-translate-y-1">
              <svg class="mr-2 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round"
                  d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.836a4 4 0 00-.035-5.655 4 4 0 00-5.656-5.656l-4 4a4 4 0 105.656 5.656l1.102 1.101zM12 12h.01" />
              </svg>
              마이페이지에서 연동하기
            </a>
          </div>

          <!-- Features List -->
          <div class="rounded-2xl bg-white border border-gray-100 p-8 shadow-sm">
            <h2 class="mb-6 text-xl font-bold text-dark">연동 후 사용 가능한 기능</h2>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div class="flex items-start gap-4 p-4 rounded-xl hover:bg-gray-50 transition-colors">
                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-blue-100 text-primary">
                  <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                  </svg>
                </div>
                <div>
                  <h3 class="text-lg font-bold text-dark mb-1">과제 자동 조회</h3>
                  <p class="text-sm text-gray-600 leading-relaxed">수강 중인 과목의 모든 과제를 자동으로 불러옵니다.</p>
                </div>
              </div>

              <div class="flex items-start gap-4 p-4 rounded-xl hover:bg-gray-50 transition-colors">
                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-blue-100 text-primary">
                  <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <div>
                  <h3 class="text-lg font-bold text-dark mb-1">마감일 알림</h3>
                  <p class="text-sm text-gray-600 leading-relaxed">과제 마감 며칠 전에 이메일로 알림을 받을 수 있습니다.</p>
                </div>
              </div>

              <div class="flex items-start gap-4 p-4 rounded-xl hover:bg-gray-50 transition-colors">
                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-blue-100 text-primary">
                  <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                  </svg>
                </div>
                <div>
                  <h3 class="text-lg font-bold text-dark mb-1">과제 상태 관리</h3>
                  <p class="text-sm text-gray-600 leading-relaxed">완료한 과제를 체크하고 진행 상황을 체계적으로 관리하세요.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>

      <%@ include file="/view/common/footer.jsp" %>
  </body>

  </html>