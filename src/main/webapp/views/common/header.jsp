<%--
  File: header.jsp
  Description: Tailwind CSS가 적용된 반응형 헤더 컴포넌트입니다.
  사용법: 다른 JSP 파일에서 <%@ include file="header.jsp" %>로 포함하여 사용합니다.
--%>

<%--
   [핵심 수정]: 주 JSP 파일에서만 page 지시어를 설정하고,
   여기는 충돌을 막기 위해 pageEncoding만 유지합니다.
--%>
<%@ page pageEncoding="UTF-8" %>

<!--
Tailwind CSS 기반의 헤더 구조
- h-20: 고정 높이 80px
- border-b: 하단 경계선 추가
-->
<header class="h-20 w-full border-b border-gray-200 bg-white shadow-sm">
  <div class="container mx-auto h-full px-4">
    <!-- Flexbox: 로고, Nav, 버튼을 수직 중앙 정렬 및 양 끝 배치 (justify-between) -->
    <div class="flex h-full items-center justify-between">

      <!-- 1. 로고 섹션 (왼쪽) -->
      <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-3 cursor-pointer">
        <div class="flex h-10 w-10 items-center justify-center rounded-xl bg-[#0062AD]">
          <p class="text-white font-bold text-sm">로고</p>
        </div>
        <div class="text-xl font-bold text-gray-900">동백숲</div>
      </a>

      <!-- 2. 내비게이션 메뉴 (중앙) -->
      <!-- [수정]: Nav 항목 전체를 감싸는 태그에 Flexbox 및 간격 재설정 -->
      <nav class="hidden md:flex items-center space-x-1 text-gray-700 h-full">

        <!-- 개별 메뉴 항목: a 태그로 복원 및 클래스 수정 -->
        <a href="/" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <path d="m3 9l9-7l9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2Z" />
              <path d="M9 22V12h6v10" />
            </g>
          </svg>
          <div class="font-medium">홈</div>
        </a>

        <a href="/notifications" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.268 21a2 2 0 0 0 3.464 0m-10.47-5.674A1 1 0 0 0 4 17h16a1 1 0 0 0 .74-1.673C19.41 13.956 18 12.499 18 8A6 6 0 0 0 6 8c0 4.499-1.411 5.956-2.738 7.326" /></svg>
          <div class="font-medium">공지</div>
        </a>

        <a href="#" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <rect width="20" height="14" x="2" y="5" rx="2" />
              <path d="M2 10h20" />
            </g>
          </svg>
          <div class="font-medium">구독 관리</div>
        </a>

        <a href="#" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <rect width="20" height="14" x="2" y="5" rx="2" />
              <path d="M2 10h20" />
            </g>
          </svg>
          <div class="font-medium">강의평가</div>
        </a>

        <a href="#" class="flex items-center space-x-2 rounded-lg px-4 py-3 hover:bg-gray-100 hover:text-[#0062AD] transition duration-150 cursor-pointer">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12 12q-1.65 0-2.825-1.175T8 8t1.175-2.825T12 4t2.825 1.175T16 8t-1.175 2.825T12 12m-8 8v-2.8q0-.85.438-1.562T5.6 14.55q1.55-.775 3.15-1.162T12 13t3.25.388t3.15 1.162q.725.375 1.163 1.088T20 17.2V20zm2-2h12v-.8q0-.275-.137-.5t-.363-.35q-1.35-.675-2.725-1.012T12 15t-2.775.338T6.5 16.35q-.225.125-.363.35T6 17.2zm6-8q.825 0 1.413-.587T14 8t-.587-1.412T12 6t-1.412.588T10 8t.588 1.413T12 10m0 8" /></svg>
          <div class="font-medium">마이페이지</div>
        </a>
      </nav>

      <!-- 3. 액션 버튼 그룹 (오른쪽) -->
      <div class="flex space-x-3 items-center">
        <!-- 로그인 버튼 (텍스트/호버 효과) -->
        <a href="#" class="rounded-xl px-4 py-2 font-medium text-gray-700 hover:bg-gray-100 hover:text-gray-900 transition duration-150 cursor-pointer">로그인</a>

        <!-- 회원가입 버튼 (메인 색상) -->
        <a href="#" class="rounded-xl bg-[#0062AD] px-4 py-2 hover:bg-[#1971B2] transition duration-150 cursor-pointer">
          <p class="text-white font-semibold">회원가입</p>
        </a>
      </div>
    </div>