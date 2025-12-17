<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>공지사항 - 동백숲</title>
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
                                <div
                                    class="flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-50 text-primary">
                                    <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.477 6.326 6 8.309 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                                    </svg>
                                </div>
                                <h1 class="text-3xl md:text-4xl font-bold text-dark">공지사항</h1>
                            </div>
                            <p class="text-lg text-gray-600">학교 및 학과 공지사항을 확인하세요.</p>
                        </div>

                        <!-- Tabs -->
                        <div class="mb-8 flex p-1 space-x-1 bg-gray-100 rounded-xl">
                            <button id="tab-university" onclick="switchNoticeTab('university')"
                                class="w-full py-2.5 text-sm font-bold leading-5 text-primary bg-white rounded-lg shadow transition-all">
                                대학 공지
                            </button>
                            <button id="tab-department" onclick="switchNoticeTab('department')"
                                class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all">
                                학과 공지
                            </button>
                            <button id="tab-subscription" onclick="switchNoticeTab('subscription')"
                                class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all">
                                구독 공지
                            </button>
                        </div>

                        <!-- University Notices -->
                        <div id="section-university"
                            class="w-full rounded-2xl bg-white border border-gray-100 shadow-sm overflow-hidden">
                            <div class="p-6 border-b border-gray-100 flex items-center justify-between">
                                <h2 class="text-lg font-bold text-dark">전체 공지사항</h2>
                                <span class="text-sm font-medium text-gray-500">총 ${universityNotifications != null ?
                                    universityNotifications.size() : 0}건</span>
                            </div>

                            <div class="divide-y divide-gray-50">
                                <c:choose>
                                    <c:when test="${not empty universityNotifications}">
                                        <c:forEach var="notification" items="${universityNotifications}">
                                            <!-- Notice Item -->
                                            <div class="p-6 hover:bg-gray-50 transition-colors cursor-pointer group"
                                                onclick="location.href='${pageContext.request.contextPath}/notifications/${notification.id}'">
                                                <div class="flex justify-between items-start">
                                                    <div class="flex-1">
                                                        <div class="flex items-center gap-2 mb-2">
                                                            <span
                                                                class="px-2 py-0.5 rounded-md bg-primary text-white text-xs font-bold">NEW</span>
                                                            <span
                                                                class="px-2 py-0.5 rounded-md bg-gray-100 text-gray-600 text-xs font-bold">
                                                                대학
                                                            </span>
                                                        </div>
                                                        <h3
                                                            class="text-base font-bold text-dark group-hover:text-primary transition-colors mb-1">
                                                            ${notification.title}
                                                        </h3>
                                                        <p class="text-sm text-gray-500">${notification.postedDate}</p>
                                                    </div>
                                                    <div
                                                        class="text-gray-300 group-hover:text-primary transition-colors">
                                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24"
                                                            stroke="currentColor" stroke-width="2">
                                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                                d="M9 5l7 7-7 7" />
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="p-6 text-center text-gray-500">
                                            등록된 대학 공지사항이 없습니다.
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <!-- Pagination -->
                            <div class="p-6 border-t border-gray-100 flex items-center justify-center gap-2">
                                <button
                                    class="flex h-10 w-10 items-center justify-center rounded-lg border border-gray-200 bg-white text-gray-400 hover:bg-gray-50 hover:text-gray-600 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
                                    disabled>
                                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                                    </svg>
                                </button>

                                <button
                                    class="flex h-10 w-10 items-center justify-center rounded-lg bg-primary text-white font-bold shadow-md">1</button>
                                <button
                                    class="flex h-10 w-10 items-center justify-center rounded-lg border border-gray-200 bg-white text-gray-600 font-medium hover:bg-gray-50 transition-all">2</button>
                                <button
                                    class="flex h-10 w-10 items-center justify-center rounded-lg border border-gray-200 bg-white text-gray-600 font-medium hover:bg-gray-50 transition-all">3</button>

                                <button
                                    class="flex h-10 w-10 items-center justify-center rounded-lg border border-gray-200 bg-white text-gray-600 hover:bg-gray-50 hover:text-dark transition-all">
                                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <!-- Department Notices -->
                        <div id="section-department"
                            class="w-full rounded-2xl bg-white border border-gray-100 shadow-sm overflow-hidden hidden">
                            <div class="p-6 border-b border-gray-100 flex items-center justify-between">
                                <h2 class="text-lg font-bold text-dark">
                                    <c:choose>
                                        <c:when test="${not empty loggedInUser}">
                                            <c:choose>
                                                <c:when test="${loggedInUser.deptId == 1}">기계공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 2}">기계설계공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 3}">자동화공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 4}">로봇소프트웨어과</c:when>
                                                <c:when test="${loggedInUser.deptId == 5}">전기공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 6}">반도체전자공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 7}">정보통신공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 8}">소방안전관리과</c:when>
                                                <c:when test="${loggedInUser.deptId == 9}">웹응용소프트웨어공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 10}">컴퓨터소프트웨어공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 11}">인공지능소프트웨어과</c:when>
                                                <c:when test="${loggedInUser.deptId == 12}">생명화학공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 13}">바이오융합공학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 14}">건축과</c:when>
                                                <c:when test="${loggedInUser.deptId == 15}">실내건축디자인과</c:when>
                                                <c:when test="${loggedInUser.deptId == 16}">시각디자인과</c:when>
                                                <c:when test="${loggedInUser.deptId == 17}">AR·VR콘텐츠디자인과</c:when>
                                                <c:when test="${loggedInUser.deptId == 18}">경영학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 19}">세무회계학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 20}">유통마케팅학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 21}">호텔관광학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 22}">경영정보학과</c:when>
                                                <c:when test="${loggedInUser.deptId == 23}">빅데이터경영과</c:when>
                                                <c:when test="${loggedInUser.deptId == 24}">교양과</c:when>
                                                <c:otherwise>학과</c:otherwise>
                                            </c:choose>
                                            공지사항
                                        </c:when>
                                        <c:otherwise>학과 공지사항</c:otherwise>
                                    </c:choose>
                                </h2>
                                <span class="text-sm font-medium text-gray-500">총 ${departmentNotifications != null ?
                                    departmentNotifications.size() : 0}건</span>
                            </div>

                            <div class="divide-y divide-gray-50">
                                <c:choose>
                                    <c:when test="${empty loggedInUser}">
                                        <div class="p-6 text-center text-gray-500">
                                            로그인 후 확인 가능합니다.
                                        </div>
                                    </c:when>
                                    <c:when test="${not empty departmentNotifications}">
                                        <c:forEach var="notification" items="${departmentNotifications}">
                                            <!-- Notice Item -->
                                            <div class="p-6 hover:bg-gray-50 transition-colors cursor-pointer group"
                                                onclick="location.href='${pageContext.request.contextPath}/notifications/${notification.id}'">
                                                <div class="flex justify-between items-start">
                                                    <div class="flex-1">
                                                        <div class="flex items-center gap-2 mb-2">
                                                            <span
                                                                class="px-2 py-0.5 rounded-md bg-primary text-white text-xs font-bold">NEW</span>
                                                            <span
                                                                class="px-2 py-0.5 rounded-md bg-gray-100 text-gray-600 text-xs font-bold">학과</span>
                                                        </div>
                                                        <h3
                                                            class="text-base font-bold text-dark group-hover:text-primary transition-colors mb-1">
                                                            ${notification.title}
                                                        </h3>
                                                        <p class="text-sm text-gray-500">${notification.postedDate}</p>
                                                    </div>
                                                    <div
                                                        class="text-gray-300 group-hover:text-primary transition-colors">
                                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24"
                                                            stroke="currentColor" stroke-width="2">
                                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                                d="M9 5l7 7-7 7" />
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="p-6 text-center text-gray-500">
                                            등록된 학과 공지사항이 없습니다.
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Subscription Notices -->
                        <div id="section-subscription"
                            class="w-full rounded-2xl bg-white border border-gray-100 shadow-sm overflow-hidden hidden">
                            <div class="p-6 border-b border-gray-100 flex items-center justify-between">
                                <h2 class="text-lg font-bold text-dark">구독한 공지사항</h2>
                                <span class="text-sm font-medium text-gray-500">총 3건</span>
                            </div>

                            <div class="divide-y divide-gray-50">
                                <!-- Notice Item 1 -->
                                <div class="p-6 hover:bg-gray-50 transition-colors cursor-pointer group">
                                    <div class="flex justify-between items-start">
                                        <div class="flex-1">
                                            <div class="flex items-center gap-2 mb-2">
                                                <span
                                                    class="px-2 py-0.5 rounded-md bg-primary text-white text-xs font-bold">키워드:
                                                    장학</span>
                                            </div>
                                            <h3
                                                class="text-base font-bold text-dark group-hover:text-primary transition-colors mb-1">
                                                2025학년도 1학기 국가장학금 신청 안내</h3>
                                            <p class="text-sm text-gray-500">2025.11.14</p>
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
                    <script>
                        function switchNoticeTab(tabName) {
                            // Hide all sections
                            document.getElementById('section-university').classList.add('hidden');
                            document.getElementById('section-department').classList.add('hidden');
                            document.getElementById('section-subscription').classList.add('hidden');

                            // Show selected section
                            document.getElementById('section-' + tabName).classList.remove('hidden');

                            // Reset tab styles
                            const tabs = ['university', 'department', 'subscription'];
                            tabs.forEach(t => {
                                const btn = document.getElementById('tab-' + t);
                                if (t === tabName) {
                                    btn.className = 'w-full py-2.5 text-sm font-bold leading-5 text-primary bg-white rounded-lg shadow transition-all';
                                } else {
                                    btn.className = 'w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all';
                                }
                            });
                        }
                    </script>
        </body>

        </html>