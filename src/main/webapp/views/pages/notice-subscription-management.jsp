<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
    <title>동백숲</title>
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>
    <div class = "bg-gray-50 py-8">
        <div class="container mx-auto max-w-4xl  px-4">
            <div class="w-full flex flex-col gap-2 mb-8">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 bg-sky-700/10 rounded-[10px] flex justify-center items-center shrink-0">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <g fill="none" stroke="#0062AD" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                                <rect width="20" height="14" x="2" y="5" rx="2" />
                                <path d="M2 10h20" />
                            </g>
                        </svg>
                    </div>
                    <h1 class="text-4xl font-normal text-neutral-950 tracking-tight">구독 관리</h1>
                </div>
                <p class="text-base font-normal text-gray-600">관심 있는 공지 카테고리를 구독하여 알림을 받아보세요</p>
            </div>

            <div class="w-full p-4 md:p-6 bg-white rounded-2xl border border-black/10 mb-8 shadow-sm">
                <div class="mb-6">
                    <h2 class="text-xl font-medium text-neutral-950 leading-8">새 구독 추가</h2>
                    <p class="text-base font-normal text-gray-500 leading-6">키워드를 입력하여 맞춤형 공지 알림을 구독하세요</p>
                </div>

                <div class="flex flex-col gap-4">
                    <input type="text" placeholder="분류 (예: 프로그래밍 대회)" class="w-full h-10 px-3 py-1 bg-zinc-100 rounded-lg border border-transparent text-sm font-normal text-gray-500 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-sky-700">

                    <input type="text" placeholder="키워드 (쉼표로 구분, 예: 프로그래밍, 코딩, 대회)" class="w-full h-10 px-3 py-1 bg-zinc-100 rounded-lg border border-transparent text-sm font-normal text-gray-500 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-sky-700">

                    <button class="w-full h-10 flex items-center justify-center bg-sky-700 rounded-lg text-white text-sm font-medium leading-5 hover:bg-sky-800 transition">
                        <svg class="w-4 h-4 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                        </svg>
                        구독 추가
                    </button>
                </div>
            </div>

            <h2 class="text-xl font-medium text-neutral-950 leading-7 mb-4">내 구독 목록</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-8">

                <div class="w-full p-6 bg-white rounded-2xl border border-sky-700/30 flex flex-col justify-between gap-4">
                    <div class="flex justify-between items-start">
                        <div class="flex-1 flex flex-col gap-2">
                            <div class="flex items-center gap-2">
                                <h3 class="text-base font-normal text-neutral-950">학사 공지</h3>
                                <svg class="w-4 h-4 text-sky-700 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                            <p class="text-sm font-normal text-gray-500">학사 일정, 수강신청, 시험 관련 공지</p>
                        </div>
                        <div class="w-10 h-6 pl-5 bg-sky-700 rounded-full flex items-center shadow-inner cursor-pointer transition-all">
                            <div class="w-4 h-4 bg-white rounded-full shadow"></div>
                        </div>
                    </div>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-wrap gap-2">
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">수강신청</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">시험</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">학사일정</span>
                        </div>

                        <div class="flex justify-between items-center pt-2 border-t border-gray-100">
                            <span class="text-sm font-normal text-gray-600">156개의 공지</span>
                            <button class="flex items-center gap-1 p-2 rounded-lg text-sm font-medium text-rose-600 hover:bg-rose-50 transition">
                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                </svg>
                                삭제
                            </button>
                        </div>
                    </div>
                </div>

                <div class="w-full p-6 bg-white rounded-2xl border border-sky-700/30 flex flex-col justify-between gap-4">
                    <div class="flex justify-between items-start">
                        <div class="flex-1 flex flex-col gap-2">
                            <div class="flex items-center gap-2">
                                <h3 class="text-base font-normal text-neutral-950">컴퓨터정보과</h3>
                                <svg class="w-4 h-4 text-sky-700 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                            <p class="text-sm font-normal text-gray-500">학과 공지사항 및 행사 안내</p>
                        </div>
                        <div class="w-10 h-6 pl-5 bg-sky-700 rounded-full flex items-center shadow-inner cursor-pointer transition-all">
                            <div class="w-4 h-4 bg-white rounded-full shadow"></div>
                        </div>
                    </div>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-wrap gap-2">
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">졸업프로젝트</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">학과행사</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">세미나</span>
                        </div>

                        <div class="flex justify-between items-center pt-2 border-t border-gray-100">
                            <span class="text-sm font-normal text-gray-600">89개의 공지</span>
                            <button class="flex items-center gap-1 p-2 rounded-lg text-sm font-medium text-rose-600 hover:bg-rose-50 transition">
                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                </svg>
                                삭제
                            </button>
                        </div>
                    </div>
                </div>

                <div class="w-full p-6 bg-white rounded-2xl border border-sky-700/30 flex flex-col justify-between gap-4">
                    <div class="flex justify-between items-start">
                        <div class="flex-1 flex flex-col gap-2">
                            <div class="flex items-center gap-2">
                                <h3 class="text-base font-normal text-neutral-950">장학금 안내</h3>
                                <svg class="w-4 h-4 text-sky-700 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                            <p class="text-sm font-normal text-gray-500">장학금 신청 및 선발 관련 공지</p>
                        </div>
                        <div class="w-10 h-6 pl-5 bg-sky-700 rounded-full flex items-center shadow-inner cursor-pointer transition-all">
                            <div class="w-4 h-4 bg-white rounded-full shadow"></div>
                        </div>
                    </div>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-wrap gap-2">
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">장학금</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">학자금</span>
                        </div>

                        <div class="flex justify-between items-center pt-2 border-t border-gray-100">
                            <span class="text-sm font-normal text-gray-600">34개의 공지</span>
                            <button class="flex items-center gap-1 p-2 rounded-lg text-sm font-medium text-rose-600 hover:bg-rose-50 transition">
                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                </svg>
                                삭제
                            </button>
                        </div>
                    </div>
                </div>

                <div class="w-full p-6 bg-white rounded-2xl border border-black/10 flex flex-col justify-between gap-4">
                    <div class="flex justify-between items-start">
                        <div class="flex-1 flex flex-col gap-2">
                            <div class="flex items-center gap-2">
                                <h3 class="text-base font-normal text-neutral-950">취업 및 진로</h3>
                                <svg class="w-4 h-4 text-gray-400 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                            <p class="text-sm font-normal text-gray-500">채용 공고, 취업 특강, 진로 상담</p>
                        </div>
                        <div class="w-10 h-6 bg-neutral-300 rounded-full flex items-center shadow-inner cursor-pointer transition-all">
                            <div class="w-4 h-4 bg-white rounded-full shadow"></div>
                        </div>
                    </div>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-wrap gap-2">
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">채용</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">인턴</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">취업특강</span>
                        </div>

                        <div class="flex justify-between items-center pt-2 border-t border-gray-100">
                            <span class="text-sm font-normal text-gray-600">67개의 공지</span>
                            <button class="flex items-center gap-1 p-2 rounded-lg text-sm font-medium text-rose-600 hover:bg-rose-50 transition">
                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                </svg>
                                삭제
                            </button>
                        </div>
                    </div>
                </div>

                <div class="w-full p-6 bg-white rounded-2xl border border-sky-700/30 flex flex-col justify-between gap-4">
                    <div class="flex justify-between items-start">
                        <div class="flex-1 flex flex-col gap-2">
                            <div class="flex items-center gap-2">
                                <h3 class="text-base font-normal text-neutral-950">기숙사 안내</h3>
                                <svg class="w-4 h-4 text-sky-700 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                            <p class="text-sm font-normal text-gray-500">기숙사 입사, 퇴사 및 생활 관련 공지</p>
                        </div>
                        <div class="w-10 h-6 pl-5 bg-sky-700 rounded-full flex items-center shadow-inner cursor-pointer transition-all">
                            <div class="w-4 h-4 bg-white rounded-full shadow"></div>
                        </div>
                    </div>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-wrap gap-2">
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">기숙사</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">입사</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">퇴사</span>
                        </div>

                        <div class="flex justify-between items-center pt-2 border-t border-gray-100">
                            <span class="text-sm font-normal text-gray-600">23개의 공지</span>
                            <button class="flex items-center gap-1 p-2 rounded-lg text-sm font-medium text-rose-600 hover:bg-rose-50 transition">
                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                </svg>
                                삭제
                            </button>
                        </div>
                    </div>
                </div>

                <div class="w-full p-6 bg-white rounded-2xl border border-sky-700/30 flex flex-col justify-between gap-4">
                    <div class="flex justify-between items-start">
                        <div class="flex-1 flex flex-col gap-2">
                            <div class="flex items-center gap-2">
                                <h3 class="text-base font-normal text-neutral-950">도서관</h3>
                                <svg class="w-4 h-4 text-sky-700 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                            <p class="text-sm font-normal text-gray-500">도서관 운영 시간 및 서비스 안내</p>
                        </div>
                        <div class="w-10 h-6 pl-5 bg-sky-700 rounded-full flex items-center shadow-inner cursor-pointer transition-all">
                            <div class="w-4 h-4 bg-white rounded-full shadow"></div>
                        </div>
                    </div>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-wrap gap-2">
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">도서관</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">열람실</span>
                            <span class="px-2 py-0.5 bg-gray-100 rounded-lg text-xs font-medium text-gray-950">대출</span>
                        </div>

                        <div class="flex justify-between items-center pt-2 border-t border-gray-100">
                            <span class="text-sm font-normal text-gray-600">45개의 공지</span>
                            <button class="flex items-center gap-1 p-2 rounded-lg text-sm font-medium text-rose-600 hover:bg-rose-50 transition">
                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                </svg>
                                삭제
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w-full px-6 py-4 bg-white rounded-2xl border border-black/10 shadow-sm">
                <div class="flex items-start gap-4">
                    <svg class="w-5 h-5 mt-0.5 text-gray-500 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    <div class="flex-1 flex flex-col gap-1">
                        <p class="text-sm font-bold text-gray-600 leading-5">구독 관리 안내</p>
                        <ul class="list-disc pl-5 space-y-1 text-sm font-normal text-gray-600 leading-5">
                            <li>구독한 카테고리의 새 공지사항을 이메일로 받을 수 있습니다</li>
                            <li>언제든지 구독을 설정하거나 해제할 수 있습니다</li>
                            <li>키워드를 입력하여 맞춤형 구독을 생성할 수 있습니다</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/footer.jsp"%>
</body>
</html>
