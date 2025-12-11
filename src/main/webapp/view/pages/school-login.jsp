<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>학교 계정 연동 - 동백숲</title>
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
                        <h1 class="text-3xl md:text-4xl font-bold text-dark mb-3">학교 계정 연동</h1>
                        <p class="text-lg text-gray-600">학교 포털 계정을 연동하면 과제 자동 조회 기능을 사용할 수 있습니다.</p>
                    </div>

                    <!-- Not Linked State (Matching my-page.jsp design) -->
                    <div id="account-not-linked">
                        <div class="p-4 mb-6 bg-blue-50 border border-blue-100 rounded-xl flex items-start gap-3">
                            <svg class="w-5 h-5 text-primary mt-0.5 flex-shrink-0" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                            </svg>
                            <p class="text-sm font-medium text-blue-800">학교 포털 계정을 연동하면 수강 과목의 과제를 자동으로 불러올 수 있습니다.</p>
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

                            <form action="${pageContext.request.contextPath}/assignments" method="POST"
                                class="space-y-6">
                                <div class="space-y-2">
                                    <label for="schoolPassword" class="text-sm font-bold text-gray-700">포털 비밀번호</label>
                                    <div class="relative">
                                        <input type="password" id="schoolPassword" name="schoolPassword" required
                                            placeholder="비밀번호를 입력하세요"
                                            class="w-full h-12 px-4 bg-gray-50 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all placeholder-gray-400">
                                        <button type="button" onclick="togglePassword()"
                                            class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                            <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                                stroke-width="2">
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                                <path stroke-linecap="round" stroke-linejoin="round"
                                                    d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                            </svg>
                                        </button>
                                    </div>
                                    <c:if test="${not empty errorMessage}">
                                        <p class="mt-2 text-sm text-red-500 font-medium">${errorMessage}</p>
                                    </c:if>
                                </div>

                                <button type="submit"
                                    class="w-full h-12 bg-primary hover:bg-secondary text-white font-bold rounded-xl shadow-lg shadow-blue-500/30 transition-all flex items-center justify-center gap-2">
                                    <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
                                    </svg>
                                    연동하기
                                </button>
                            </form>

                            <div class="mt-6 p-6 bg-blue-50 rounded-xl border border-blue-100">
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
            </main>

            <%@ include file="/view/common/footer.jsp" %>

                <script>
                    function togglePassword() {
                        const passwordInput = document.getElementById('schoolPassword');
                        if (passwordInput.type === 'password') {
                            passwordInput.type = 'text';
                        } else {
                            passwordInput.type = 'password';
                        }
                    }
                </script>
    </body>

    </html>