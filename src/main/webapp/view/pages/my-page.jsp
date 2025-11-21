<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>마이페이지 - 동백숲</title>
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
        <%@ include file="/view/common/header.jsp" %>

            <main class="pt-24 pb-12 min-h-screen">
                <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
                    <!-- Header Section -->
                    <div class="mb-8">
                        <h1 class="text-3xl md:text-4xl font-bold text-dark mb-3">마이페이지</h1>
                        <p class="text-lg text-gray-600">프로필 정보와 활동 내역을 관리하세요.</p>
                    </div>

                    <!-- Navigation Tabs -->
                    <div class="mb-8 flex p-1 space-x-1 bg-gray-100 rounded-xl">
                        <button
                            class="w-full py-2.5 text-sm font-bold leading-5 text-primary bg-white rounded-lg shadow">
                            프로필
                        </button>
                        <button
                            class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all">
                            내 평가
                        </button>
                        <button
                            class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all">
                            학교 계정 연동
                        </button>
                    </div>

                    <div class="flex flex-col gap-6">
                        <!-- Profile Card -->
                        <div
                            class="flex flex-col md:flex-row items-center md:items-start gap-6 p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
                            <div class="relative">
                                <div
                                    class="h-24 w-24 rounded-full bg-blue-50 flex items-center justify-center text-primary text-3xl font-bold border-4 border-white shadow-md">
                                    홍
                                </div>
                                <div
                                    class="absolute bottom-0 right-0 h-8 w-8 bg-white rounded-full flex items-center justify-center shadow-sm border border-gray-100 cursor-pointer hover:bg-gray-50">
                                    <svg class="w-4 h-4 text-gray-500" fill="none" viewBox="0 0 24 24"
                                        stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z" />
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15 13a3 3 0 11-6 0 3 3 0 016 0z" />
                                    </svg>
                                </div>
                            </div>

                            <div class="text-center md:text-left flex-1">
                                <h2 class="text-2xl font-bold text-dark mb-1">홍길동</h2>
                                <p class="text-gray-500 mb-4">example@m365.dongyang.ac.kr</p>
                                <div class="flex items-center justify-center md:justify-start gap-2">
                                    <span
                                        class="px-3 py-1 rounded-full bg-gray-100 text-xs font-bold text-gray-600">컴퓨터정보과</span>
                                    <span
                                        class="px-3 py-1 rounded-full bg-gray-100 text-xs font-bold text-gray-600">2학년</span>
                                </div>
                            </div>

                            <div
                                class="flex flex-col items-center justify-center p-4 bg-blue-50 rounded-xl min-w-[120px]">
                                <span class="text-3xl font-bold text-primary mb-1">12</span>
                                <span class="text-sm font-medium text-blue-600">작성한 평가</span>
                            </div>
                        </div>

                        <!-- Edit Profile Section -->
                        <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
                            <div class="flex items-center justify-between mb-6 pb-4 border-b border-gray-100">
                                <h3 class="text-lg font-bold text-dark">프로필 정보</h3>
                                <button
                                    class="text-sm font-bold text-primary hover:text-secondary transition-colors">수정하기</button>
                            </div>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div class="space-y-2">
                                    <label class="text-sm font-bold text-gray-700">전공</label>
                                    <div
                                        class="flex items-center justify-between w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 text-gray-500">
                                        <span>컴퓨터정보과</span>
                                        <svg class="w-5 h-5 text-gray-400" fill="none" viewBox="0 0 24 24"
                                            stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                        </svg>
                                    </div>
                                </div>

                                <div class="space-y-2">
                                    <label class="text-sm font-bold text-gray-700">학년</label>
                                    <div
                                        class="flex items-center justify-between w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 text-gray-500">
                                        <span>2학년</span>
                                        <svg class="w-5 h-5 text-gray-400" fill="none" viewBox="0 0 24 24"
                                            stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Change Password Section -->
                        <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
                            <h3 class="text-lg font-bold text-dark mb-6">비밀번호 변경</h3>

                            <form class="space-y-4 max-w-md">
                                <div class="space-y-2">
                                    <label class="text-sm font-bold text-gray-700">현재 비밀번호</label>
                                    <input type="password"
                                        class="w-full h-12 px-4 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all" />
                                </div>

                                <div class="space-y-2">
                                    <label class="text-sm font-bold text-gray-700">새 비밀번호</label>
                                    <input type="password" placeholder="8자 이상 입력해주세요"
                                        class="w-full h-12 px-4 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all placeholder-gray-400" />
                                </div>

                                <div class="space-y-2">
                                    <label class="text-sm font-bold text-gray-700">새 비밀번호 확인</label>
                                    <input type="password"
                                        class="w-full h-12 px-4 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all" />
                                </div>

                                <div class="pt-2">
                                    <button type="submit"
                                        class="px-6 py-3 bg-dark text-white font-bold rounded-xl hover:bg-gray-800 transition-colors shadow-lg shadow-gray-900/20">
                                        비밀번호 변경
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>

            <%@ include file="/view/common/footer.jsp" %>
    </body>

    </html>