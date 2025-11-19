<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
    <title>동백숲</title>
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>
    <div class="bg-gray-50 py-8">
        <main class="container mx-auto max-w-4xl  px-4">
            <div class="mx-auto flex min-h-screen w-full max-w-[1024px] flex-col gap-8 bg-gray-50 p-4">
                <div class="flex w-full flex-col gap-2">
                    <div class="flex items-center gap-3">
                        <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-[10px] bg-sky-700/10">
                            <svg class="h-6 w-6 text-sky-700" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.477 6.326 6 8.309 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m5 0v1a3 3 0 11-6 0v-1m6 0H9" />
                            </svg>
                        </div>
                        <h1 class="text-4xl font-normal tracking-tight text-neutral-950">공지사항</h1>
                    </div>
                    <p class="text-base font-normal text-gray-600">학교 및 학과 공지사항을 확인하세요</p>
                </div>

                <div class="flex w-full flex-col gap-8">
                    <div class="flex w-full justify-between space-x-1 rounded-2xl bg-gray-200 p-1 md:space-x-2">
                        <div class="flex-1">
                            <button class="flex h-9 w-full items-center justify-center rounded-2xl border border-transparent bg-white px-2 py-1 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">대학 공지</button>
                        </div>
                        <div class="flex-1">
                            <button class="flex h-9 w-full items-center justify-center rounded-2xl border border-transparent px-2 py-1 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">학과 공지</button>
                        </div>
                        <div class="flex-1">
                            <button class="flex h-9 w-full items-center justify-center rounded-2xl border border-transparent px-2 py-1 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">구독 공지</button>
                        </div>
                    </div>

                    <div class="w-full rounded-2xl border border-black/10 bg-white p-4 shadow-sm md:p-6">
                        <div class="mb-6 flex items-center justify-between">
                            <h2 class="text-base font-normal text-neutral-950">전체 공지사항</h2>
                            <span class="text-sm font-normal text-gray-600">총 12건</span>
                        </div>

                        <div class="flex flex-col gap-4">
                            <div class="flex w-full cursor-pointer items-center justify-between rounded-[10px] border border-black/10 p-4 transition hover:bg-gray-50">
                                <div class="flex flex-1 flex-col gap-1">
                                    <div class="flex items-center gap-2">
                                        <span class="shrink-0 rounded-lg bg-sky-700 px-2 py-0.5 text-xs leading-4 font-medium text-white">NEW</span>
                                        <span class="shrink-0 rounded-lg border border-black/10 px-2 py-0.5 text-xs leading-4 font-medium text-neutral-950">학사</span>
                                    </div>
                                    <h3 class="truncate text-base font-normal text-neutral-950">2025학년도 1학기 수강신청 안내</h3>
                                    <p class="text-sm font-normal text-gray-600">2025.11.10</p>
                                </div>
                                <div class="ml-4 flex h-5 w-5 shrink-0 items-center justify-center">
                                    <svg class="h-3 w-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                    </svg>
                                </div>
                            </div>

                            <div class="flex w-full cursor-pointer items-center justify-between rounded-[10px] border border-black/10 p-4 transition hover:bg-gray-50">
                                <div class="flex flex-1 flex-col gap-1">
                                    <div class="flex items-center gap-2">
                                        <span class="shrink-0 rounded-lg bg-sky-700 px-2 py-0.5 text-xs leading-4 font-medium text-white">NEW</span>
                                        <span class="shrink-0 rounded-lg border border-black/10 px-2 py-0.5 text-xs leading-4 font-medium text-neutral-950">장학</span>
                                    </div>
                                    <h3 class="truncate text-base font-normal text-neutral-950">장학금 신청 기간 연장 공지</h3>
                                    <p class="text-sm font-normal text-gray-600">2025.11.09</p>
                                </div>
                                <div class="ml-4 flex h-5 w-5 shrink-0 items-center justify-center">
                                    <svg class="h-3 w-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                    </svg>
                                </div>
                            </div>

                            <div class="flex w-full cursor-pointer items-center justify-between rounded-[10px] border border-black/10 p-4 transition hover:bg-gray-50">
                                <div class="flex flex-1 flex-col gap-1">
                                    <div class="flex items-center gap-2">
                                        <span class="shrink-0 rounded-lg border border-black/10 px-2 py-0.5 text-xs leading-4 font-medium text-neutral-950">채용</span>
                                    </div>
                                    <h3 class="truncate text-base font-normal text-neutral-950">2025 취업박람회 개최 안내</h3>
                                    <p class="text-sm font-normal text-gray-600">2025.11.08</p>
                                </div>
                                <div class="ml-4 flex h-5 w-5 shrink-0 items-center justify-center">
                                    <svg class="h-3 w-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                    </svg>
                                </div>
                            </div>

                            <div class="flex w-full cursor-pointer items-center justify-between rounded-[10px] border border-black/10 p-4 transition hover:bg-gray-50">
                                <div class="flex flex-1 flex-col gap-1">
                                    <div class="flex items-center gap-2">
                                        <span class="shrink-0 rounded-lg border border-black/10 px-2 py-0.5 text-xs leading-4 font-medium text-neutral-950">행사</span>
                                    </div>
                                    <h3 class="truncate text-base font-normal text-neutral-950">학생회 주최 축제 프로그램 안내</h3>
                                    <p class="text-sm font-normal text-gray-600">2025.11.07</p>
                                </div>
                                <div class="ml-4 flex h-5 w-5 shrink-0 items-center justify-center">
                                    <svg class="h-3 w-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                    </svg>
                                </div>
                            </div>

                            <div class="flex w-full cursor-pointer items-center justify-between rounded-[10px] border border-black/10 p-4 transition hover:bg-gray-50">
                                <div class="flex flex-1 flex-col gap-1">
                                    <div class="flex items-center gap-2">
                                        <span class="shrink-0 rounded-lg border border-black/10 px-2 py-0.5 text-xs leading-4 font-medium text-neutral-950">일반</span>
                                    </div>
                                    <h3 class="truncate text-base font-normal text-neutral-950">도서관 열람실 이용시간 변경 안내</h3>
                                    <p class="text-sm font-normal text-gray-600">2025.11.06</p>
                                </div>
                                <div class="ml-4 flex h-5 w-5 shrink-0 items-center justify-center">
                                    <svg class="h-3 w-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <div class="mt-8 flex items-center justify-center gap-1">
                            <button class="flex h-9 w-24 cursor-not-allowed items-center justify-center rounded-lg p-2 text-sm font-medium text-neutral-950 opacity-50 disabled:opacity-30" disabled>
                                <svg class="mr-2 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                                </svg>
                                Previous
                            </button>

                            <button class="flex h-9 w-9 items-center justify-center rounded-lg border border-black/10 bg-white text-sm font-medium text-neutral-950">1</button>

                            <button class="flex h-9 w-9 items-center justify-center rounded-lg text-sm font-medium text-neutral-950 transition hover:bg-gray-100">2</button>

                            <button class="flex h-9 w-9 items-center justify-center rounded-lg text-sm font-medium text-neutral-950 transition hover:bg-gray-100">3</button>

                            <button class="flex h-9 w-20 items-center justify-center rounded-lg p-2 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">
                                Next
                                <svg class="ml-2 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>


    <%@ include file="/views/common/footer.jsp"%>
</body>
</html>
