<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
    <title>동백숲</title>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>
    <main class="container mx-auto mt-12 px-4 max-w-4xl">

        <!-- 1. 섹션 타이틀 블록 (유연한 Flexbox) -->
        <div class="flex flex-col gap-2 mb-8">
            <div class="inline-flex items-center gap-3">
                <!-- Icon Block (SVG 단순화 및 Flexbox 정렬) -->
                <div class="flex size-10 items-center justify-center rounded-[10px] bg-sky-700/10">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.268 21a2 2 0 0 0 3.464 0m-10.47-5.674A1 1 0 0 0 4 17h16a1 1 0 0 0 .74-1.673C19.41 13.956 18 12.499 18 8A6 6 0 0 0 6 8c0 4.499-1.411 5.956-2.738 7.326" /></svg>
                </div>
                <!-- Title Text -->
                <h1 class="text-4xl leading-10 font-normal tracking-tight text-neutral-950">공지사항</h1>
            </div>
            <!-- Subtitle -->
            <p class="text-base leading-6 font-normal text-gray-600">학교 및 학과 공지사항을 확인하세요</p>
        </div>

        <!-- 2. 선택 컴포넌트 컨테이너 (유연한 Grid) -->
        <!-- w-full max-w-[512px]: 너비를 최대로 하되, 최대 512px로 제한 -->
        <div id="tab-container" class="w-full max-w-[512px] h-9 bg-gray-200 rounded-2xl p-1 grid grid-cols-3 gap-1 mb-8">

            <!-- 탭 항목들은 Grid의 자식으로 배치되어 유연하게 공간을 나눕니다. -->

            <!-- 항목 1: 대학 공지 (absolute 제거) -->
            <div data-index="0" class="tab-item flex justify-center items-center h-full rounded-xl bg-white
                                  outline outline-1 outline-offset-[-1px] outline-black/10
                                  cursor-pointer transition duration-200">
                <span class="text-sm font-medium leading-5 text-neutral-950">대학 공지</span>
            </div>

            <!-- 항목 2: 학과 공지 (absolute 제거) -->
            <div data-index="1" class="tab-item flex justify-center items-center h-full rounded-xl
                                  outline outline-1 outline-offset-[-1px] outline-black/10
                                  cursor-pointer transition duration-200">
                <span class="text-sm font-medium leading-5 text-neutral-950">학과 공지</span>
            </div>

            <!-- 항목 3: 구독 공지 (absolute 제거) -->
            <div data-index="2" class="tab-item flex justify-center items-center h-full rounded-xl
                                  outline outline-1 outline-offset-[-1px] outline-black/10
                                  cursor-pointer transition duration-200">
                <span class="text-sm font-medium leading-5 text-neutral-950">구독 공지</span>
            </div>

        </div> <!-- tab-container 끝 -->

        <!-- 3. 공지사항 목록 컨테이너 (유연한 Flexbox) -->
        <!-- w-full: 부모 요소의 너비를 가득 채움 | h-[676px] 고정 높이를 flex-col과 gap-7으로 대체 -->
        <div class="flex flex-col w-full items-start justify-start gap-7 rounded-2xl bg-white p-6 outline outline-1 outline-offset-[-1px] outline-black/10">

            <!-- 목록 헤더 (전체 너비 사용) -->
            <div class="inline-flex w-full items-center justify-between">
                <div class="text-base leading-6 font-normal text-neutral-950">전체 공지사항</div>
                <div class="text-sm leading-5 font-normal text-gray-600">총 5건</div>
            </div>

            <!-- 리스트 항목 컨테이너 (W-full, Flexbox) -->
            <div class="flex w-full flex-col items-start justify-start gap-2">

                <!-- List Item 1 (absolute 제거, W-full, Flexbox) -->
                <div class="inline-flex w-full h-28 items-center justify-between gap-4 rounded-[10px] px-4 outline outline-1 outline-offset-[-1px] outline-black/10 hover:bg-gray-50 cursor-pointer">
                    <div class="inline-flex h-20 flex-1 flex-col items-start justify-start gap-1">
                        <div class="inline-flex h-5 items-center justify-start gap-2">
                            <div class="flex h-5 w-12 items-center justify-center gap-1 rounded-lg bg-sky-700 px-2 py-0.5">
                                <div class="text-xs leading-4 font-medium text-white">NEW</div>
                            </div>
                            <div class="flex h-5 w-10 items-center justify-center gap-1 rounded-lg px-2 py-0.5 border border-gray-200">
                                <div class="text-xs leading-4 font-medium text-neutral-950">학사</div>
                            </div>
                        </div>
                        <div class="text-base leading-6 font-normal text-neutral-950 mt-1">2025학년도 1학기 수강신청 안내</div>
                        <div class="text-sm leading-5 font-normal text-gray-600">2025.11.10</div>
                    </div>
                    <!-- Arrow Icon (단순화 및 Flex 정렬) -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m9 18l6-6l-6-6"/></svg>
                </div>

                <!-- List Item 2 -->
                <div class="inline-flex w-full h-28 items-center justify-between gap-4 rounded-[10px] px-4 outline outline-1 outline-offset-[-1px] outline-black/10 hover:bg-gray-50 cursor-pointer">
                    <div class="inline-flex h-20 flex-1 flex-col items-start justify-start gap-1">
                        <div class="inline-flex h-5 items-center justify-start gap-2">
                            <div class="flex h-5 w-12 items-center justify-center gap-1 rounded-lg bg-sky-700 px-2 py-0.5">
                                <div class="text-xs leading-4 font-medium text-white">NEW</div>
                            </div>
                            <div class="flex h-5 w-10 items-center justify-center gap-1 rounded-lg px-2 py-0.5 border border-gray-200">
                                <div class="text-xs leading-4 font-medium text-neutral-950">장학</div>
                            </div>
                        </div>
                        <div class="text-base leading-6 font-normal text-neutral-950 mt-1">장학금 신청 기간 연장 공지</div>
                        <div class="text-sm leading-5 font-normal text-gray-600">2025.11.09</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m9 18l6-6l-6-6"/></svg>
                </div>

                <!-- List Item 3 -->
                <div class="inline-flex w-full h-28 items-center justify-between gap-4 rounded-[10px] px-4 outline outline-1 outline-offset-[-1px] outline-black/10 hover:bg-gray-50 cursor-pointer">
                    <div class="inline-flex h-20 flex-1 flex-col items-start justify-start gap-1">
                        <div class="inline-flex h-5 items-center justify-start gap-2">
                            <div class="flex h-5 w-10 items-center justify-center gap-1 rounded-lg px-2 py-0.5 border border-gray-200">
                                <div class="text-xs leading-4 font-medium text-neutral-950">채용</div>
                            </div>
                        </div>
                        <div class="text-base leading-6 font-normal text-neutral-950 mt-1">2025 취업박람회 개최 안내</div>
                        <div class="text-sm leading-5 font-normal text-gray-600">2025.11.08</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m9 18l6-6l-6-6"/></svg>
                </div>

                <!-- List Item 4 -->
                <div class="inline-flex w-full h-28 items-center justify-between gap-4 rounded-[10px] px-4 outline outline-1 outline-offset-[-1px] outline-black/10 hover:bg-gray-50 cursor-pointer">
                    <div class="inline-flex h-20 flex-1 flex-col items-start justify-start gap-1">
                        <div class="inline-flex h-5 items-center justify-start gap-2">
                            <div class="flex h-5 w-10 items-center justify-center gap-1 rounded-lg px-2 py-0.5 border border-gray-200">
                                <div class="text-xs leading-4 font-medium text-neutral-950">행사</div>
                            </div>
                        </div>
                        <div class="text-base leading-6 font-normal text-neutral-950 mt-1">학생회 주최 축제 프로그램 안내</div>
                        <div class="text-sm leading-5 font-normal text-gray-600">2025.11.07</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m9 18l6-6l-6-6"/></svg>
                </div>

                <!-- List Item 5 -->
                <div class="inline-flex w-full h-28 items-center justify-between gap-4 rounded-[10px] px-4 outline outline-1 outline-offset-[-1px] outline-black/10 hover:bg-gray-50 cursor-pointer">
                    <div class="inline-flex h-20 flex-1 flex-col items-start justify-start gap-1">
                        <div class="inline-flex h-5 items-center justify-start gap-2">
                            <div class="flex h-5 w-10 items-center justify-center gap-1 rounded-lg px-2 py-0.5 border border-gray-200">
                                <div class="text-xs leading-4 font-medium text-neutral-950">일반</div>
                            </div>
                        </div>
                        <div class="text-base leading-6 font-normal text-neutral-950 mt-1">도서관 열람실 이용시간 변경 안내</div>
                        <div class="text-sm leading-5 font-normal text-gray-600">2025.11.06</div>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-gray-400" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m9 18l6-6l-6-6"/></svg>
                </div>

                <!-- Pagination (예시) -->
                <div class="w-full flex justify-center mt-4">
                    <span class="text-sm text-gray-500">페이지네이션 위치</span>
                </div>

            </div>
        </div>
    </main>
<%@ include file="/views/common/footer.jsp"%>
</body>
</html>
