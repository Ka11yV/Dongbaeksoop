<%@ page pageEncoding="UTF-8" %>
  <header class="fixed w-full top-0 z-50 glass-header transition-all duration-300">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
        <!-- Logo -->
        <div class="flex-shrink-0 flex items-center cursor-pointer">
          <a href="${pageContext.request.contextPath}/" class="text-2xl font-bold text-primary tracking-tighter">동백숲</a>
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
          <a href="${pageContext.request.contextPath}/users/register"
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