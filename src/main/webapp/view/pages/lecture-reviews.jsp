<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 평가 - 동백숲</title>
    <link href="${pageContext.request.contextPath}/assets/styles/output.css" rel="stylesheet">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/simple-notify/dist/simple-notify.css" />
    <script src="https://cdn.jsdelivr.net/npm/simple-notify/dist/simple-notify.min.js"></script>
    <style>
        body {
            font-family: 'Pretendard', sans-serif;
            background-color: #F8FAFC;
            color: #0F172A;
        }
    </style>
</head>

<body class="antialiased">
<c:set var="countLectures" value="${requestScope.countLectures}" />
<%@ include file="/view/common/header.jsp" %>
<main class="pt-24 pb-12 min-h-screen">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="mb-8">
            <h1 class="text-3xl md:text-4xl font-bold text-dark mb-3">강의 평가</h1>
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <p class="text-lg text-gray-600">원하는 강의를 선택하고 실제 수강생들의 평가를 확인해보세요.</p>
            </div>
        </div>

        <div class="mb-8 w-full rounded-2xl bg-white p-6 shadow-lg border border-gray-100">
            <div class="relative mb-6 w-full">
                <input type="text" placeholder="강의명 또는 교수명 검색..." class="h-12 w-full rounded-full border border-gray-200 bg-gray-50 py-2 pr-4 pl-12 text-base text-dark placeholder-gray-400 focus:ring-2 focus:ring-primary/50 focus:border-primary focus:outline-none transition-all shadow-sm" />
                    <svg class="absolute top-3.5 left-4 h-5 w-5 text-gray-400" fill="none"
                        viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
            </div>

            <div class="flex flex-wrap gap-3">
                <div class="relative inline-block">
                    <select id="deptSelect" autocomplete="off" class="appearance-none flex h-10 w-full rounded-full border border-gray-200 bg-white pl-4 pr-10 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 hover:border-gray-300 transition-all">
                        <option value="0">전체학과</option>
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

                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-gray-500">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                        </svg>
                    </div>
                </div>

                <div class="relative inline-block w-32">
                    <select id="sortSelect" class="appearance-none flex h-10 w-full rounded-full border border-gray-200 bg-white pl-4 pr-10 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 hover:border-gray-300 transition-all">
                        <option value="sortByRating">평점순</option>
                        <option value="sortByReviewCount">리뷰많은순</option>
                    </select>

                    <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-gray-500">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                            <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                        </svg>
                    </div>
                </div>
            </div>
        </div>

        <p class="mb-6 text-base font-medium text-gray-600">총
            <span id="countLectures" class="text-primary font-bold">
                ${countLectures}
            </span>개의 강의
        </p>

        <div class="flex w-full flex-col gap-4">
            <c:forEach var="lecture" items="${requestScope.lectureList}">
                <div data-lecture-id="${lecture.lectureId}" data-professor-id="${lecture.professorId}"
                            class="lecture-card courseItemBtn group flex w-full cursor-pointer items-start rounded-2xl border border-gray-100 bg-white p-6 shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300">
                            <div class="flex flex-1 flex-col justify-start gap-2 pr-4 md:pr-10">
                                <div class="flex items-center gap-3">
                                    <h3
                                        class="lectureName truncate text-xl font-bold text-dark group-hover:text-primary transition-colors">
                                        ${lecture.lectureName}</h3>
                                    <span
                                        class="shrink-0 rounded-full bg-blue-100 px-3 py-1 text-xs font-bold text-primary">${lecture.courseType}</span>
                                </div>
                                <div class="flex flex-wrap items-center gap-x-3 text-sm text-gray-500 mt-1">
                                    <span class="font-medium text-gray-700">${lecture.professorName}</span>
                                    <span class="text-gray-300">|</span>
                                    <span>${lecture.deptName}</span>
                                    <span class="text-gray-300">|</span>
                                    <span class="flex items-center gap-1">
                                        <svg class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24"
                                            stroke="currentColor" stroke-width="2">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M7.5 8.25h9m-9 3h9m-9 3h9m-3 1.5a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg>
                                        18개의 리뷰
                                    </span>
                                </div>
                                <p class="mt-3 truncate text-base text-gray-600">"어렵지만 실무에 도움되는 강의, 프로젝트 경험하기
                                    좋아요"</p>
                            </div>

                            <div class="flex shrink-0 items-center gap-4">
                                <div class="flex flex-col items-end gap-1">
                                    <div class="flex items-center gap-1 text-yellow-400">
                                        <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" />
                                        </svg>
                                        <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" />
                                        </svg>
                                        <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" />
                                        </svg>
                                        <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" />
                                        </svg>
                                        <svg class="h-5 w-5 text-gray-200" fill="currentColor"
                                            viewBox="0 0 20 20">
                                            <path
                                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" />
                                        </svg>
                                    </div>
                                    <div class="flex items-baseline text-right">
                                        <span class="text-lg font-bold text-dark">4.8</span>
                                        <span class="text-sm text-gray-400">/5.0</span>
                                    </div>
                                </div>
                                <div
                                    class="courseItemBtn h-8 w-8 rounded-full bg-gray-50 flex items-center justify-center group-hover:bg-primary group-hover:text-white transition-colors">
                                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                                        stroke-width="2">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                                    </svg>
                                </div>
                            </div>
                        </div>
            </c:forEach>

            <div class="mt-10 flex items-center justify-center gap-2">
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
    </div>
</main>
<%@ include file="/view/common/footer.jsp" %>
<script>
    const contextPath = '${pageContext.request.contextPath}';
    const allLecturesJsonString = '<c:out value="${requestScope.allLecturesJson}" escapeXml="false" />';

    let globalLectureList = [];
    try {
        if (allLecturesJsonString && allLecturesJsonString.length > 0) {
            globalLectureList = JSON.parse(allLecturesJsonString);
        }
    } catch (e) {
        console.error("JSON 파싱 오류:", e);
        toast('error', "초기 데이터 로드", "데이터 로드 중 치명적인 오류가 발생했습니다.");
    }
</script>
<script src="${pageContext.request.contextPath}/assets/scripts/lecture-reviews.js"></script>
</body>
</html>