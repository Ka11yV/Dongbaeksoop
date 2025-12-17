<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>과제 관리 - 동백숲</title>
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
        <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
          <!-- Header Section -->
          <div class="mb-10">
            <h1 class="text-3xl md:text-4xl font-bold text-dark mb-3">과제 관리</h1>
            <p class="text-lg text-gray-600">학교 포털과 연동하여 과제 마감일을 확인하고 알림을 받아보세요.</p>
          </div>

          <!-- Not Linked State (Hidden by default for demo, toggleable) -->
          <div id="not-linked-state" class="hidden">
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
          </div>

          <!-- Linked State (Visible by default) -->
          <div id="linked-state">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <c:choose>
                <c:when test="${not empty assignments}">
                  <c:forEach var="assignment" items="${assignments}">
                    <div
                      class="p-6 rounded-2xl bg-white border border-gray-100 shadow-sm hover:shadow-md transition-all group ${assignment.submissionStatus == '제출완료' ? 'opacity-60' : ''}">
                      <div class="flex justify-between items-start mb-4">
                        <div>
                          <span
                            class="inline-block px-2.5 py-1 rounded-lg bg-blue-50 text-primary text-xs font-bold mb-2">${assignment.courseName}</span>
                          <h3
                            class="text-lg font-bold text-dark group-hover:text-primary transition-colors ${assignment.submissionStatus == '제출완료' ? 'line-through text-gray-700' : ''}">
                            ${assignment.title}</h3>
                        </div>
                        <span
                          class="px-3 py-1 rounded-lg ${assignment.submissionStatus == '제출완료' ? 'bg-green-100 text-green-600' : 'bg-gray-100 text-gray-600'} text-sm font-bold">${assignment.timeLeft}</span>
                      </div>
                      <div
                        class="flex items-center justify-between text-sm ${assignment.submissionStatus == '제출완료' ? 'text-gray-400' : 'text-gray-500'} pt-4 border-t border-gray-50">
                        <span>마감일: ${assignment.dueDate}</span>
                        <span
                          class="${assignment.submissionStatus == '제출완료' ? 'text-green-600' : 'text-orange-500'} font-medium">${assignment.submissionStatus}</span>
                      </div>
                    </div>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <div
                    class="col-span-1 md:col-span-2 p-10 text-center text-gray-500 bg-white rounded-2xl border border-gray-100">
                    등록된 과제가 없습니다.
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </main>

      <%@ include file="/view/common/footer.jsp" %>
        <script>
          // Countdown Timer Logic
          function updateCountdown() {
            const now = new Date();
            const tomorrow = new Date(now);
            tomorrow.setDate(tomorrow.getDate() + 1);
            tomorrow.setHours(0, 0, 0, 0); // Midnight tonight

            // For demo purposes, let's set a fixed deadline relative to now
            // In a real app, this would come from the server
            const deadline = new Date(now.getTime() + (23 * 60 * 60 * 1000) + (59 * 60 * 1000) + (42 * 1000));

            const diff = deadline - now;

            if (diff <= 0) {
              document.getElementById('countdown').innerText = "00:00:00";
              return;
            }

            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);

            document.getElementById('countdown').innerText =
              `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
          }

          setInterval(updateCountdown, 1000);
          updateCountdown(); // Initial call
        </script>
  </body>

  </html>