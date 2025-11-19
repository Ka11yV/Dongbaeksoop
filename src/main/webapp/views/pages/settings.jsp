<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
  <title>동백숲</title>
</head>
<body>
  <%@ include file="/views/common/header.jsp"%>
  <div class="bg-gray-50 py-8">
    <div class="container mx-auto flex max-w-4xl flex-col gap-8 px-4">
      <div class="flex w-full flex-col gap-2">
        <div class="flex items-center gap-3">
          <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-[10px] bg-sky-700/10">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
              <path fill="#0062AD" d="M10.825 22q-.675 0-1.162-.45t-.588-1.1L8.85 18.8q-.325-.125-.612-.3t-.563-.375l-1.55.65q-.625.275-1.25.05t-.975-.8l-1.175-2.05q-.35-.575-.2-1.225t.675-1.075l1.325-1Q4.5 12.5 4.5 12.337v-.675q0-.162.025-.337l-1.325-1Q2.675 9.9 2.525 9.25t.2-1.225L3.9 5.975q.35-.575.975-.8t1.25.05l1.55.65q.275-.2.575-.375t.6-.3l.225-1.65q.1-.65.588-1.1T10.825 2h2.35q.675 0 1.163.45t.587 1.1l.225 1.65q.325.125.613.3t.562.375l1.55-.65q.625-.275 1.25-.05t.975.8l1.175 2.05q.35.575.2 1.225t-.675 1.075l-1.325 1q.025.175.025.338v.674q0 .163-.05.338l1.325 1q.525.425.675 1.075t-.2 1.225l-1.2 2.05q-.35.575-.975.8t-1.25-.05l-1.5-.65q-.275.2-.575.375t-.6.3l-.225 1.65q-.1.65-.587 1.1t-1.163.45zM11 20h1.975l.35-2.65q.775-.2 1.438-.587t1.212-.938l2.475 1.025l.975-1.7l-2.15-1.625q.125-.35.175-.737T17.5 12t-.05-.787t-.175-.738l2.15-1.625l-.975-1.7l-2.475 1.05q-.55-.575-1.212-.962t-1.438-.588L13 4h-1.975l-.35 2.65q-.775.2-1.437.588t-1.213.937L5.55 7.15l-.975 1.7l2.15 1.6q-.125.375-.175.75t-.05.8q0 .4.05.775t.175.75l-2.15 1.625l.975 1.7l2.475-1.05q.55.575 1.213.963t1.437.587zm1.05-4.5q1.45 0 2.475-1.025T15.55 12t-1.025-2.475T12.05 8.5q-1.475 0-2.487 1.025T8.55 12t1.013 2.475T12.05 15.5M12 12" />
            </svg>
          </div>
          <h1 class="text-4xl font-normal tracking-tight text-neutral-950">설정</h1>
        </div>
        <p class="text-base font-normal text-gray-600">알림 설정을 관리하세요</p>
      </div>

      <div class="w-full rounded-2xl border border-black/10 bg-white p-6 shadow-sm">
        <div class="mb-4 flex items-start gap-3 border-b border-gray-100 pb-4">
          <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-[10px] bg-blue-100">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
              <g fill="none" stroke="#0062AD" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                <g transform="rotate(0 12 3)">
                  <path d="M12 3v2" />
                  <path d="M12 5c-3.31 0 -6 2.69 -6 6l0 6c-1 0 -2 1 -2 2h8M12 5c3.31 0 6 2.69 6 6l0 6c1 0 2 1 2 2h-8" />
                </g>
                <path d="M10 20c0 1.1 0.9 2 2 2c1.1 0 2 -0.9 2 -2" transform="rotate(0 12 8)" />
              </g>
            </svg>
          </div>
          <div class="flex flex-1 flex-col">
            <h2 class="text-xl leading-7 font-normal text-neutral-950">공지 알림 설정</h2>
            <p class="text-sm leading-5 font-normal text-gray-600">구독한 공지사항에 대한 이메일 알림을 관리합니다</p>
          </div>
        </div>

        <div class="flex flex-col gap-6">
          <div class="flex items-center justify-between">
            <div class="flex flex-col gap-1 pr-4">
              <h3 class="text-base leading-6 font-medium text-neutral-950">이메일 알림 받기</h3>
              <p class="text-sm leading-5 font-normal text-gray-600">구독한 카테고리의 새 공지사항을 이메일로 받습니다</p>
            </div>
            <div class="flex h-6 w-10 shrink-0 cursor-pointer items-center justify-start rounded-full bg-sky-700 pl-4 shadow-inner">
              <div class="h-4 w-4 rounded-full bg-white shadow"></div>
            </div>
          </div>

          <div class="w-full rounded-[10px] border border-blue-200 bg-blue-50 px-4 pt-4 pb-4">
            <div class="flex items-start gap-2">
              <div class="mt-0.5 h-4 w-4 shrink-0 overflow-hidden">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="20" viewBox="0 0 30 30">
                  <g fill="none" stroke="#0062AD" stroke-width="2">
                    <rect width="16" height="12" x="4" y="6" rx="2" />
                    <path d="m4 9l7.106 3.553a2 2 0 0 0 1.788 0L20 9" />
                  </g>
                </svg>
              </div>
              <div class="flex flex-1 flex-col gap-1">
                <p class="text-sm leading-5 font-bold text-gray-700">알림이 발송되는 경우:</p>
                <ul class="list-disc space-y-0.5 pl-5 text-sm leading-5 font-normal text-gray-700">
                  <li>구독 관리에서 설정한 카테고리의 새 공지가 등록될 때</li>
                  <li>설정한 키워드가 포함된 공지가 등록될 때</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="w-full rounded-2xl border border-black/10 bg-white p-6 shadow-sm">
        <div class="mb-4 flex items-start gap-3 border-b border-gray-100 pb-4">
          <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-[10px] bg-orange-100">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
              <path fill="#F54900" d="M5 21q-.825 0-1.412-.587T3 19V5q0-.825.588-1.412T5 3h4.2q.325-.9 1.088-1.45T12 1t1.713.55T14.8 3H19q.825 0 1.413.588T21 5v14q0 .825-.587 1.413T19 21zm0-2h14V5H5zm3-2h5q.425 0 .713-.288T14 16t-.288-.712T13 15H8q-.425 0-.712.288T7 16t.288.713T8 17m0-4h8q.425 0 .713-.288T17 12t-.288-.712T16 11H8q-.425 0-.712.288T7 12t.288.713T8 13m0-4h8q.425 0 .713-.288T17 8t-.288-.712T16 7H8q-.425 0-.712.288T7 8t.288.713T8 9m4-4.75q.325 0 .538-.213t.212-.537t-.213-.537T12 2.75t-.537.213t-.213.537t.213.538t.537.212M5 19V5z" />
            </svg>
          </div>
          <div class="flex flex-1 flex-col">
            <h2 class="text-xl leading-7 font-normal text-neutral-950">과제 알림 설정</h2>
            <p class="text-sm leading-5 font-normal text-gray-600">과제 마감 기한 알림을 관리합니다</p>
          </div>
        </div>

        <div class="flex flex-col gap-6">
          <div class="flex items-center justify-between">
            <div class="flex flex-col gap-1 pr-4">
              <h3 class="text-base leading-6 font-medium text-neutral-950">과제 마감 알림 받기</h3>
              <p class="text-sm leading-5 font-normal text-gray-600">과제 마감일이 다가오면 이메일로 알림을 받습니다</p>
            </div>
            <div class="flex h-6 w-10 shrink-0 cursor-pointer items-center justify-start rounded-full bg-sky-700 pl-4 shadow-inner">
              <div class="h-4 w-4 rounded-full bg-white shadow"></div>
            </div>
          </div>

          <div class="h-px w-full bg-black/10"></div>

          <div class="flex flex-col gap-2">
            <h3 class="text-sm leading-4 font-medium text-neutral-950">알림 시점</h3>

            <div class="flex w-full items-center justify-between rounded-lg border border-transparent bg-zinc-100 px-3 py-1">
              <span class="text-center text-sm leading-5 font-normal text-neutral-950">마감 3일 전</span>
              <div class="relative h-4 w-4 shrink-0 overflow-hidden opacity-50">
                <svg class="h-4 w-4 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                </svg>
              </div>
            </div>
            <p class="text-xs leading-4 font-normal text-gray-500">과제 마감일 기준으로 선택한 일수 전에 이메일 알림이 발송됩니다</p>
          </div>

          <div class="w-full rounded-[10px] border border-orange-200 bg-orange-50 px-4 pt-4 pb-4">
            <div class="flex items-start gap-2">
              <div class="mt-0.5 h-4 w-4 shrink-0 overflow-hidden">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="20" viewBox="0 0 30 30">
                  <g fill="none" stroke="#F54900" stroke-width="2">
                    <rect width="16" height="12" x="4" y="6" rx="2" />
                    <path d="m4 9l7.106 3.553a2 2 0 0 0 1.788 0L20 9" />
                  </g>
                </svg>
              </div>
              <div class="flex flex-1 flex-col gap-1">
                <p class="text-sm leading-5 font-bold text-gray-700">알림이 발송되는 경우:</p>
                <ul class="list-disc space-y-0.5 pl-5 text-sm leading-5 font-normal text-gray-700">
                  <li>학교 포털에서 크롤링한 과제의 마감일이 다가올 때</li>
                  <li>매일 오전 9시에 해당하는 과제가 있는지 확인합니다</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="w-full rounded-2xl border border-gray-200 bg-white pt-4 pb-4 pl-6 shadow-sm">
        <div class="flex items-start gap-3">
          <div class="mt-0.5 h-5 w-5 shrink-0 overflow-hidden">
            <svg class="h-5 w-5 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.84 5.23L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
            </svg>
          </div>
          <div class="flex flex-1 flex-col gap-1">
            <h3 class="text-base leading-6 font-bold text-gray-600">알림 수신 이메일</h3>
            <p class="text-base leading-6 font-normal text-gray-600">모든 알림은 회원가입 시 등록한 학교 이메일(<span class="text-sky-700">@m365.dongyang.ac.kr</span>)로 발송됩니다.</p>
          </div>
        </div>
      </div>

      <div class="flex w-full justify-end">
        <button class="flex h-10 w-32 items-center justify-center rounded-lg bg-sky-700 text-sm font-medium text-white shadow transition hover:bg-sky-800 gap-2">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
            <g fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <path d="M7 3v5h8" />
              <path d="M5 21a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2Z" />
              <path d="M17 21v-8H7v8" />
            </g>
          </svg>
          <span>설정 저장</span>
        </button>
      </div>
    </div>
  </div>
  <%@ include file="/views/common/footer.jsp"%>
</body>
</html>
