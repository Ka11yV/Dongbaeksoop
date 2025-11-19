<%@ page pageEncoding="UTF-8" %>
<header class="w-full border-b border-black/10 bg-white">
  <div class="mx-auto max-w-[1470px] px-4 sm:px-6 md:px-12 lg:px-24">
    <div class="flex h-16 items-center justify-between">
      <div class="flex shrink-0 items-center gap-2">
        <div class="flex h-8 w-8 items-center justify-center rounded-[10px] bg-sky-700">
          <span class="text-base leading-6 font-normal text-white">🌲</span>
        </div>
        <h1 class="text-xl leading-7 font-normal tracking-tight text-sky-700">동백숲</h1>
      </div>

      <nav class="mx-auto hidden max-w-[760px] flex-1 items-center justify-center gap-2 lg:flex xl:gap-6">

        <!-- 홈 -->
        <a href="${pageContext.request.contextPath}/" class="flex h-10 items-center gap-1.5 rounded-lg px-3 py-2 text-base font-normal whitespace-nowrap text-gray-700 transition hover:bg-blue-50 hover:text-sky-700">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <path d="m3 9l9-7l9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2Z" />
              <path d="M9 22V12h6v10" />
            </g>
          </svg>
          <div class="font-medium">홈</div>
        </a>

        <!-- 공지 -->
        <a href="${pageContext.request.contextPath}/notifications" class="flex h-10 items-center gap-1.5 rounded-lg px-3 py-2 text-base font-normal whitespace-nowrap text-gray-700 transition hover:bg-blue-50 hover:text-sky-700">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.268 21a2 2 0 0 0 3.464 0m-10.47-5.674A1 1 0 0 0 4 17h16a1 1 0 0 0 .74-1.673C19.41 13.956 18 12.499 18 8A6 6 0 0 0 6 8c0 4.499-1.411 5.956-2.738 7.326" /></svg>
          <div class="font-medium">공지</div>
        </a>

        <!-- 구독 관리 -->
        <a href="${pageContext.request.contextPath}/notice-subscription-management" class="flex h-10 items-center gap-1.5 rounded-lg px-3 py-2 text-base font-normal whitespace-nowrap text-gray-700 transition hover:bg-blue-50 hover:text-sky-700">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <rect width="20" height="14" x="2" y="5" rx="2" />
              <path d="M2 10h20" />
            </g>
          </svg>
          <div class="font-medium">구독 관리</div>
        </a>

        <!-- 과제 -->
        <a href="${pageContext.request.contextPath}/assignments" class="flex h-10 items-center gap-1.5 rounded-lg px-3 py-2 text-base font-normal whitespace-nowrap text-gray-700 transition hover:bg-blue-50 hover:text-sky-700">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <path fill="currentColor" d="M5 21q-.825 0-1.412-.587T3 19V5q0-.825.588-1.412T5 3h4.2q.325-.9 1.088-1.45T12 1t1.713.55T14.8 3H19q.825 0 1.413.588T21 5v14q0 .825-.587 1.413T19 21zm0-2h14V5H5zm3-2h5q.425 0 .713-.288T14 16t-.288-.712T13 15H8q-.425 0-.712.288T7 16t.288.713T8 17m0-4h8q.425 0 .713-.288T17 12t-.288-.712T16 11H8q-.425 0-.712.288T7 12t.288.713T8 13m0-4h8q.425 0 .713-.288T17 8t-.288-.712T16 7H8q-.425 0-.712.288T7 8t.288.713T8 9m4-4.75q.325 0 .538-.213t.212-.537t-.213-.537T12 2.75t-.537.213t-.213.537t.213.538t.537.212M5 19V5z" />
          </svg>
          <div class="font-medium">과제</div>
        </a>

        <!-- 강의평가 -->
        <a href="${pageContext.request.contextPath}/lecture-reviews" class="flex h-10 items-center gap-1.5 rounded-lg px-3 py-2 text-base font-normal whitespace-nowrap text-gray-700 transition hover:bg-blue-50 hover:text-sky-700">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="m13 16.006l7-.047V5.992l-5.17.007l-1.814 1.814zm-2-8.193L9.179 6.038L4 6.003v9.956l7 .047zm-1-3.77L12 6l2-2l5.997-.008A2 2 0 0 1 22 5.989v9.97a2 2 0 0 1-1.986 2L14 18l-1.996 2L10 18l-6.014-.041a2 2 0 0 1-1.986-2V6.003a2 2 0 0 1 2-2z"/></svg>
          <div class="font-medium">강의평가</div>
        </a>

        <!-- 마이페이지 -->
        <a href="${pageContext.request.contextPath}/my-page" class="flex h-10 items-center gap-1.5 rounded-lg px-3 py-2 text-base font-normal whitespace-nowrap text-gray-700 transition hover:bg-blue-50 hover:text-sky-700">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12 12q-1.65 0-2.825-1.175T8 8t1.175-2.825T12 4t2.825 1.175T16 8t-1.175 2.825T12 12m-8 8v-2.8q0-.85.438-1.562T5.6 14.55q1.55-.775 3.15-1.162T12 13t3.25.388t3.15 1.162q.725.375 1.163 1.088T20 17.2V20zm2-2h12v-.8q0-.275-.137-.5t-.363-.35q-1.35-.675-2.725-1.012T12 15t-2.775.338T6.5 16.35q-.225.125-.363.35T6 17.2zm6-8q.825 0 1.413-.587T14 8t-.587-1.412T12 6t-1.412.588T10 8t.588 1.413T12 10m0 8" /></svg>
          <div class="font-medium">마이페이지</div>
        </a>

        <!-- 설정 -->
        <a href="${pageContext.request.contextPath}/settings" class="flex h-10 items-center gap-1.5 rounded-lg px-3 py-2 text-base font-normal whitespace-nowrap text-gray-700 transition hover:bg-blue-50 hover:text-sky-700">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <path fill="currentColor" d="M19.43 12.98c.04-.32.07-.64.07-.98s-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46a.5.5 0 0 0-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.49.49 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1a.6.6 0 0 0-.18-.03c-.17 0-.34.09-.43.25l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98s.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46a.5.5 0 0 0 .61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1q.09.03.18.03c.17 0 .34-.09.43-.25l2-3.46c.12-.22.07-.49-.12-.64zm-1.98-1.71c.04.31.05.52.05.73s-.02.43-.05.73l-.14 1.13l.89.7l1.08.84l-.7 1.21l-1.27-.51l-1.04-.42l-.9.68c-.43.32-.84.56-1.25.73l-1.06.43l-.16 1.13l-.2 1.35h-1.4l-.19-1.35l-.16-1.13l-1.06-.43c-.43-.18-.83-.41-1.23-.71l-.91-.7l-1.06.43l-1.27.51l-.7-1.21l1.08-.84l.89-.7l-.14-1.13c-.03-.31-.05-.54-.05-.74s.02-.43.05-.73l.14-1.13l-.89-.7l-1.08-.84l.7-1.21l1.27.51l1.04.42l.9-.68c.43-.32.84-.56 1.25-.73l1.06-.43l.16-1.13l.2-1.35h1.39l.19 1.35l.16 1.13l1.06.43c.43.18.83.41 1.23.71l.91.7l1.06-.43l1.27-.51l.7 1.21l-1.07.85l-.89.7zM12 8c-2.21 0-4 1.79-4 4s1.79 4 4 4s4-1.79 4-4s-1.79-4-4-4m0 6c-1.1 0-2-.9-2-2s.9-2 2-2s2 .9 2 2s-.9 2-2 2" />
          </svg>
          <div class="font-medium">설정</div>
        </a>
      </nav>

      <div class="ml-auto flex shrink-0 items-center gap-3 lg:ml-0">
        <!-- 로그인 -->
        <a href="${pageContext.request.contextPath}/login" class="flex h-9 items-center justify-center rounded-lg px-4 py-2 text-sm font-medium whitespace-nowrap text-neutral-950 transition hover:bg-blue-50 hover:text-sky-700"> 로그인 </a>
        <!-- 회원가입 -->
        <a href="${pageContext.request.contextPath}/register" class="flex h-9 items-center justify-center rounded-lg bg-sky-700 px-4 py-2 text-sm font-medium whitespace-nowrap text-white transition hover:bg-sky-800"> 회원가입 </a>
      </div>

    </div>
  </div>
</header>