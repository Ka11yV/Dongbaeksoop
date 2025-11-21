<%@ page pageEncoding="UTF-8" %>
<header class="w-full border-b border-black/10 bg-white">
  <div class="mx-auto max-w-[1470px] px-4 sm:px-6 md:px-12 lg:px-24">
    <div class="flex h-16 items-center justify-between">
      <a href = "${pageContext.request.contextPath}/" class="flex shrink-0 items-center gap-2">
        <div class="flex h-8 w-8 items-center justify-center rounded-[10px] bg-sky-700">
          <span class="text-base leading-6 font-normal text-white">🌲</span>
        </div>

        <!-- Navigation (Desktop) -->
        <nav class="hidden md:flex space-x-8">
          <a href="${pageContext.request.contextPath}/"
            class="text-gray-600 hover:text-primary font-medium transition-colors">홈</a>
          <a href="${pageContext.request.contextPath}/notifications"
            class="text-gray-600 hover:text-primary font-medium transition-colors">공지사항</a>
          <a href="${pageContext.request.contextPath}/notice-subscription-management"
            class="text-gray-600 hover:text-primary font-medium transition-colors">구독 관리</a>
          <a href="${pageContext.request.contextPath}/assignments"
            class="text-gray-600 hover:text-primary font-medium transition-colors">과제 알림</a>
          <a href="${pageContext.request.contextPath}/lecture-reviews"
            class="text-gray-600 hover:text-primary font-medium transition-colors">강의 평가</a>
          <a href="${pageContext.request.contextPath}/my-page"
            class="text-gray-600 hover:text-primary font-medium transition-colors">마이페이지</a>
          <a href="${pageContext.request.contextPath}/settings"
            class="text-gray-600 hover:text-primary font-medium transition-colors">설정</a>
        </nav>

        <!-- Right Side Buttons -->
        <div class="hidden md:flex items-center space-x-4">
          <a href="${pageContext.request.contextPath}/login"
            class="text-gray-600 hover:text-primary font-medium transition-colors">로그인</a>
          <a href="${pageContext.request.contextPath}/register"
            class="bg-primary hover:bg-secondary text-white px-5 py-2 rounded-full font-medium transition-all shadow-lg shadow-blue-500/30 hover:shadow-blue-500/40">
            회원가입
          </a>
        </div>

        <!-- Mobile Menu Button -->
        <div class="md:hidden flex items-center">
          <button class="text-gray-600 hover:text-primary focus:outline-none">
            <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  </header>