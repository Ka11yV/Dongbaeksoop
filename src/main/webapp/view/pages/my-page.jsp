<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>마이페이지 - 동백숲</title>
            <link href="${pageContext.request.contextPath}/assets/styles/output.css" rel="stylesheet">
            <link rel="stylesheet" as="style" crossorigin
                href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simple-notify/dist/simple-notify.css" />
            <script src="https://cdn.jsdelivr.net/npm/simple-notify/dist/simple-notify.min.js"></script>
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
                            <button id="tab-profile" onclick="switchTab('profile')"
                                class="w-full py-2.5 text-sm font-bold leading-5 text-primary bg-white rounded-lg shadow transition-all">
                                프로필
                            </button>
                            <button id="tab-reviews" onclick="switchTab('reviews')"
                                class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all">
                                내 평가
                            </button>
                            <button id="tab-account" onclick="switchTab('account')"
                                class="w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all">
                                학교 계정 연동
                            </button>
                        </div>

                        <!-- Profile Section -->
                        <div id="section-profile" class="flex flex-col gap-6">
                            <!-- Profile Card -->
                            <div
                                class="flex flex-col md:flex-row items-center md:items-start gap-6 p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
                                <div class="relative">
                                    <div
                                        class="h-24 w-24 rounded-full bg-blue-50 flex items-center justify-center text-primary text-3xl font-bold border-4 border-white shadow-md">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
                                            viewBox="0 0 24 24">
                                            <g fill="none" stroke="currentColor" stroke-width="2">
                                                <path stroke-linejoin="round"
                                                    d="M4 18a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2Z" />
                                                <circle cx="12" cy="7" r="3" />
                                            </g>
                                        </svg>
                                    </div>
                                </div>

                                <div class="text-center md:text-left flex-1">
                                    <h2 class="text-2xl font-bold text-dark mb-1">${loggedInUser.userId}</h2>
                                    <p class="text-gray-500 mb-4">${loggedInUser.email}</p>
                                    <div class="flex items-center justify-center md:justify-start gap-2">
                                        <span
                                            class="px-3 py-1 rounded-full bg-gray-100 text-xs font-bold text-gray-600">${dept_name}</span>
                                        <span
                                            class="px-3 py-1 rounded-full bg-gray-100 text-xs font-bold text-gray-600">${loggedInUser.grade}학년</span>
                                    </div>
                                </div>

                                <div
                                    class="flex flex-col items-center justify-center p-4 bg-blue-50 rounded-xl min-w-[120px]">
                                    <span class="text-3xl font-bold text-primary mb-1">12</span>
                                    <span class="text-sm font-medium text-blue-600">작성한 평가</span>
                                </div>
                            </div>

                            <!-- Edit Profile Section -->
                            <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm" id="my_info_div">
                                <div class="flex items-center justify-between mb-6 pb-4 border-b border-gray-100">
                                    <h3 class="text-lg font-bold text-dark">프로필 정보</h3>
                                    <button
                                        class="text-sm font-bold text-primary hover:text-secondary transition-colors"
                                        id="updateBtn">수정하기</button>
                                </div>

                                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    <div class="space-y-2">
                                        <label class="text-sm font-bold text-gray-700">전공</label>
                                        <div
                                            class="flex items-center justify-between w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 text-gray-500">
                                            <span id="deptNameSpan">${dept_name}</span>
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
                                            <span id="gradeSpan">${loggedInUser.grade}학년</span>
                                            <svg class="w-5 h-5 text-gray-400" fill="none" viewBox="0 0 24 24"
                                                stroke="currentColor" stroke-width="2">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--수정하기 div--%>
                                <form class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm hidden"
                                    id="edit_div" method="post" action="">
                                    <div class="flex items-center justify-between mb-6 pb-4 border-b border-gray-100">
                                        <h3 class="text-lg font-bold text-dark">프로필 정보</h3>

                                        <div class="flex items-center gap-3">
                                            <button
                                                class="text-sm font-bold text-red-500 hover:text-red-700 transition-colors"
                                                id="cancelBtn">취소하기</button>
                                            <button
                                                class="text-sm font-bold text-green-600 hover:text-green-800 transition-colors"
                                                id="saveBtn">저장하기</button>
                                        </div>
                                    </div>

                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                        <div class="space-y-2">
                                            <label class="text-sm font-bold text-gray-700">전공</label>
                                            <select id="selectDept"
                                                class="appearance-none w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm text-gray-600">
                                                <option value="" selected disabled>학과를 선택하세요</option>
                                                <option value="1">기계공학과</option>
                                                <option value="2">기계설계공학과</option>
                                                <option value="3">자동화공학과</option>
                                                <option value="4">로봇소프트웨어과</option>
                                                <option value="5">전기공학과</option>
                                                <option value="6">반도체전자공학과</option>
                                                <option value="7">정보통신공학과</option>
                                                <option value="8">소방안전관리과</option>
                                                <option value="9">웹응용소프트웨어공학과</option>
                                                <option value="10">컴퓨터소프트웨어공학과</option>
                                                <option value="11">인공지능소프트웨어과</option>
                                                <option value="12">생명화학공학과</option>
                                                <option value="13">바이오융합공학과</option>
                                                <option value="14">건축과</option>
                                                <option value="15">실내건축디자인과</option>
                                                <option value="16">시각디자인과</option>
                                                <option value="17">AR·VR콘텐츠디자인과</option>
                                                <option value="18">경영학과</option>
                                                <option value="19">세무회계학과</option>
                                                <option value="20">유통마케팅학과</option>
                                                <option value="21">호텔관광학과</option>
                                                <option value="22">경영정보학과</option>
                                                <option value="23">빅데이터경영과</option>
                                            </select>
                                        </div>

                                        <div class="space-y-2">
                                            <label class="text-sm font-bold text-gray-700">학년</label>
                                            <select id="selectGrade"
                                                class="appearance-none w-full h-11 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all text-sm text-gray-600">
                                                <option value="1">1학년</option>
                                                <option value="2">2학년</option>
                                                <option value="3">3학년</option>
                                                <option value="4">4학년</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>

                                <!-- Change Password Section -->
                                <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
                                    <h3 class="text-lg font-bold text-dark mb-6">비밀번호 변경</h3>

                                    <form class="space-y-4 max-w-md">
                                        <div class="space-y-2">
                                            <label class="text-sm font-bold text-gray-700">현재 비밀번호</label>
                                            <input type="password" id="currentPwd"
                                                class="w-full h-12 px-4 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all" />
                                        </div>

                                        <div class="space-y-2">
                                            <label class="text-sm font-bold text-gray-700">새 비밀번호</label>
                                            <input type="password" placeholder="8자 이상 입력해주세요" id="newPwd"
                                                class="w-full h-12 px-4 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all placeholder-gray-400" />
                                        </div>

                                        <div class="space-y-2">
                                            <label class="text-sm font-bold text-gray-700">새 비밀번호 확인</label>
                                            <input type="password" id="newPwdCheck"
                                                class="w-full h-12 px-4 bg-white rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all" />
                                        </div>

                                        <div class="pt-2">
                                            <button type="submit" id="changePwd"
                                                class="px-6 py-3 bg-dark text-white font-bold rounded-xl hover:bg-gray-800 transition-colors shadow-lg shadow-gray-900/20">
                                                비밀번호 변경
                                            </button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <!-- Reviews Section (Placeholder) -->
                        <div id="section-reviews" class="hidden">
                            <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm text-center py-20">
                                <div
                                    class="inline-flex h-16 w-16 items-center justify-center rounded-full bg-gray-100 text-gray-400 mb-4">
                                    <svg class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                    </svg>
                                </div>
                                <h3 class="text-lg font-bold text-dark mb-2">작성한 평가가 없습니다</h3>
                                <p class="text-gray-500">수강한 강의에 대한 솔직한 평가를 남겨보세요.</p>
                            </div>
                        </div>

                        <!-- School Account Link Section -->
                        <div id="section-account" class="hidden space-y-6">
                            <div class="mb-2">
                                <h2 class="text-xl font-bold text-dark mb-2">학교 계정 연동</h2>
                                <p class="text-gray-600">학교 포털 계정을 연동하면 과제 자동 조회 기능을 사용할 수 있습니다.</p>
                            </div>

                            <!-- Not Linked State -->
                            <div id="account-not-linked">
                                <div
                                    class="p-4 mb-6 bg-blue-50 border border-blue-100 rounded-xl flex items-start gap-3">
                                    <svg class="w-5 h-5 text-primary mt-0.5 flex-shrink-0" fill="none"
                                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                                    </svg>
                                    <p class="text-sm font-medium text-blue-800">학교 포털 계정을 연동하면 수강 과목의 과제를 자동으로 불러올 수
                                        있습니다.
                                    </p>
                                </div>

                                <div class="p-4 mb-6 bg-green-50 border border-green-100 rounded-xl">
                                    <div class="flex items-center gap-2 mb-2">
                                        <svg class="w-5 h-5 text-green-600" fill="none" viewBox="0 0 24 24"
                                            stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                        <span class="font-bold text-green-800">보안</span>
                                    </div>
                                    <ul class="list-disc pl-5 space-y-1 text-sm text-green-700">
                                        <li>입력하신 비밀번호는 강력한 대칭 암호화 알고리즘(AES-256)을 사용하여 암호화됩니다.</li>
                                        <li>암호화된 정보는 과제 조회에만 사용되며, 언제든지 연동을 해제할 수 있습니다.</li>
                                    </ul>
                                </div>

                                <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
                                    <h3 class="text-lg font-bold text-dark mb-6">포털 계정 연동하기</h3>

                                    <div class="space-y-6">
                                        <div class="space-y-2">
                                            <label class="text-sm font-bold text-gray-700">포털 비밀번호</label>
                                            <div class="relative">
                                                <input type="password" placeholder="비밀번호를 입력하세요"
                                                    class="w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all placeholder-gray-400">
                                                <button
                                                    class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24"
                                                        stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                            d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                            d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>

                                        <button onclick="toggleAccountLink()"
                                            class="w-full h-12 bg-primary hover:bg-secondary text-white font-bold rounded-xl shadow-lg shadow-blue-500/30 transition-all flex items-center justify-center gap-2">
                                            <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                                stroke-width="2">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                                            </svg>
                                            연동하기
                                        </button>

                                        <div class="p-6 bg-blue-50 rounded-xl border border-blue-100">
                                            <h4 class="font-bold text-blue-800 mb-3">연동 후 사용 가능한 기능</h4>
                                            <ul class="space-y-2 text-sm text-blue-700">
                                                <li class="flex items-center gap-2">
                                                    <span class="w-1.5 h-1.5 rounded-full bg-blue-500"></span>
                                                    수강 과목의 과제 자동 조회
                                                </li>
                                                <li class="flex items-center gap-2">
                                                    <span class="w-1.5 h-1.5 rounded-full bg-blue-500"></span>
                                                    과제 마감일 이메일 알림
                                                </li>
                                                <li class="flex items-center gap-2">
                                                    <span class="w-1.5 h-1.5 rounded-full bg-blue-500"></span>
                                                    과제 제출 현황 관리
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Linked State (Hidden by default) -->
                            <div id="account-linked" class="hidden">
                                <div
                                    class="p-6 mb-8 bg-green-50 border border-green-100 rounded-2xl flex items-center gap-4">
                                    <div
                                        class="h-12 w-12 rounded-full bg-green-100 flex items-center justify-center text-green-600 flex-shrink-0">
                                        <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                    </div>
                                    <div>
                                        <h3 class="font-bold text-green-800 text-lg">연동 완료</h3>
                                        <p class="text-green-700">학교 포털 계정이 성공적으로 연동되었습니다</p>
                                    </div>
                                </div>

                                <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm mb-8">
                                    <h3 class="text-lg font-bold text-dark mb-6">연동된 서비스</h3>

                                    <div class="space-y-4">
                                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded-xl">
                                            <div>
                                                <h4 class="font-bold text-dark">과제 자동 조회</h4>
                                                <p class="text-sm text-gray-500">수강 과목의 과제를 자동으로 불러옵니다</p>
                                            </div>
                                            <span
                                                class="px-3 py-1 bg-green-500 text-white text-xs font-bold rounded-full">활성화</span>
                                        </div>

                                        <div class="flex items-center justify-between p-4 bg-gray-50 rounded-xl">
                                            <div>
                                                <h4 class="font-bold text-dark">과제 마감 알림</h4>
                                                <p class="text-sm text-gray-500">설정한 일정에 따라 알림을 받습니다</p>
                                            </div>
                                            <span
                                                class="px-3 py-1 bg-green-500 text-white text-xs font-bold rounded-full">활성화</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="p-8 rounded-2xl bg-white border border-gray-100 shadow-sm">
                                    <h3 class="text-lg font-bold text-dark mb-6">연동 해제</h3>
                                    <p class="text-gray-600 mb-6">학교 계정 연동을 해제하면 과제 자동 조회 및 알림 기능을 사용할 수 없습니다.</p>

                                    <button onclick="toggleAccountLink()"
                                        class="w-full h-12 border border-rose-200 text-rose-500 hover:bg-rose-50 font-bold rounded-xl transition-all">
                                        연동 해제
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <%@ include file="/view/common/footer.jsp" %>
                    <script>
                        function switchTab(tabName) {
                            // Hide all sections
                            document.getElementById('section-profile').classList.add('hidden');
                            document.getElementById('section-reviews').classList.add('hidden');
                            document.getElementById('section-account').classList.add('hidden');

                            // Show selected section
                            document.getElementById('section-' + tabName).classList.remove('hidden');

                            // Reset tab styles
                            const tabs = ['profile', 'reviews', 'account'];
                            tabs.forEach(t => {
                                const btn = document.getElementById('tab-' + t);
                                if (t === tabName) {
                                    btn.className = 'w-full py-2.5 text-sm font-bold leading-5 text-primary bg-white rounded-lg shadow transition-all';
                                } else {
                                    btn.className = 'w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all';
                                }
                            });
                        }

                        function toggleAccountLink() {
                            const notLinked = document.getElementById('account-not-linked');
                            const linked = document.getElementById('account-linked');

                            if (notLinked.classList.contains('hidden')) {
                                notLinked.classList.remove('hidden');
                                linked.classList.add('hidden');
                            } else {
                                notLinked.classList.add('hidden');
                                linked.classList.remove('hidden');
                            }
                        }
                    </script>
                    <script>
                        const contextPath = '${pageContext.request.contextPath}';
                    </script>
                    <script src="${pageContext.request.contextPath}/assets/scripts/my-page.js"></script>
        </body>

        </html>