<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>구독 관리 - 동백숲</title>
        <link href="${pageContext.request.contextPath}/styles/output.css" rel="stylesheet">
        <link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
        <style>
            body {
                font-family: 'Pretendard', sans-serif;
                background-color: #F8FAFC;
                color: #0F172A;
            }

            .glass-header {
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-bottom: 1px solid rgba(255, 255, 255, 0.3);
            }
        </style>
    </head>

    <body class="antialiased">
        <%@ include file="/views/common/header.jsp" %>

            <main class="pt-24 pb-12 min-h-screen">
                <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
                    <!-- Header Section -->
                    <div class="mb-8">
                        <div class="flex items-center gap-3 mb-3">
                            <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-50 text-primary">
                                <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                    stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.477 6.326 6 8.309 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                                </svg>
                            </div>
                            <h1 class="text-3xl md:text-4xl font-bold text-dark">구독 관리</h1>
                        </div>
                        <p class="text-lg text-gray-600">관심 있는 공지 카테고리를 구독하여 알림을 받아보세요.</p>
                    </div>

                    <!-- Add Subscription Card -->
                    <div class="mb-10 p-8 rounded-2xl bg-white border border-gray-100 shadow-lg">
                        <div class="mb-6">
                            <h2 class="text-xl font-bold text-dark mb-2">새 구독 추가</h2>
                            <p class="text-gray-500">키워드를 입력하여 맞춤형 공지 알림을 구독하세요.</p>
                        </div>

                        <div class="flex flex-col md:flex-row gap-4">
                            <div class="flex-1">
                                <input type="text" placeholder="분류 (예: 프로그래밍 대회)"
                                    class="w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all placeholder-gray-400">
                            </div>
                            <div class="flex-[2]">
                                <input type="text" placeholder="키워드 (쉼표로 구분, 예: 프로그래밍, 코딩, 대회)"
                                    class="w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all placeholder-gray-400">
                            </div>
                            <button
                                class="h-12 px-6 bg-primary hover:bg-secondary text-white font-bold rounded-xl shadow-lg shadow-blue-500/30 transition-all flex items-center justify-center gap-2 whitespace-nowrap">
                                <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                    stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                                </svg>
                                구독 추가
                            </button>
                        </div>
                    </div>

                    <h2 class="text-xl font-bold text-dark mb-6">내 구독 목록</h2>

                    <!-- Subscription Grid -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-10">
                        <!-- Item 1 -->
                        <div
                            class="p-6 rounded-2xl bg-white border border-blue-100 shadow-sm hover:shadow-md transition-all group">
                            <div class="flex justify-between items-start mb-4">
                                <div class="flex items-center gap-3">
                                    <div
                                        class="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center text-primary group-hover:scale-110 transition-transform">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                                        </svg>
                                    </div>
                                    <div>
                                        <h3 class="font-bold text-dark">학사 공지</h3>
                                        <p class="text-xs text-gray-500">학사 일정, 수강신청</p>
                                    </div>
                                </div>
                                <div
                                    class="relative inline-flex h-6 w-11 items-center rounded-full bg-gray-200 cursor-pointer transition-colors">
                                    <span
                                        class="translate-x-1 inline-block h-4 w-4 transform rounded-full bg-white transition-transform"></span>
                                </div>
                            </div>

                            <div class="flex flex-wrap gap-2 mb-4">
                                <span
                                    class="px-2.5 py-1 bg-gray-100 rounded-lg text-xs font-bold text-gray-600">수강신청</span>
                                <span
                                    class="px-2.5 py-1 bg-gray-100 rounded-lg text-xs font-bold text-gray-600">시험</span>
                                <span
                                    class="px-2.5 py-1 bg-gray-100 rounded-lg text-xs font-bold text-gray-600">학사일정</span>
                            </div>

                            <div class="flex justify-between items-center pt-4 border-t border-gray-50">
                                <span class="text-sm font-medium text-gray-500">156개의 공지</span>
                                <button
                                    class="text-sm font-bold text-rose-500 hover:text-rose-700 transition-colors flex items-center gap-1">
                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                    삭제
                                </button>
                            </div>
                        </div>

                        <!-- Item 2 -->
                        <div
                            class="p-6 rounded-2xl bg-white border border-blue-100 shadow-sm hover:shadow-md transition-all group">
                            <div class="flex justify-between items-start mb-4">
                                <div class="flex items-center gap-3">
                                    <div
                                        class="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center text-primary group-hover:scale-110 transition-transform">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" />
                                        </svg>
                                    </div>
                                    <div>
                                        <h3 class="font-bold text-dark">컴퓨터정보과</h3>
                                        <p class="text-xs text-gray-500">학과 공지사항</p>
                                    </div>
                                </div>
                                <div
                                    class="relative inline-flex h-6 w-11 items-center rounded-full bg-gray-200 cursor-pointer transition-colors">
                                    <span
                                        class="translate-x-1 inline-block h-4 w-4 transform rounded-full bg-white transition-transform"></span>
                                </div>
                            </div>

                            <div class="flex flex-wrap gap-2 mb-4">
                                <span
                                    class="px-2.5 py-1 bg-gray-100 rounded-lg text-xs font-bold text-gray-600">졸업프로젝트</span>
                                <span
                                    class="px-2.5 py-1 bg-gray-100 rounded-lg text-xs font-bold text-gray-600">학과행사</span>
                            </div>

                            <div class="flex justify-between items-center pt-4 border-t border-gray-50">
                                <span class="text-sm font-medium text-gray-500">89개의 공지</span>
                                <button
                                    class="text-sm font-bold text-rose-500 hover:text-rose-700 transition-colors flex items-center gap-1">
                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                    삭제
                                </button>
                            </div>
                        </div>

                        <!-- Item 3 (Disabled) -->
                        <div
                            class="p-6 rounded-2xl bg-white border border-gray-100 shadow-sm hover:shadow-md transition-all group">
                            <div class="flex justify-between items-start mb-4">
                                <div class="flex items-center gap-3">
                                    <div
                                        class="h-10 w-10 rounded-full bg-gray-100 flex items-center justify-center text-gray-500 group-hover:scale-110 transition-transform">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                    </div>
                                    <div>
                                        <h3 class="font-bold text-gray-500">장학금 안내</h3>
                                        <p class="text-xs text-gray-400">장학금 신청 및 선발</p>
                                    </div>
                                </div>
                                <div
                                    class="relative inline-flex h-6 w-11 items-center rounded-full bg-gray-200 cursor-pointer transition-colors">
                                    <span
                                        class="translate-x-1 inline-block h-4 w-4 transform rounded-full bg-white transition-transform"></span>
                                </div>
                            </div>

                            <div class="flex flex-wrap gap-2 mb-4 opacity-50">
                                <span
                                    class="px-2.5 py-1 bg-gray-100 rounded-lg text-xs font-bold text-gray-600">장학금</span>
                                <span
                                    class="px-2.5 py-1 bg-gray-100 rounded-lg text-xs font-bold text-gray-600">학자금</span>
                            </div>

                            <div class="flex justify-between items-center pt-4 border-t border-gray-50">
                                <span class="text-sm font-medium text-gray-400">34개의 공지</span>
                                <button
                                    class="text-sm font-bold text-rose-500 hover:text-rose-700 transition-colors flex items-center gap-1">
                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                    삭제
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Info Card -->
                    <div class="p-6 rounded-2xl bg-white border border-gray-100 shadow-sm flex items-start gap-4">
                        <div class="mt-1 text-primary">
                            <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </div>
                        <div>
                            <h3 class="font-bold text-dark mb-1">구독 관리 안내</h3>
                            <ul class="list-disc pl-5 space-y-1 text-sm text-gray-600">
                                <li>구독한 카테고리의 새 공지사항을 이메일로 받을 수 있습니다.</li>
                                <li>언제든지 구독을 설정하거나 해제할 수 있습니다.</li>
                                <li>키워드를 입력하여 맞춤형 구독을 생성할 수 있습니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </main>

            <%@ include file="/views/common/footer.jsp" %>
                <script>
                    document.addEventListener('DOMContentLoaded', () => {
                        const toggles = document.querySelectorAll('.relative.inline-flex.cursor-pointer');
                        toggles.forEach(toggle => {
                            toggle.addEventListener('click', () => {
                                const knob = toggle.querySelector('span');
                                if (toggle.classList.contains('bg-primary')) {
                                    toggle.classList.replace('bg-primary', 'bg-gray-200');
                                    knob.classList.replace('translate-x-6', 'translate-x-1');
                                } else {
                                    toggle.classList.replace('bg-gray-200', 'bg-primary');
                                    knob.classList.replace('translate-x-1', 'translate-x-6');
                                }
                            });
                        });
                    });
                </script>
    </body>

    </html>