<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>강의 평가 상세 - 동백숲</title>
            <link href="${pageContext.request.contextPath}/assets/styles/output.css" rel="stylesheet">
            <link rel="stylesheet" as="style" crossorigin
                href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
            <style>
            </style>
        </head>

        <body class="antialiased">
            <%@ include file="/view/common/header.jsp" %>

                <main class="pt-24 pb-12 min-h-screen">
                    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
                        <div class="flex flex-col lg:flex-row gap-8">
                            <!-- Left Column: Lecture Info -->
                            <div class="lg:w-1/3 space-y-6">
                                <!-- Added max-h and overflow-y-auto to ensure button is accessible on smaller screens -->
                                <div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-8 sticky top-24">
                                    <!-- Lecture Header -->
                                    <div class="mb-6">
                                        <span
                                            class="inline-block px-2.5 py-1 rounded-lg bg-blue-50 text-primary text-xs font-bold mb-2">${currentLectureDetail.courseType}</span>
                                        <h1 class="text-2xl font-bold text-dark mb-1">
                                            ${currentLectureDetail.lectureName}</h1>
                                        <div class="text-gray-500 text-sm">
                                            <span>${currentLectureDetail.professorName}</span>
                                            <span class="mx-1">·</span>
                                            <span>${currentLectureDetail.deptName}</span>
                                        </div>
                                    </div>

                                    <div class="border-t border-gray-100 my-6"></div>

                                    <!-- Total Rating -->
                                    <div class="text-center mb-8">
                                        <div class="flex items-end justify-center gap-1 mb-2">
                                            <span class="text-5xl font-bold text-primary">4.5</span>
                                            <span class="text-xl text-gray-400 mb-1">/5.0</span>
                                        </div>
                                        <div class="flex justify-center gap-1 text-yellow-400 mb-2">
                                            <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                            </svg>
                                            <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                            </svg>
                                            <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                            </svg>
                                            <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                            </svg>
                                            <svg class="w-5 h-5 fill-current text-gray-300" viewBox="0 0 20 20">
                                                <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                            </svg>
                                        </div>
                                        <p class="text-sm text-gray-500">12개의 리뷰</p>
                                    </div>

                                    <!-- Rating Bars -->
                                    <div class="space-y-2 mb-8">
                                        <div class="flex items-center gap-3 text-sm">
                                            <span class="w-6 font-medium text-gray-600">5점</span>
                                            <div class="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
                                                <div class="h-full bg-primary rounded-full" style="width: 50%"></div>
                                            </div>
                                            <span class="w-6 text-right text-gray-400">6</span>
                                        </div>
                                        <div class="flex items-center gap-3 text-sm">
                                            <span class="w-6 font-medium text-gray-600">4점</span>
                                            <div class="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
                                                <div class="h-full bg-primary rounded-full" style="width: 33%"></div>
                                            </div>
                                            <span class="w-6 text-right text-gray-400">4</span>
                                        </div>
                                        <div class="flex items-center gap-3 text-sm">
                                            <span class="w-6 font-medium text-gray-600">3점</span>
                                            <div class="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
                                                <div class="h-full bg-primary rounded-full" style="width: 8%"></div>
                                            </div>
                                            <span class="w-6 text-right text-gray-400">1</span>
                                        </div>
                                        <div class="flex items-center gap-3 text-sm">
                                            <span class="w-6 font-medium text-gray-600">2점</span>
                                            <div class="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
                                                <div class="h-full bg-primary rounded-full" style="width: 8%"></div>
                                            </div>
                                            <span class="w-6 text-right text-gray-400">1</span>
                                        </div>
                                        <div class="flex items-center gap-3 text-sm">
                                            <span class="w-6 font-medium text-gray-600">1점</span>
                                            <div class="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
                                                <div class="h-full bg-primary rounded-full" style="width: 0%"></div>
                                            </div>
                                            <span class="w-6 text-right text-gray-400">0</span>
                                        </div>
                                    </div>

                                    <!-- Detailed Averages -->
                                    <div class="space-y-3 mb-8">
                                        <h3 class="text-sm font-bold text-gray-900">평균 평가</h3>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-gray-600">강의 내용</span>
                                            <span class="font-bold text-primary">4.5</span>
                                        </div>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-gray-600">난이도</span>
                                            <span class="font-bold text-primary">3.5</span>
                                        </div>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-gray-600">과제량</span>
                                            <span class="font-bold text-primary">4.0</span>
                                        </div>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-gray-600">성적 관대함</span>
                                            <span class="font-bold text-primary">4.5</span>
                                        </div>
                                    </div>

                                    <button onclick="openModal()"
                                        class="w-full py-3 bg-primary hover:bg-secondary text-white font-bold rounded-xl shadow-lg shadow-blue-500/30 transition-all flex items-center justify-center gap-2">
                                        <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                            stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                                        </svg>
                                        리뷰 작성하기
                                    </button>
                                </div>
                            </div>

                            <!-- Right Column: Review List -->
                            <div class="lg:w-2/3">
                                <!-- Header -->
                                <div class="flex items-center justify-between mb-6">
                                    <h2 class="text-xl font-bold text-dark flex items-center gap-2">
                                        <svg class="w-6 h-6 text-primary" fill="none" viewBox="0 0 24 24"
                                            stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                                        </svg>
                                        전체 리뷰
                                    </h2>
                                    <div class="relative">
                                        <select
                                            class="appearance-none bg-gray-100 border border-gray-200 text-gray-700 py-2 pl-4 pr-8 rounded-lg text-sm font-medium focus:outline-none focus:ring-2 focus:ring-primary/50">
                                            <option>최신순</option>
                                            <option>평점 높은순</option>
                                            <option>평점 낮은순</option>
                                            <option>공감순</option>
                                        </select>
                                        <div
                                            class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-500">
                                            <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                    d="M19 9l-7 7-7-7" />
                                            </svg>
                                        </div>
                                    </div>
                                </div>

                                <!-- Review Cards -->
                                <div class="space-y-6">
                                    <c:forEach var="review" items="${reviewList}">
                                        <div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
                                            <div class="flex justify-between items-start mb-4">
                                                <div class="flex items-center gap-2">
                                                    <div class="flex text-yellow-400">
                                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                            <path
                                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                        </svg>
                                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                            <path
                                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                        </svg>
                                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                            <path
                                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                        </svg>
                                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                            <path
                                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                        </svg>
                                                        <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                            <path
                                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                        </svg>
                                                    </div>
                                                    <span class="font-bold text-primary text-lg">${review.rating}</span>
                                                    <span class="text-gray-300 mx-1">|</span>
                                                    <span class="text-gray-500 text-sm">익명</span>
                                                    <span class="text-gray-300 mx-1">·</span>
                                                    <span class="text-gray-400 text-sm">${review.}</span>
                                                </div>
                                                <span
                                                        class="px-2 py-1 rounded-md border border-gray-200 text-xs font-bold text-gray-500">2024-2</span>
                                            </div>

                                            <p class="text-gray-700 leading-relaxed mb-4">
                                                과제는 많지만 배울 것이 많은 수업입니다. 실습 위주로 진행되어 실력 향상에 도움이 됩니다. HTML, CSS, JavaScript부터
                                                React까지 전반적인 웹 개발 스택을 배울 수 있어요.
                                            </p>

                                            <div class="flex flex-wrap gap-2 mb-6">
                                            <span
                                                    class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">난이도
                                                보통</span>
                                                <span
                                                        class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">과제
                                                많음</span>
                                                <span
                                                        class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">팀플
                                                있음</span>
                                                <span
                                                        class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">학점
                                                너그러움</span>
                                                <span
                                                        class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">출결
                                                전자출결</span>
                                            </div>

                                            <div class="flex justify-between items-center pt-4 border-t border-gray-50">
                                                <button
                                                        class="flex items-center gap-1.5 text-gray-500 hover:text-rose-500 transition-colors group">
                                                    <svg class="w-5 h-5 group-hover:fill-rose-50" fill="none"
                                                         viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                                    </svg>
                                                    <span class="text-sm font-medium">공감 24</span>
                                                </button>
                                                <button
                                                        class="flex items-center gap-1 text-gray-400 hover:text-gray-600 transition-colors">
                                                    <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                                                         stroke="currentColor" stroke-width="2">
                                                        <path stroke-linecap="round" stroke-linejoin="round"
                                                              d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.398 16c-.77 1.333.192 3 1.732 3z" />
                                                    </svg>
                                                    <span class="text-xs font-medium">신고</span>
                                                </button>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- Review 1 -->


                                    <!-- Review 2 -->
                                    <div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
                                        <div class="flex justify-between items-start mb-4">
                                            <div class="flex items-center gap-2">
                                                <div class="flex text-yellow-400">
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current text-gray-300" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                </div>
                                                <span class="font-bold text-primary text-lg">4.5</span>
                                                <span class="text-gray-300 mx-1">|</span>
                                                <span class="text-gray-500 text-sm">익명</span>
                                                <span class="text-gray-300 mx-1">·</span>
                                                <span class="text-gray-400 text-sm">2025.11.10</span>
                                            </div>
                                            <span
                                                class="px-2 py-1 rounded-md border border-gray-200 text-xs font-bold text-gray-500">2024-2</span>
                                        </div>

                                        <p class="text-gray-700 leading-relaxed mb-4">
                                            교수님께서 질문에 친절하게 답변해주시고, 실무 경험도 많이 공유해주셔서 좋았습니다. 다만 과제량이 많아서 다른 수업과 병행하기는 조금
                                            힘들었어요.
                                        </p>

                                        <div class="flex flex-wrap gap-2 mb-6">
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">난이도
                                                보통</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">과제
                                                많음</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">팀플
                                                있음</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">학점
                                                보통</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">출결
                                                전자출결</span>
                                        </div>

                                        <div class="flex justify-between items-center pt-4 border-t border-gray-50">
                                            <button
                                                class="flex items-center gap-1.5 text-gray-500 hover:text-rose-500 transition-colors group">
                                                <svg class="w-5 h-5 group-hover:fill-rose-50" fill="none"
                                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                                </svg>
                                                <span class="text-sm font-medium">공감 18</span>
                                            </button>
                                            <button
                                                class="flex items-center gap-1 text-gray-400 hover:text-gray-600 transition-colors">
                                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                                                    stroke="currentColor" stroke-width="2">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.398 16c-.77 1.333.192 3 1.732 3z" />
                                                </svg>
                                                <span class="text-xs font-medium">신고</span>
                                            </button>
                                        </div>
                                    </div>

                                    <!-- Review 3 -->
                                    <div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
                                        <div class="flex justify-between items-start mb-4">
                                            <div class="flex items-center gap-2">
                                                <div class="flex text-yellow-400">
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                    <svg class="w-5 h-5 fill-current text-gray-300" viewBox="0 0 20 20">
                                                        <path
                                                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                                    </svg>
                                                </div>
                                                <span class="font-bold text-primary text-lg">4.0</span>
                                                <span class="text-gray-300 mx-1">|</span>
                                                <span class="text-gray-500 text-sm">익명</span>
                                                <span class="text-gray-300 mx-1">·</span>
                                                <span class="text-gray-400 text-sm">2025.11.05</span>
                                            </div>
                                            <span
                                                class="px-2 py-1 rounded-md border border-gray-200 text-xs font-bold text-gray-500">2024-1</span>
                                        </div>

                                        <p class="text-gray-700 leading-relaxed mb-4">
                                            실습 위주라 재미있게 배웠습니다. 기초부터 차근차근 설명해주셔서 이해하기 쉬웠어요. 프로젝트가 포트폴리오로 쓸 만해요.
                                        </p>

                                        <div class="flex flex-wrap gap-2 mb-6">
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">난이도
                                                쉬움</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">과제
                                                보통</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">팀플
                                                있음</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">학점
                                                너그러움</span>
                                            <span
                                                class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">출결
                                                직접호명</span>
                                        </div>

                                        <div class="flex justify-between items-center pt-4 border-t border-gray-50">
                                            <button
                                                class="flex items-center gap-1.5 text-gray-500 hover:text-rose-500 transition-colors group">
                                                <svg class="w-5 h-5 group-hover:fill-rose-50" fill="none"
                                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                                </svg>
                                                <span class="text-sm font-medium">공감 15</span>
                                            </button>
                                            <button
                                                class="flex items-center gap-1 text-gray-400 hover:text-gray-600 transition-colors">
                                                <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24"
                                                    stroke="currentColor" stroke-width="2">
                                                    <path stroke-linecap="round" stroke-linejoin="round"
                                                        d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.398 16c-.77 1.333.192 3 1.732 3z" />
                                                </svg>
                                                <span class="text-xs font-medium">신고</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>

                <!-- Write Review Modal -->
                <div id="reviewModalBackdrop"
                    class="fixed inset-0 bg-slate-900/40 backdrop-blur-sm z-40 hidden transition-opacity duration-300 opacity-0"
                    onclick="closeModal()"></div>
                <div id="reviewModal"
                    class="fixed left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-full max-w-2xl bg-white rounded-3xl shadow-2xl z-50 hidden transition-all duration-300 opacity-0 scale-95 max-h-[85vh] overflow-y-auto">
                    <div class="p-6">
                        <div class="flex justify-between items-center mb-8">
                            <h2 class="text-2xl font-bold text-dark">강의 리뷰 작성</h2>
                            <button onclick="closeModal()"
                                class="p-2 hover:bg-gray-100 rounded-full transition-colors text-gray-400 hover:text-gray-600">
                                <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </button>
                        </div>

                        <form method="post" action="${pageContext.request.contextPath}/lecture-review-detail"
                            class="space-y-6">
                            <!-- Semester Selection -->
                            <div>
                                <label class="block text-sm font-medium text-dark mb-2">수강 학기</label>
                                <div class="relative">
                                    <label>
                                        <select
                                            class="appearance-none w-full px-4 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary text-gray-700 font-medium transition-all">
                                            <option>2024년 2학기</option>
                                            <option>2024년 1학기</option>
                                            <option>2023년 2학기</option>
                                            <option>2023년 1학기</option>
                                        </select>
                                        <input type="text" id="semester" name="semester" class="hidden">
                                    </label>
                                    <div
                                        class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
                                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg"
                                            viewBox="0 0 20 20">
                                            <path
                                                d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>

                            <!-- Star Rating -->
                            <div>
                                <label class="block text-sm font-medium text-dark mb-2">총점</label>
                                <div class="flex gap-2">
                                    <button type="button"
                                        class="star-btn group transform transition-transform active:scale-95"
                                        onclick="setRating(1)">
                                        <svg class="w-10 h-10 text-gray-200 fill-current group-hover:text-yellow-400 transition-colors"
                                            viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                        </svg>
                                    </button>
                                    <button type="button"
                                        class="star-btn group transform transition-transform active:scale-95"
                                        onclick="setRating(2)">
                                        <svg class="w-10 h-10 text-gray-200 fill-current group-hover:text-yellow-400 transition-colors"
                                            viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                        </svg>
                                    </button>
                                    <button type="button"
                                        class="star-btn group transform transition-transform active:scale-95"
                                        onclick="setRating(3)">
                                        <svg class="w-10 h-10 text-gray-200 fill-current group-hover:text-yellow-400 transition-colors"
                                            viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                        </svg>
                                    </button>
                                    <button type="button"
                                        class="star-btn group transform transition-transform active:scale-95"
                                        onclick="setRating(4)">
                                        <svg class="w-10 h-10 text-gray-200 fill-current group-hover:text-yellow-400 transition-colors"
                                            viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                        </svg>
                                    </button>
                                    <button type="button"
                                        class="star-btn group transform transition-transform active:scale-95"
                                        onclick="setRating(5)">
                                        <svg class="w-10 h-10 text-gray-200 fill-current group-hover:text-yellow-400 transition-colors"
                                            viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                                        </svg>
                                    </button>
                                    <input type="text" id="rating" name="rating" class="hidden">
                                </div>
                            </div>

                            <!-- Detailed Criteria -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Difficulty -->
                                <div>
                                    <label class="block text-sm font-medium text-dark mb-2">난이도</label>
                                    <div class="flex gap-2" id="difficultyBtnGroup">
                                        <button type="button" data-value="easy"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">쉬움</button>
                                        <button type="button" data-value="normal"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">보통</button>
                                        <button type="button" data-value="hard"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">어려움</button>
                                    </div>
                                    <input type="text" id="difficulty" name="difficulty" class="hidden">
                                </div>
                                <!-- Homework -->
                                <div>
                                    <label class="block text-sm font-medium text-dark mb-2">과제량</label>
                                    <div class="flex gap-2" id="workloadBtnGroup">
                                        <button type="button" data-value="none"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">없음</button>
                                        <button type="button" data-value="normal"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">보통</button>
                                        <button type="button" data-value="heavy"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">많음</button>
                                    </div>
                                    <input type="text" id="workload" name="workload" class="hidden">
                                </div>
                                <!-- Team Project -->
                                <div>
                                    <label class="block text-sm font-medium text-dark mb-2">팀플</label>
                                    <div class="flex gap-2" id="team_projectBtnGroup">
                                        <button type="button" data-value="notExist"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">없음</button>
                                        <button type="button" data-value="exist"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">있음</button>
                                    </div>
                                    <input type="text" id="team_project" name="team_project" class="hidden">
                                </div>
                                <!-- Grade -->
                                <div>
                                    <label class="block text-sm font-medium text-dark mb-2">출결방식</label>
                                    <div class="flex gap-2" id="attendance_methodBtnGroup">
                                        <button type="button" data-value="electronic"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">전자출결</button>
                                        <button type="button" data-value="Handwritten"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">수기</button>
                                        <button type="button" data-value="notCheck"
                                            class="flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all">체크X</button>
                                    </div>
                                    <input type="text" id="attendance_method" name="attendance_method" class="hidden">
                                </div>
                            </div>

                            <!-- Review Text -->
                            <div>
                                <label class="block text-sm font-medium text-dark mb-2">총평</label>
                                <textarea id="content" name="content"
                                    class="w-full h-32 px-4 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary text-gray-700 resize-none transition-all placeholder-gray-400"
                                    placeholder="이 강의에 대한 솔직한 리뷰를 남겨주세요. (최소 20자 이상)"></textarea>
                            </div>

                            <!-- Buttons -->
                            <div class="flex gap-3 pt-4">
                                <button type="button" onclick="closeModal()"
                                    class="flex-1 py-4 rounded-xl bg-white border border-gray-200 text-gray-600 font-bold hover:bg-gray-50 hover:border-gray-300 transition-all">취소</button>
                                <button type="submit"
                                    class="flex-1 py-4 rounded-xl bg-primary text-white font-bold hover:bg-secondary shadow-lg shadow-blue-500/30 hover:shadow-blue-500/40 transition-all transform hover:-translate-y-0.5">리뷰
                                    등록하기</button>
                            </div>

                            <input value="${currentLectureDetail.lectureId}" name="lectureId" class="hidden">
                            <input value="${currentLectureDetail.professorId}" name="professorId" class="hidden">
                            <input value="${currentLectureDetail.deptName}" name="deptName" class="hidden">
                        </form>
                    </div>
                </div>

                <%@ include file="/view/common/footer.jsp" %>

                    <script
                        src="${pageContext.request.contextPath}/assets/scripts/lecture-reviews.js?v=<%=new java.util.Date().getTime()%>"></script>
        </body>

        </html>