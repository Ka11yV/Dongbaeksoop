<%--
  Created by IntelliJ IDEA.
  User: sergiopear
  Date: 2025. 11. 17.
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" %>

<footer class="w-full bg-gray-900">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 md:py-16">

        <!-- 푸터 콘텐츠 그리드: md 이상 4컬럼, sm 이상 2컬럼, 기본 1컬럼 -->
        <div class="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-4 gap-8 md:gap-12 lg:gap-24">

            <!-- 1. 동백숲 소개 -->
            <div class="col-span-2 md:col-span-1 flex flex-col space-y-4">
                <h3 class="text-white text-lg font-medium">동백숲</h3>
                <div class="text-gray-300 text-sm font-normal space-y-0.5">
                    <p>동양미래대 학생들을 위한</p>
                    <p>강의 평가 및 맞춤형 공지 알림 서비스</p>
                </div>
            </div>

            <!-- 2. 바로가기 링크 -->
            <div class="flex flex-col space-y-4">
                <h4 class="text-white text-base font-normal">바로가기</h4>
                <nav class="flex flex-col space-y-2 text-sm">
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">강의평가</a>
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">Q&A</a>
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">공지사항</a>
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">구독 관리</a>
                </nav>
            </div>

            <!-- 3. 지원 링크 -->
            <div class="flex flex-col space-y-4">
                <h4 class="text-white text-base font-normal">지원</h4>
                <nav class="flex flex-col space-y-2 text-sm">
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">설정</a>
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">이용약관</a>
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">개인정보처리방침</a>
                    <a href="#" class="text-gray-300 hover:text-sky-400 transition">문의하기</a>
                </nav>
            </div>

            <!-- 4. 문의 정보 -->
            <div class="flex flex-col space-y-4">
                <h4 class="text-white text-base font-normal">문의</h4>
                <address class="not-italic flex flex-col space-y-2 text-sm text-gray-300">
                    <p>동양미래대학교</p>
                    <p>서울특별시 구로구 경인로 445</p>
                    <a href="mailto:support@dongyang.ac.kr" class="hover:text-sky-400 transition">support@dongyang.ac.kr</a>
                </address>
            </div>
        </div>

        <!-- 저작권 및 카피라이트 섹션 -->
        <div class="mt-8 pt-6 border-t border-gray-800 text-center">
            <p class="text-gray-300 text-sm font-normal">
                © 2025 동백숲. All rights reserved.
            </p>
        </div>
    </div>
</footer>