<%@ page pageEncoding="UTF-8" %>

<footer class="w-full bg-gray-900">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 md:py-16">
        <div class="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-4 gap-8 md:gap-12 lg:gap-24">

            <!-- 동백숲 소개 -->
            <div class="col-span-2 md:col-span-1 flex flex-col space-y-4">
                <h3 class="text-white text-lg font-medium">동백숲</h3>
                <div class="text-gray-300 text-sm font-normal space-y-0.5">
                    <p>동양미래대 학생들을 위한</p>
                    <p>강의 평가 및 맞춤형 공지 알림 서비스</p>
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

            <!-- 바로가기 링크 -->
            <div class="flex flex-col space-y-4">
                <h4 class="text-white text-base font-normal">바로가기</h4>
                <nav class="flex flex-col space-y-2 text-sm">
                    <a href="${pageContext.request.contextPath}/lecture-reviews" class="text-gray-300 hover:text-sky-400 transition">강의평가</a>
                    <a href="${pageContext.request.contextPath}/assignments" class="text-gray-300 hover:text-sky-400 transition">과제</a>
                    <a href="${pageContext.request.contextPath}/notifications" class="text-gray-300 hover:text-sky-400 transition">공지사항</a>
                    <a href="${pageContext.request.contextPath}/notice-subscription-management" class="text-gray-300 hover:text-sky-400 transition">구독 관리</a>
                </nav>
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

            <div class="border-t border-gray-800 pt-8 flex flex-col md:flex-row justify-between items-center">
                <p class="text-gray-500 text-sm mb-4 md:mb-0">
                    &copy; 2024 동백숲. All rights reserved.
                </p>
                <div class="flex space-x-6">
                    <a href="#" class="text-gray-400 hover:text-white transition-colors">
                        <span class="sr-only">Instagram</span>
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path fill-rule="evenodd"
                                d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772 4.902 4.902 0 011.772-1.153c.636-.247 1.363-.416 2.427-.465C9.673 2.013 10.03 2 12.48 2h-.165zm-3.77 1.733c-1.43.065-2.208.333-2.727.534-.686.27-1.175.59-1.693 1.109-.518.518-.839 1.006-1.11 1.693-.2.519-.469 1.297-.533 2.726-.066 1.45-.074 1.91-.074 4.398 0 2.488.008 2.948.074 4.398.064 1.429.333 2.208.533 2.726.27.687.591 1.175 1.11 1.693.518.518 1.006.839 1.693 1.11.519.2 1.297.469 2.727.533 1.45.066 1.91.074 4.398.074 2.488 0 2.948-.008 4.398-.074 1.429-.064 2.208-.333 2.726-.533.687-.27 1.175-.591 1.693-1.11.518-.518.839-1.006 1.11-1.693.2-.519.469-1.297.533-2.727.065-1.45.074-1.91.074-4.398 0-2.488-.008-2.948-.074-4.398-.064-1.429-.333-2.208-.533-2.727-.27-.686-.591-1.175-1.11-1.693-.518-.518-1.006-.839-1.693-1.11-.519-.2-1.297-.469-2.727-.533C15.293 3.71 14.833 3.7 12.345 3.7h.08zm3.238 6.49A2.596 2.596 0 0114.495 12a2.596 2.596 0 01-2.595 2.596 2.596 2.596 0 01-2.596-2.596 2.596 2.596 0 012.596-2.595zm0-1.733a4.329 4.329 0 100 8.658 4.329 4.329 0 000-8.658zm5.34-1.676a1.153 1.153 0 11-2.306 0 1.153 1.153 0 012.306 0z"
                                clip-rule="evenodd" />
                        </svg>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition-colors">
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