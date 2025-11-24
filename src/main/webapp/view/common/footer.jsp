<%@ page pageEncoding="UTF-8" %>
<footer class="bg-dark text-white pt-16 pb-8">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-12 mb-12">
            <div class="col-span-1 md:col-span-1">
                <span class="text-2xl font-bold text-white tracking-tighter mb-4 block">동백숲</span>
                <p class="text-gray-400 text-sm leading-relaxed">
                    동양미래대학교 학생들을 위한<br>
                    스마트 캠퍼스 라이프 플랫폼
                </p>
            </div>

            <div>
                <h5 class="text-lg font-semibold mb-4 text-gray-100">서비스</h5>
                <ul class="space-y-2 text-gray-400">
                    <li><a href="${pageContext.request.contextPath}/notice-subscription-management"
                           class="hover:text-primary transition-colors">공지 구독</a></li>
                    <li><a href="${pageContext.request.contextPath}/assignments"
                           class="hover:text-primary transition-colors">과제 알림</a></li>
                    <li><a href="${pageContext.request.contextPath}/lecture-reviews"
                           class="hover:text-primary transition-colors">강의 평가</a></li>
                </ul>
            </div>

            <div>
                <h5 class="text-lg font-semibold mb-4 text-gray-100">지원</h5>
                <ul class="space-y-2 text-gray-400">
                    <li><a href="#" class="hover:text-primary transition-colors">자주 묻는 질문</a></li>
                    <li><a href="#" class="hover:text-primary transition-colors">문의하기</a></li>
                    <li><a href="#" class="hover:text-primary transition-colors">버그 제보</a></li>
                </ul>
            </div>

            <div>
                <h5 class="text-lg font-semibold mb-4 text-gray-100">관련 사이트</h5>
                <ul class="space-y-2 text-gray-400">
                    <li><a href="https://www.dongyang.ac.kr" target="_blank"
                           class="hover:text-primary transition-colors">동양미래대학교</a></li>
                    <li><a href="https://portal.dongyang.ac.kr" target="_blank"
                           class="hover:text-primary transition-colors">포털 시스템</a></li>
                    <li><a href="https://lib.dongyang.ac.kr" target="_blank"
                           class="hover:text-primary transition-colors">도서관</a></li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 pt-8 flex flex-col md:flex-row justify-between items-center justify-center gap-3">
            <p class="text-gray-500 text-sm mb-4 md:mb-0">
                &copy; 2024 동백숲. All rights reserved.
            </p>
            <div class="flex space-x-6">
                <a href="https://github.com/Ka11yV/Dongbaeksoop" class="text-gray-400 hover:text-white transition-colors">
                    <span class="sr-only">GitHub</span>
                    <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                        <path fill-rule="evenodd"
                              d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                              clip-rule="evenodd" />
                    </svg>
                </a>
            </div>
        </div>
    </div>
</footer>