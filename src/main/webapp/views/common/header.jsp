<%@ page pageEncoding="UTF-8" %>
<header class="h-20 w-full border-b border-gray-200 bg-white shadow-sm">
  <div class="container mx-auto h-full px-4">
    <div class="flex h-full items-center justify-between">
      <!-- 로고 -->
      <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-3 cursor-pointer">
        <div class="flex h-10 w-10 items-center justify-center rounded-xl bg-[#0062AD]">
          <p class="text-white font-bold text-sm">로고</p>
        </div>
        <div class="text-xl font-bold text-gray-900">동백숲</div>
      </a>

      <nav class="flex items-center space-x-1 text-gray-700 h-full">
        <!-- 홈 -->
        <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <path d="m3 9l9-7l9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2Z" />
              <path d="M9 22V12h6v10" />
            </g>
          </svg>
          <div class="font-medium">홈</div>
        </a>

        <!-- 공지 -->
        <a href="${pageContext.request.contextPath}/notifications" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.268 21a2 2 0 0 0 3.464 0m-10.47-5.674A1 1 0 0 0 4 17h16a1 1 0 0 0 .74-1.673C19.41 13.956 18 12.499 18 8A6 6 0 0 0 6 8c0 4.499-1.411 5.956-2.738 7.326" /></svg>
          <div class="font-medium">공지</div>
        </a>

        <!-- 구독 관리 -->
        <a href="${pageContext.request.contextPath}/notice-subscription-management" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <rect width="20" height="14" x="2" y="5" rx="2" />
              <path d="M2 10h20" />
            </g>
          </svg>
          <div class="font-medium">구독 관리</div>
        </a>

        <!-- 강의평가 -->
        <a href="${pageContext.request.contextPath}/lecture-review" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <rect width="20" height="14" x="2" y="5" rx="2" />
              <path d="M2 10h20" />
            </g>
          </svg>
          <div class="font-medium">강의평가</div>
        </a>

        <!-- 마이페이지 -->
        <a href="${pageContext.request.contextPath}/my-page" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12 12q-1.65 0-2.825-1.175T8 8t1.175-2.825T12 4t2.825 1.175T16 8t-1.175 2.825T12 12m-8 8v-2.8q0-.85.438-1.562T5.6 14.55q1.55-.775 3.15-1.162T12 13t3.25.388t3.15 1.162q.725.375 1.163 1.088T20 17.2V20zm2-2h12v-.8q0-.275-.137-.5t-.363-.35q-1.35-.675-2.725-1.012T12 15t-2.775.338T6.5 16.35q-.225.125-.363.35T6 17.2zm6-8q.825 0 1.413-.587T14 8t-.587-1.412T12 6t-1.412.588T10 8t.588 1.413T12 10m0 8" /></svg>
          <div class="font-medium">마이페이지</div>
        </a>
      </nav>

      <div class="flex space-x-3 items-center">
        <!-- 로그인 -->
        <a href="${pageContext.request.contextPath}/login" class="rounded-xl px-4 py-2 font-medium text-gray-700 hover:bg-gray-100 hover:text-gray-900 transition duration-150 cursor-pointer">로그인</a>
        <!-- 회원가입 -->
        <a href="${pageContext.request.contextPath}/register" class="rounded-xl bg-[#0062AD] px-4 py-2 hover:bg-[#1971B2] transition duration-150 cursor-pointer text-white">회원가입</a>
      </div>
    </div>
  </div>
</header>