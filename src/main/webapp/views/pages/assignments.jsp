<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
  <title>동백숲</title>
</head>
<body>
  <%@ include file="/views/common/header.jsp"%>
  <div class="bg-gray-50 py-8">
    <div class="mx-auto max-w-[1024px] p-4">
      <div class="mt-4 mb-6 flex w-full flex-col gap-2">
        <h1 class="text-4xl font-medium tracking-tight text-neutral-950">과제 관리</h1>
        <p class="text-base font-normal text-gray-600">학교 포털과 연동하여 과제 마감일을 확인하고 알림을 받아보세요</p>
      </div>

      <div class="mb-8 flex h-11 w-full items-center gap-2 rounded-[10px] border border-orange-200 bg-orange-50 px-4 py-2">
        <svg class="h-4 w-4 shrink-0 text-neutral-950" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.398 16c-.77 1.333.192 3 1.732 3z" />
        </svg>
        <p class="flex-1 text-sm leading-5 font-normal text-orange-800">과제 관리 기능을 사용하려면 먼저 학교 포털 계정을 연동해야 합니다.</p>
      </div>

      <div class="mb-8 flex w-full flex-col items-center justify-center rounded-2xl border border-black/10 bg-white p-6 text-center shadow-sm">
        <div class="mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-sky-700/10">
          <svg class="h-8 w-8 text-sky-700" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        </div>

        <div classmb-6>
          <h2 class="mb-1 text-xl leading-7 font-normal text-neutral-950">학교 포털 연동이 필요합니다</h2>
          <p class="text-base leading-6 font-normal text-gray-600">마이페이지에서 학교 포털 계정을 연동하면</p>
          <p class="text-base leading-6 font-normal text-gray-600">수강 과목의 과제를 자동으로 불러올 수 있습니다.</p>
        </div>

        <a href="#" class="mt-6 flex h-10 w-52 items-center justify-center rounded-lg bg-sky-700 text-sm leading-5 font-medium text-white shadow transition hover:bg-sky-800">
          <svg class="mr-2 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.836a4 4 0 00-.035-5.655 4 4 0 00-5.656-5.656l-4 4a4 4 0 105.656 5.656l1.102 1.101zM12 12h.01" />
          </svg>
          마이페이지에서 연동하기
        </a>
      </div>

      <div class="w-full rounded-2xl border border-black/10 bg-white p-6 shadow-sm">
        <h2 class="mb-6 text-base leading-6 font-normal text-neutral-950">연동 후 사용 가능한 기능</h2>

        <div class="flex flex-col gap-4">
          <div class="flex items-start gap-3">
            <div class="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-blue-100">
              <span class="text-sm leading-5 font-normal text-sky-700">✓</span>
            </div>
            <div class="flex flex-col gap-1">
              <p class="text-sm leading-5 font-bold text-neutral-950">과제 자동 조회</p>
              <p class="text-sm leading-5 font-normal text-gray-600">수강 중인 과목의 모든 과제를 자동으로 불러옵니다</p>
            </div>
          </div>

          <div class="flex items-start gap-3">
            <div class="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-blue-100">
              <span class="text-sm leading-5 font-normal text-sky-700">✓</span>
            </div>
            <div class="flex flex-col gap-1">
              <p class="text-sm leading-5 font-bold text-neutral-950">마감일 알림</p>
              <p class="text-sm leading-5 font-normal text-gray-600">과제 마감 며칠 전에 이메일로 알림을 받을 수 있습니다</p>
            </div>
          </div>

          <div class="flex items-start gap-3">
            <div class="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-blue-100">
              <span class="text-sm leading-5 font-normal text-sky-700">✓</span>
            </div>
            <div class="flex flex-col gap-1">
              <p class="text-sm leading-5 font-bold text-neutral-950">과제 상태 관리</p>
              <p class="text-sm leading-5 font-normal text-gray-600">완료한 과제를 체크하고 진행 상황을 관리할 수 있습니다</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="/views/common/footer.jsp"%>
</body>
</html>
