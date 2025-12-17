// ==========================================================
// 0. DOM 요소 및 데이터 정의 (JSP 로드 스크립트 블록에서 정의)
// ==========================================================
const lectureContainer = document.querySelector('.flex.w-full.flex-col.gap-4');
const countLecturesSpan = document.getElementById('countLectures');
const sortSelect = document.getElementById('sortSelect');
const searchInput = document.getElementById('searchKeywordInput');
const deptSelect = document.getElementById('deptSelect');


// ==========================================================
// 1. UTILITY FUNCTIONS
// ==========================================================

function toast(status, title, text) {
    new Notify({
        status: status,
        title: title,
        text: text,
        effect: 'fade',
        speed: 300,
        customClass: '',
        customIcon: '',
        showIcon: true,
        showCloseButton: true,
        autoclose: true,
        autotimeout: 3000,
        notificationsGap: null,
        notificationsPadding: null,
        type: 'outline',
        position: 'right top',
        customWrapper: '',
    })
}

function attachDetailEventListeners() {
    const lectureCards = document.querySelectorAll('.lecture-card[data-lecture-id][data-professor-id]')

    lectureCards.forEach((card) => {
        card.onclick = function () {
            const lectureId = this.dataset.lectureId;
            const professorId = this.dataset.professorId;

            if (!lectureId || !professorId) {
                console.warn('Lecture ID or Professor ID not found on card:', this);
                return;
            }

            const servletUrl = `${contextPath}/lecture-review-detail?id=${lectureId}&professorId=${professorId}`;
            window.location.href = servletUrl;
        };
    });
}


// ==========================================================
// 2. CORE RENDERING FUNCTION
// ==========================================================

function renderLectures(lectureList) {
    if (countLecturesSpan) {
        countLecturesSpan.textContent = lectureList.length;
    }

    let newHtml = '';

    const starSvgPath = 'M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z';

    if (lectureList && lectureList.length > 0) {
        lectureList.forEach(lecture => {
            const summary = lecture.reviewSummaryDTO || {};

            // ⭐️⭐️ 버그 수정: 중복 속성 참조 제거 ⭐️⭐️
            const count = summary.countReview ?? 0;

            const rawRating = summary.avgRating ? parseFloat(summary.avgRating) : 0.0;
            const avgRatingFormatted = rawRating.toFixed(1);

            const roundedRating = Math.floor(rawRating);
            let starSvgs = '';

            for (let i = 1; i <= 5; i++) {
                const colorClass = i <= roundedRating ? 'text-yellow-400' : 'text-gray-200';
                starSvgs += `
                    <svg class="h-5 w-5 ${colorClass}" fill="currentColor" viewBox="0 0 20 20">
                        <path d="${starSvgPath}" />
                    </svg>
                `;
            }

            newHtml += `
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
                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 2 20 20">
                                            <path fill="none" stroke="#98A1B0" stroke-linecap="round" stroke-width="1.5" d="M20 7H4m16 5H4m16 5H4" />
                                        </svg>
                                        ${count}개의 리뷰 
                                    </span>
                                </div>
                            </div>

                            <div class="flex shrink-0 items-center gap-4">
                                <div class="flex flex-col items-end gap-1">
                                    <div class="flex items-center gap-1">
                                        ${starSvgs} 
                                    </div>
                                    <div class="flex items-baseline text-right">
                                        <span class="text-lg font-bold text-dark">
                                            ${avgRatingFormatted} 
                                        </span>
                                        <span class="text-sm text-gray-400">/5.0</span>
                                    </div>
                                </div>
                            </div>
                        </div>
            `;
        })
    } else {
        newHtml = `
            <div class="text-center text-gray-500 py-10 rounded-2xl bg-white shadow-sm border border-gray-100">
                선택한 조건에 맞는 강의가 없습니다.
            </div>
        `;
    }

    if (lectureContainer) {
        lectureContainer.innerHTML = newHtml;
    }

    attachDetailEventListeners();
}


// ==========================================================
// 3. SORT/FILTER LOGIC
// ==========================================================

function sortAndRender(list) {
    const sortBy = sortSelect.value;
    let sortedList = [...list];

    if (sortBy === 'sortByRating') {
        sortedList.sort((a, b) => {
            const ratingA = a.reviewSummaryDTO?.avgRating ?? 0.0;
            const ratingB = b.reviewSummaryDTO?.avgRating ?? 0.0;
            return ratingB - ratingA;
        });
    } else if (sortBy === 'sortByReviewCount') {
        sortedList.sort((a, b) => {
            // ⭐️ 수정된 DTO 구조를 반영하여 안전하게 접근 ⭐️
            const countA = a.reviewSummaryDTO?.countReview ?? 0;
            const countB = b.reviewSummaryDTO?.countReview ?? 0;
            return countB - countA;
        });
    }

    renderLectures(sortedList);
}

function applyAllFilters() {
    let filteredList = globalLectureList;

    // 1. 학과 필터링 적용
    const currentDeptId = parseInt(deptSelect.value);
    if (currentDeptId !== 0) {
        filteredList = filteredList.filter(lecture =>
            lecture.deptId === currentDeptId
        );
    }

    // 2. 검색어 필터링 적용
    const keyword = searchInput.value.toLowerCase().trim();
    if (keyword.length > 0) {
        filteredList = filteredList.filter(lecture => {
            const nameMatch = lecture.lectureName.toLowerCase().includes(keyword);
            const profMatch = lecture.professorName.toLowerCase().includes(keyword);
            return nameMatch || profMatch;
        });
    }

    // 3. 필터링된 리스트를 정렬 함수로 전달 (정렬 상태 유지)
    sortAndRender(filteredList);
}


// ==========================================================
// 4. EVENT LISTENERS SETUP & INITIALIZATION
// ==========================================================

// 학과 필터링 이벤트 리스너
deptSelect.addEventListener('change', applyAllFilters);

// 정렬 필터링 이벤트 리스너
sortSelect.addEventListener('change', applyAllFilters);

// 검색 입력 이벤트 리스너
searchInput.addEventListener('keyup', applyAllFilters);
searchInput.addEventListener('change', applyAllFilters);


// ⭐️ 초기 로딩 시 기본 필터 및 정렬을 적용하여 렌더링 시작 ⭐️
if (globalLectureList && globalLectureList.length > 0) {
    // 최초 실행 시 모든 필터와 정렬을 적용합니다.
    applyAllFilters();
} else {
    renderLectures([]);
}