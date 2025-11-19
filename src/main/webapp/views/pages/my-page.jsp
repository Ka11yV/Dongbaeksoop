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
        <div class="container mx-auto flex max-w-4xl flex-col gap-8 px-4">
            <div class="flex w-full flex-col gap-2">
                <h1 class="text-4xl font-medium tracking-tight text-neutral-950">마이페이지</h1>
                <p class="text-base font-normal text-gray-600">프로필 정보와 활동 내역을 관리하세요</p>
            </div>

            <div class="flex w-full justify-between space-x-1 rounded-2xl bg-gray-200 p-1 md:space-x-2">
                <div class="flex-1">
                    <button class="flex h-9 w-full items-center justify-center gap-1 rounded-2xl border border-transparent bg-white px-2 py-1 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24">
                            <g fill="none" stroke="currentColor" stroke-width="1.5">
                                <path stroke-linejoin="round" d="M4 18a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2Z" />
                                <circle cx="12" cy="7" r="3" />
                            </g>
                        </svg>
                        <span>프로필</span>
                    </button>
                </div>
                <div class="flex-1">
                    <button class="flex h-9 w-full items-center justify-center gap-1 rounded-2xl border border-transparent px-2 py-1 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="m13 16.006l7-.047V5.992l-5.17.007l-1.814 1.814zm-2-8.193L9.179 6.038L4 6.003v9.956l7 .047zm-1-3.77L12 6l2-2l5.997-.008A2 2 0 0 1 22 5.989v9.97a2 2 0 0 1-1.986 2L14 18l-1.996 2L10 18l-6.014-.041a2 2 0 0 1-1.986-2V6.003a2 2 0 0 1 2-2z" /></svg>
                        <span>내 평가</span>
                    </button>
                </div>
                <div class="flex-1">
                    <button class="flex h-9 w-full items-center justify-center gap-1 rounded-2xl border border-transparent px-2 py-1 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path fill="currentColor" d="M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7a5 5 0 0 0-5 5a5 5 0 0 0 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1M8 13h8v-2H8zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1s-1.39 3.1-3.1 3.1h-4V17h4a5 5 0 0 0 5-5a5 5 0 0 0-5-5" />
                        </svg>
                        <span>학교 계정 연동</span>
                    </button>
                </div>
            </div>

            <div class="flex w-full flex-col gap-6">
                <div class="flex w-full flex-col gap-6 rounded-2xl border border-black/10 bg-white p-6 shadow-sm md:flex-row md:items-start">
                    <div class="mx-auto flex h-20 w-20 shrink-0 items-center justify-center rounded-full bg-gray-200 md:mx-0">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24">
                            <g fill="none" stroke="currentColor" stroke-width="1.5">
                                <path stroke-linejoin="round" d="M4 18a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2Z" />
                                <circle cx="12" cy="7" r="3" />
                            </g>
                        </svg>
                    </div>

                    <div class="flex flex-col gap-1 text-center md:text-left">
                        <h2 class="text-2xl font-normal tracking-tight text-neutral-950">홍길동</h2>
                        <p class="text-base font-normal text-gray-600">example@m365.dongyang.ac.kr</p>
                        <div class="mt-1 flex items-center justify-center gap-2 md:justify-start">
                            <span class="shrink-0 rounded-lg bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-950">컴퓨터정보과</span>
                            <span class="shrink-0 rounded-lg bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-950">2학년</span>
                        </div>
                    </div>
                </div>

                <div class="flex w-full flex-col items-center justify-center rounded-2xl border border-black/10 bg-white p-6 shadow-sm">
                    <div class="mb-1 flex items-center gap-2">
                        <div class="relative h-5 w-5 shrink-0 overflow-hidden">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 32 28 "><path fill="#0062AD" stroke="#0062AD" d="m13 16.006l7-.047V5.992l-5.17.007l-1.814 1.814zm-2-8.193L9.179 6.038L4 6.003v9.956l7 .047zm-1-3.77L12 6l2-2l5.997-.008A2 2 0 0 1 22 5.989v9.97a2 2 0 0 1-1.986 2L14 18l-1.996 2L10 18l-6.014-.041a2 2 0 0 1-1.986-2V6.003a2 2 0 0 1 2-2z" /></svg>
                        </div>
                        <div class="text-2xl leading-8 font-normal tracking-tight text-sky-700">12</div>
                    </div>
                    <p class="text-base leading-6 font-normal text-gray-600">작성한 평가</p>
                </div>

                <div class="flex w-full flex-col gap-4 rounded-2xl border border-black/10 bg-white p-6 shadow-sm">
                    <div class="flex items-center justify-between border-b border-gray-100 pb-2">
                        <h3 class="text-base leading-6 font-normal text-neutral-950">프로필 수정</h3>
                        <button class="flex h-8 items-center justify-center rounded-lg border border-black/10 px-3 text-sm font-medium text-neutral-950 transition hover:bg-gray-50">편집</button>
                    </div>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2">
                            <label class="text-sm leading-4 font-medium text-neutral-950">전공</label>
                            <div class="flex h-9 w-full cursor-not-allowed items-center justify-between rounded-lg border border-transparent bg-zinc-100 px-3 opacity-50">
                                <span class="text-sm leading-5 font-normal text-neutral-950">컴퓨터정보과</span>
                                <svg class="h-4 w-4 shrink-0 text-gray-500 opacity-50" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                                </svg>
                            </div>
                        </div>

                        <div class="flex flex-col gap-2">
                            <label class="text-sm leading-4 font-medium text-neutral-950">학년</label>
                            <div class="flex h-9 w-full cursor-not-allowed items-center justify-between rounded-lg border border-transparent bg-zinc-100 px-3 opacity-50">
                                <span class="text-sm leading-5 font-normal text-neutral-950">2학년</span>
                                <svg class="h-4 w-4 shrink-0 text-gray-500 opacity-50" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="w-full rounded-2xl border border-black/10 bg-white p-6 shadow-sm">
                    <h3 class="mb-6 text-base leading-6 font-normal text-neutral-950">비밀번호 변경</h3>

                    <div class="flex flex-col gap-4">
                        <div class="flex flex-col gap-2">
                            <label class="text-sm leading-4 font-medium text-neutral-950">현재 비밀번호</label>
                            <input type="password" class="h-9 w-full rounded-lg border border-transparent bg-zinc-100 px-3 py-1 focus:ring-2 focus:ring-sky-700 focus:outline-none" />
                        </div>

                        <div class="flex flex-col gap-2">
                            <label class="text-sm leading-4 font-medium text-neutral-950">새 비밀번호</label>
                            <input type="password" placeholder="8자 이상" class="h-9 w-full rounded-lg border border-transparent bg-zinc-100 px-3 py-1 text-sm font-normal text-gray-500 placeholder-gray-500 focus:ring-2 focus:ring-sky-700 focus:outline-none" />
                        </div>

                        <div class="flex flex-col gap-2">
                            <label class="text-sm leading-4 font-medium text-neutral-950">새 비밀번호 확인</label>
                            <input type="password" class="h-9 w-full rounded-lg border border-transparent bg-zinc-100 px-3 py-1 focus:ring-2 focus:ring-sky-700 focus:outline-none" />
                        </div>

                        <button class="mt-4 flex h-9 w-full items-center justify-center rounded-lg bg-sky-700 text-sm leading-5 font-medium text-white transition hover:bg-sky-800">비밀번호 변경</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/views/common/footer.jsp"%>
</body>
</html>
