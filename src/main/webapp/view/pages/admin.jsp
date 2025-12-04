<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>동백숲 - 관리자 대시보드</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/output.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <style>
            /* Apple-style subtle refinements */
            body {
                background-color: #F5F5F7;
                /* Apple's light gray background */
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            }

            .apple-card {
                background: #FFFFFF;
                border-radius: 18px;
                /* Slightly more rounded */
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04), 0 1px 2px rgba(0, 0, 0, 0.02);
                /* Very subtle, premium shadow */
                border: 1px solid rgba(0, 0, 0, 0.03);
            }

            .apple-button-primary {
                background-color: #0071E3;
                /* Apple System Blue */
                color: white;
                font-weight: 500;
                transition: all 0.2s ease;
            }

            .apple-button-primary:hover {
                background-color: #0077ED;
                transform: scale(1.02);
            }

            .apple-button-danger {
                background-color: #FF3B30;
                /* Apple System Red */
                color: white;
                font-weight: 500;
                transition: all 0.2s ease;
            }

            .apple-button-danger:hover {
                background-color: #FF453A;
                transform: scale(1.02);
            }

            .apple-button-secondary {
                background-color: #E8E8ED;
                color: #1D1D1F;
                font-weight: 500;
                transition: all 0.2s ease;
            }

            .apple-button-secondary:hover {
                background-color: #D2D2D7;
            }

            .table-header {
                font-size: 12px;
                font-weight: 600;
                color: #86868B;
                /* Apple's secondary text color */
                text-transform: uppercase;
                letter-spacing: 0.02em;
            }

            .table-row {
                transition: background-color 0.15s ease;
            }

            .table-row:hover {
                background-color: #F5F5F7;
            }
        </style>
    </head>

    <body class="antialiased">

        <%@ include file="/view/common/header.jsp" %>

            <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-24 pb-12">
                <!-- Header Section -->
                <div class="mb-10 flex justify-between items-end">
                    <div>
                        <h1 class="text-4xl font-semibold text-[#1D1D1F] tracking-tight">관리자 대시보드</h1>
                        <p class="mt-2 text-lg text-[#86868B]">동백숲 서비스를 관리하세요</p>
                    </div>
                    <div class="text-sm text-[#86868B]">
                        <%= new java.text.SimpleDateFormat("yyyy년 MM월 dd일").format(new java.util.Date()) %>
                    </div>
                </div>

                <!-- Dashboard Cards -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5 mb-10">
                    <!-- Total Users -->
                    <div class="apple-card p-6 flex flex-col justify-between h-32">
                        <div class="flex justify-between items-start">
                            <p class="text-sm font-medium text-[#86868B]">총 사용자</p>
                            <span
                                class="text-[10px] font-bold text-[#0071E3] bg-blue-50 px-2 py-0.5 rounded-full"></span>
                        </div>
                        <p class="text-3xl font-semibold text-[#1D1D1F]">${userCount}</p>
                    </div>

                    <!-- Active Users -->
                    <div class="apple-card p-6 flex flex-col justify-between h-32">
                        <div class="flex justify-between items-start">
                            <p class="text-sm font-medium text-[#86868B]">현재 접속자</p>
                            <span
                                class="text-[10px] font-bold text-[#34C759] bg-green-50 px-2 py-0.5 rounded-full"></span>
                        </div>
                        <p class="text-3xl font-semibold text-[#1D1D1F]">0</p>
                    </div>

                    <!-- Total Reviews -->
                    <div class="apple-card p-6 flex flex-col justify-between h-32">
                        <div class="flex justify-between items-start">
                            <p class="text-sm font-medium text-[#86868B]">총 평가</p>
                            <span
                                class="text-[10px] font-bold text-[#AF52DE] bg-purple-50 px-2 py-0.5 rounded-full"></span>
                        </div>
                        <p class="text-3xl font-semibold text-[#1D1D1F]">0</p>
                    </div>

                    <!-- Total Questions -->
                    <div class="apple-card p-6 flex flex-col justify-between h-32">
                        <div class="flex justify-between items-start">
                            <p class="text-sm font-medium text-[#86868B]">피드백</p>
                            <span
                                class="text-[10px] font-bold text-[#FF9500] bg-orange-50 px-2 py-0.5 rounded-full"></span>
                        </div>
                        <p class="text-3xl font-semibold text-[#1D1D1F]">0</p>
                    </div>
                </div>

                <!-- Tab Navigation -->
                <div class="bg-[#E8E8ED] p-1 rounded-xl flex space-x-1 mb-8 w-fit mx-auto">
                    <button onclick="switchTab('lecture')" id="tab-lecture"
                        class="px-6 py-1.5 rounded-lg text-sm font-medium transition-all duration-200 bg-white text-black shadow-sm">
                        강의 관리
                    </button>
                    <button onclick="switchTab('user')" id="tab-user"
                        class="px-6 py-1.5 rounded-lg text-sm font-medium text-[#86868B] hover:text-black transition-all duration-200">
                        사용자 관리
                    </button>
                    <button onclick="switchTab('notice')" id="tab-notice"
                        class="px-6 py-1.5 rounded-lg text-sm font-medium text-[#86868B] hover:text-black transition-all duration-200">
                        공지 관리
                    </button>
                    <button onclick="switchTab('stats')" id="tab-stats"
                        class="px-6 py-1.5 rounded-lg text-sm font-medium text-[#86868B] hover:text-black transition-all duration-200">
                        통계
                    </button>
                </div>

                <!-- Content Sections -->
                <div class="apple-card p-8 min-h-[600px]">

                    <!-- Lecture Management -->
                    <div id="content-lecture" class="space-y-6">
                        <div class="flex justify-between items-center">
                            <h2 class="text-2xl font-semibold text-[#1D1D1F]">강의 목록</h2>
                            <button
                                class="apple-button-primary px-4 py-2 rounded-full text-sm flex items-center shadow-sm">
                                <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"
                                        d="M12 4v16m8-8H4"></path>
                                </svg>
                                강의 추가
                            </button>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="border-b border-gray-200">
                                        <th class="px-4 py-3 table-header">NO</th>
                                        <th class="px-4 py-3 table-header">개설과목</th>
                                        <th class="px-4 py-3 table-header">분반</th>
                                        <th class="px-4 py-3 table-header">과목명</th>
                                        <th class="px-4 py-3 table-header">이수구분</th>
                                        <th class="px-4 py-3 table-header">학점</th>
                                        <th class="px-4 py-3 table-header">학과</th>
                                        <th class="px-4 py-3 table-header">교원번호</th>
                                        <th class="px-4 py-3 table-header">성명</th>
                                        <th class="px-4 py-3 table-header text-right">작업</th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm text-[#1D1D1F]">
                                    <tr class="table-row border-b border-gray-100 last:border-0">
                                        <td class="px-4 py-4 font-medium">1</td>
                                        <td class="px-4 py-4 text-[#86868B]">1996023</td>
                                        <td class="px-4 py-4 text-[#86868B]">01</td>
                                        <td class="px-4 py-4 font-medium">영어회화</td>
                                        <td class="px-4 py-4"><span
                                                class="px-2.5 py-1 text-xs font-medium bg-gray-100 text-gray-600 rounded-md">교선</span>
                                        </td>
                                        <td class="px-4 py-4 text-[#86868B]">2</td>
                                        <td class="px-4 py-4 text-[#86868B]">교양과</td>
                                        <td class="px-4 py-4 text-[#86868B]">2007057</td>
                                        <td class="px-4 py-4 text-[#86868B]">Stephen</td>
                                        <td class="px-4 py-4 flex justify-end space-x-2">
                                            <button
                                                class="apple-button-secondary px-3 py-1.5 rounded-lg text-xs">수정</button>
                                            <button
                                                class="apple-button-danger px-3 py-1.5 rounded-lg text-xs">삭제</button>
                                        </td>
                                    </tr>
                                    <tr class="table-row border-b border-gray-100 last:border-0">
                                        <td class="px-4 py-4 font-medium">2</td>
                                        <td class="px-4 py-4 text-[#86868B]">1999045</td>
                                        <td class="px-4 py-4 text-[#86868B]">01</td>
                                        <td class="px-4 py-4 font-medium">취업영어</td>
                                        <td class="px-4 py-4"><span
                                                class="px-2.5 py-1 text-xs font-medium bg-gray-100 text-gray-600 rounded-md">교선</span>
                                        </td>
                                        <td class="px-4 py-4 text-[#86868B]">2</td>
                                        <td class="px-4 py-4 text-[#86868B]">교양과</td>
                                        <td class="px-4 py-4 text-[#86868B]">2023004</td>
                                        <td class="px-4 py-4 text-[#86868B]">김소정</td>
                                        <td class="px-4 py-4 flex justify-end space-x-2">
                                            <button
                                                class="apple-button-secondary px-3 py-1.5 rounded-lg text-xs">수정</button>
                                            <button
                                                class="apple-button-danger px-3 py-1.5 rounded-lg text-xs">삭제</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- User Management -->
                    <div id="content-user" class="hidden space-y-6">
                        <div class="flex justify-between items-center">
                            <h2 class="text-2xl font-semibold text-[#1D1D1F]">사용자 목록</h2>
                            <div class="relative">
                                <select
                                    class="bg-[#F5F5F7] border-0 text-[#1D1D1F] text-sm rounded-lg focus:ring-2 focus:ring-[#0071E3] block w-32 p-2 font-medium cursor-pointer">
                                    <option selected>전체</option>
                                    <option value="active">활성</option>
                                    <option value="banned">차단됨</option>
                                </select>
                            </div>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="border-b border-gray-200">
                                        <th class="px-4 py-3 table-header">아이디</th>
                                        <th class="px-4 py-3 table-header">이메일</th>
                                        <th class="px-4 py-3 table-header">학과</th>
                                        <th class="px-4 py-3 table-header">상태</th>
                                        <th class="px-4 py-3 table-header">가입일</th>
                                        <th class="px-4 py-3 table-header text-right">작업</th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm text-[#1D1D1F]">
                                <c:forEach var="user" items="${userList}">
                                    <tr class="table-row border-b border-gray-100 last:border-0 hover:bg-gray-50">

                                            <%-- 학번/ID --%>
                                        <td class="px-4 py-4 font-medium">${user.userId}</td>

                                            <%-- 이메일 --%>
                                        <td class="px-4 py-4 text-[#86868B]">${user.email}</td>

                                            <%-- 학과 (User 객체에 deptName이 있다고 가정, 없다면 deptId 출력) --%>
                                        <td class="px-4 py-4 text-[#86868B]">
                                                ${user.deptName}
                                                <%-- 만약 학과명을 출력하려면 조인된 쿼리나 별도 처리가 필요합니다 --%>
                                        </td>

                                            <%-- 상태 (활성/정지 조건부 렌더링) --%>
                                        <td class="px-4 py-4">
                                            <c:choose>
                                                <%-- 정지된 유저일 경우 (isBan == true) --%>
                                                <c:when test="${user.isBan}">
                                                    <span class="px-2.5 py-1 text-xs font-medium bg-red-100 text-red-500 rounded-md">
                                                        정지
                                                    </span>
                                                                            </c:when>
                                                                            <%-- 활성 유저일 경우 --%>
                                                                            <c:otherwise>
                                                    <span class="px-2.5 py-1 text-xs font-medium bg-green-100 text-[#34C759] rounded-md">
                                                        활성
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                            <%-- 가입일 (LocalDateTime 포맷팅이 필요할 수 있음) --%>
                                        <td class="px-4 py-4 text-[#86868B]">
                                                ${user.createdAt}
                                        </td>

                                            <%-- 차단/해제 버튼 (상태에 따라 버튼 텍스트 변경) --%>
                                        <td class="px-4 py-4 flex justify-end">
                                            <form action="${pageContext}/admin/status" >
                                                <input type="hidden" name="targetId" value="${user.userId}">
                                                    <c:choose>
                                                        <c:when test="${user.isBan}">
                                                            <button name="action" value="unban" id="banButton"
                                                                    class="px-3 py-1.5 rounded-lg text-xs bg-gray-200 text-gray-700 cursor-pointer">
                                                                차단 해제
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button name="action" value="ban" id="banButton"
                                                                    class="apple-button-danger px-3 py-1.5 rounded-lg text-xs cursor-pointer">
                                                                차단
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Notice Management -->
                    <div id="content-notice" class="hidden space-y-6">
                        <div class="flex justify-between items-center">
                            <h2 class="text-2xl font-semibold text-[#1D1D1F]">공지사항 관리</h2>
                            <button
                                class="apple-button-primary px-4 py-2 rounded-full text-sm flex items-center shadow-sm">
                                <svg class="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5"
                                        d="M12 4v16m8-8H4"></path>
                                </svg>
                                새 공지 작성
                            </button>
                        </div>

                        <div class="overflow-x-auto">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr class="border-b border-gray-200">
                                        <th class="px-4 py-3 table-header">제목</th>
                                        <th class="px-4 py-3 table-header">카테고리</th>
                                        <th class="px-4 py-3 table-header">작성자</th>
                                        <th class="px-4 py-3 table-header">작성일</th>
                                        <th class="px-4 py-3 table-header">조회수</th>
                                        <th class="px-4 py-3 table-header text-right">작업</th>
                                    </tr>
                                </thead>
                                <tbody class="text-sm text-[#1D1D1F]">
                                    <tr class="table-row border-b border-gray-100 last:border-0">
                                        <td class="px-4 py-4 font-medium">2025학년도 1학기 수강신청 안내</td>
                                        <td class="px-4 py-4"><span
                                                class="px-2.5 py-1 text-xs font-medium bg-blue-50 text-[#0071E3] rounded-md">학사</span>
                                        </td>
                                        <td class="px-4 py-4 text-[#86868B]">관리자</td>
                                        <td class="px-4 py-4 text-[#86868B]">2024-01-15</td>
                                        <td class="px-4 py-4 text-[#86868B]">456</td>
                                        <td class="px-4 py-4 flex justify-end space-x-2">
                                            <button
                                                class="apple-button-secondary px-3 py-1.5 rounded-lg text-xs">수정</button>
                                            <button
                                                class="apple-button-danger px-3 py-1.5 rounded-lg text-xs">삭제</button>
                                        </td>
                                    </tr>
                                    <tr class="table-row border-b border-gray-100 last:border-0">
                                        <td class="px-4 py-4 font-medium">장학금 신청 기간 연장 공지</td>
                                        <td class="px-4 py-4"><span
                                                class="px-2.5 py-1 text-xs font-medium bg-yellow-50 text-[#FF9500] rounded-md">장학</span>
                                        </td>
                                        <td class="px-4 py-4 text-[#86868B]">관리자</td>
                                        <td class="px-4 py-4 text-[#86868B]">2024-01-14</td>
                                        <td class="px-4 py-4 text-[#86868B]">234</td>
                                        <td class="px-4 py-4 flex justify-end space-x-2">
                                            <button
                                                class="apple-button-secondary px-3 py-1.5 rounded-lg text-xs">수정</button>
                                            <button
                                                class="apple-button-danger px-3 py-1.5 rounded-lg text-xs">삭제</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Statistics -->
                    <div id="content-stats" class="hidden space-y-8">
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                            <!-- User Growth Chart -->
                            <div class="col-span-1 lg:col-span-2">
                                <h3 class="text-xl font-semibold text-[#1D1D1F] mb-4">사용자 증가 추이</h3>
                                <div class="h-80 w-full bg-[#F5F5F7] rounded-2xl p-4">
                                    <canvas id="userGrowthChart"></canvas>
                                </div>
                            </div>

                            <!-- User Stats -->
                            <div>
                                <h3 class="text-xl font-semibold text-[#1D1D1F] mb-4">사용자 통계</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center p-4 bg-[#F5F5F7] rounded-xl">
                                        <span class="text-[#86868B] font-medium">총 회원수</span>
                                        <span class="text-xl font-bold text-[#1D1D1F]">1,247</span>
                                    </div>
                                    <div class="flex justify-between items-center p-4 bg-[#F5F5F7] rounded-xl">
                                        <span class="text-[#86868B] font-medium">활성 회원</span>
                                        <span class="text-xl font-bold text-[#34C759]">892</span>
                                    </div>
                                    <div class="flex justify-between items-center p-4 bg-[#F5F5F7] rounded-xl">
                                        <span class="text-[#86868B] font-medium">금일 신규 가입</span>
                                        <span class="text-xl font-bold text-[#1D1D1F]">12</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Content Stats -->
                            <div>
                                <h3 class="text-xl font-semibold text-[#1D1D1F] mb-4">콘텐츠 통계</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center p-4 bg-[#F5F5F7] rounded-xl">
                                        <span class="text-[#86868B] font-medium">총 강의평가</span>
                                        <span class="text-xl font-bold text-[#1D1D1F]">543</span>
                                    </div>
                                    <div class="flex justify-between items-center p-4 bg-[#F5F5F7] rounded-xl">
                                        <span class="text-[#86868B] font-medium">총 질문</span>
                                        <span class="text-xl font-bold text-[#1D1D1F]">289</span>
                                    </div>
                                    <div class="flex justify-between items-center p-4 bg-[#F5F5F7] rounded-xl">
                                        <span class="text-[#86868B] font-medium">금일 작성된 평가</span>
                                        <span class="text-xl font-bold text-[#AF52DE]">24</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <%@ include file="/view/common/footer.jsp" %>

                <script src="${pageContext.request.contextPath}/assets/scripts/admin.js"></script>
                <script>
                    const contextPath = ${pageContext.request.contextPath}
                </script>
    </body>

    </html>