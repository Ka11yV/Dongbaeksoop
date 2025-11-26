<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>학과 공지 - 동백숲</title>
        <link href="${pageContext.request.contextPath}/assets/styles/output.css" rel="stylesheet">
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
        <%@ include file="/view/common/header.jsp" %>

            <main class="pt-24 pb-12 min-h-screen">
                <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
                    <!-- Header Section -->
                    <div class="mb-8">
                        <div class="flex items-center gap-3 mb-3">
                            <div class="flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-50 text-primary">
                                <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                    stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
                                </svg>
                            </div>
                            <h1 class="text-3xl md:text-4xl font-bold text-dark">학과 공지</h1>
                        </div>
                        <p class="text-lg text-gray-600">소속 학과의 주요 공지사항을 확인하세요.</p>
                    </div>

                    <!-- Tabs -->
                    <div class="mb-8 flex p-1 space-x-1 bg-gray-100 rounded-xl">
                        <a href="${pageContext.request.contextPath}/notifications"
                            class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all text-center">
                            대학 공지
                        </a>
                        <a href="${pageContext.request.contextPath}/department-notices"
                            class="w-full py-2.5 text-sm font-bold leading-5 text-primary bg-white rounded-lg shadow text-center">
                            학과 공지
                        </a>
                        <a href="${pageContext.request.contextPath}/subscription-notices"
                            class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all text-center">
                            구독 공지
                        </a>
                    </div>

                    <!-- Notice List -->
                    <div class="w-full rounded-2xl bg-white border border-gray-100 shadow-sm overflow-hidden">
                        <div class="p-6 border-b border-gray-100 flex items-center justify-between">
                            <h2 class="text-lg font-bold text-dark">컴퓨터정보과 공지사항</h2>
                            <span class="text-sm font-medium text-gray-500">총 5건</span>
                        </div>

                        <div class="divide-y divide-gray-50">
                            <!-- Notice Item 1 -->
                            <div class="p-6 hover:bg-gray-50 transition-colors cursor-pointer group">
                                <div class="flex justify-between items-start">
                                    <div class="flex-1">
                                        <div class="flex items-center gap-2 mb-2">
                                            <span
                                                class="px-2 py-0.5 rounded-md bg-primary text-white text-xs font-bold">NEW</span>
                                            <span
                                                class="px-2 py-0.5 rounded-md bg-gray-100 text-gray-600 text-xs font-bold">졸업</span>
                                        </div>
                                        <h3
                                            class="text-base font-bold text-dark group-hover:text-primary transition-colors mb-1">
                                            2025학년도 졸업작품 전시회 안내</h3>
                                        <p class="text-sm text-gray-500">2025.11.15</p>
                                    </div>
                                    <div class="text-gray-300 group-hover:text-primary transition-colors">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                            <!-- Notice Item 2 -->
                            <div class="p-6 hover:bg-gray-50 transition-colors cursor-pointer group">
                                <div class="flex justify-between items-start">
                                    <div class="flex-1">
                                        <div class="flex items-center gap-2 mb-2">
                                            <span
                                                class="px-2 py-0.5 rounded-md bg-gray-100 text-gray-600 text-xs font-bold">수업</span>
                                        </div>
                                        <h3
                                            class="text-base font-bold text-dark group-hover:text-primary transition-colors mb-1">
                                            캡스톤디자인 최종 발표 일정 공지</h3>
                                        <p class="text-sm text-gray-500">2025.11.12</p>
                                    </div>
                                    <div class="text-gray-300 group-hover:text-primary transition-colors">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <%@ include file="/view/common/footer.jsp" %>
    </body>

    </html>