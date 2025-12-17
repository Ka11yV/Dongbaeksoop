// ==========================================================
// 0. DOM 요소 및 데이터 정의
// ==========================================================
const reviewListContainer = document.getElementById('reviewListContainer');
const sortReviewsSelect = document.getElementById('sortReviewsSelect');
// globalReviewList는 JSP 파일의 <script> 블록에서 JSON.parse로 초기화됩니다.


// ==========================================================
// 1. MODAL & UTILITY FUNCTIONS
// ==========================================================

function openModal() {
    const backdrop = document.getElementById('reviewModalBackdrop');
    const modal = document.getElementById('reviewModal');

    backdrop.classList.remove('hidden');
    modal.classList.remove('hidden');

    setTimeout(() => {
        backdrop.classList.remove('opacity-0');
        modal.classList.remove('opacity-0', 'scale-95');
    }, 10);

    document.body.style.overflow = 'hidden';
}

function closeModal() {
    const backdrop = document.getElementById('reviewModalBackdrop');
    const modal = document.getElementById('reviewModal');

    backdrop.classList.add('opacity-0');
    modal.classList.add('opacity-0', 'scale-95');

    setTimeout(() => {
        backdrop.classList.add('hidden');
        modal.classList.add('hidden');
        document.body.style.overflow = '';
    }, 300);
}

// 리뷰 작성 모달의 별점을 설정합니다.
const ratingInput = document.getElementById("rating-input");
function setRating(rating) {
    const stars = document.querySelectorAll('.star-btn svg');
    stars.forEach((star, index) => {
        if (index < rating) {
            star.classList.add('text-yellow-400');
            star.classList.remove('text-gray-200');
        } else {
            star.classList.remove('text-yellow-400');
            star.classList.add('text-gray-200');
        }
    });
    ratingInput.value = rating;
}

// JSP에서 EL로 출력된 평균 평가 텍스트를 정리합니다.
function cleanAverageRatingText() {
    const averageContainer = document.querySelector('.space-y-3.mb-8');

    if (!averageContainer) {
        return;
    }

    const ratingItems = [
        { label: '난이도', keyword: '난이도 ' },
        { label: '과제량', keyword: '과제량 ' },
        { label: '팀플', keyword: '팀플 ' },
        { label: '출결', keyword: '출결 ' }
    ];

    ratingItems.forEach(item => {
        const itemDivs = averageContainer.querySelectorAll('.flex.justify-between.items-center.text-sm');

        itemDivs.forEach(div => {
            const labelSpan = div.querySelector('span:first-child');
            const valueSpan = div.querySelector('span:last-child');

            if (labelSpan && valueSpan && labelSpan.textContent.trim() === item.label) {
                let originalText = valueSpan.textContent.trim();

                if (originalText.startsWith(item.keyword)) {
                    valueSpan.textContent = originalText.substring(item.keyword.length);
                }
            }
        });
    });
}


// ==========================================================
// 2. REVIEW SORTING & RENDERING
// ==========================================================

// ⭐️⭐️ 날짜 문자열을 안전하게 Date 객체의 밀리초로 변환하는 헬퍼 함수 ⭐️⭐️
const safeDateToTime = (dateString) => {
    if (!dateString) return 0;

    let date = new Date(dateString);

    // MySQL/Oracle 포맷('YYYY-MM-DD HH:MM:SS')일 경우 ISO 포맷으로 변환 시도
    if (isNaN(date.getTime()) && typeof dateString === 'string' && dateString.includes(' ')) {
        date = new Date(dateString.replace(' ', 'T'));
    }

    // 유효하지 않으면 0을 반환하여 정렬 가능하게 함
    return isNaN(date.getTime()) ? 0 : date.getTime();
};


/**
 * 리뷰 목록을 HTML로 재구성하여 화면에 그립니다.
 */
function renderReviews(reviews) {
    if (!reviewListContainer) return;

    let newHtml = '';

    if (reviews && reviews.length > 0) {
        reviews.forEach(review => {
            const rating = review.rating || 0;
            let starSvgs = '';

            // 리뷰 카드별 별점 SVG 동적 생성
            for (let i = 1; i <= 5; i++) {
                const colorClass = i <= rating ? 'text-yellow-400' : 'text-gray-300';
                starSvgs += `
                    <svg class="w-5 h-5 fill-current ${colorClass}" viewBox="0 0 20 20">
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                `;
            }

            // 날짜 포맷팅 안정화: safeDateToTime을 사용하여 안전하게 Date 객체 생성
            const date = safeDateToTime(review.createdAt) > 0 ? new Date(safeDateToTime(review.createdAt)) : new Date();
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            const formattedDate = `${year}.${month}.${day}`;


            newHtml += `
                <div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
                    <div class="flex justify-between items-start mb-4">
                        <div class="flex items-center gap-2">
                            <div class="flex">
                                ${starSvgs}
                            </div>
                            <span class="font-bold text-primary text-lg" id="rating">${rating}.0</span>
                            <span class="text-gray-300 mx-1">|</span>
                            <span class="text-gray-500 text-sm">익명</span>
                            <span class="text-gray-300 mx-1">·</span>
                            <span class="text-gray-400 text-sm">${formattedDate}</span>
                        </div>
                        <span class="px-2 py-1 rounded-md border border-gray-200 text-xs font-bold text-gray-500">${review.courseSemester}</span>
                    </div>

                    <p class="text-gray-700 leading-relaxed mb-4">
                        ${review.content}
                    </p>

                    <div class="flex flex-wrap gap-2 mb-6">
                        <span class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">${review.difficulty}</span>
                        <span class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">${review.workload}</span>
                        <span class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">${review.teamProject}</span>
                        <span class="px-3 py-1.5 rounded-lg bg-blue-50 text-primary text-xs font-bold">${review.attendanceMethod}</span>
                    </div>

                    <div class="flex justify-between items-center pt-4 border-t border-gray-50">
                        <button
                            class="flex items-center gap-1 text-gray-400 hover:text-gray-600 transition-colors">
                            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.398 16c-.77 1.333.192 3 1.732 3z" />
                            </svg>
                            <span class="text-xs font-medium">신고</span>
                        </button>
                    </div>
                </div>
            `;
        });
    } else {
        newHtml = `<div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">등록된 리뷰가 없습니다.</div>`;
    }

    reviewListContainer.innerHTML = newHtml;
}

/**
 * 리뷰 목록을 정렬하고 렌더링합니다.
 */
function sortReviews(reviews) {
    const sortBy = sortReviewsSelect.value;
    let sortedReviews = [...reviews];

    switch (sortBy) {
        case 'highestRating':
            sortedReviews.sort((a, b) => b.rating - a.rating);
            break;
        case 'lowestRating':
            sortedReviews.sort((a, b) => a.rating - b.rating);
            break;
        case 'latest':
        case 'mostLiked':
        default:
            // ⭐️⭐️ 안전한 날짜 변환 함수를 사용하여 최신순 정렬 보장 ⭐️⭐️
            sortedReviews.sort((a, b) => safeDateToTime(b.createdAt) - safeDateToTime(a.createdAt));
            break;
    }

    renderReviews(sortedReviews);
}


// ==========================================================
// 3. REVIEW MODAL FORM HANDLERS
// ==========================================================

// 리뷰 작성 모달 - 항목 선택 핸들러
document.querySelectorAll('.grid button[type="button"]').forEach(btn => {
    btn.addEventListener('click', function () {
        const parent = this.parentElement;
        parent.querySelectorAll('button').forEach(b => {
            b.className = 'flex-1 py-2 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all';
        });
        this.className = 'flex-1 py-2 text-sm font-bold rounded-xl bg-blue-50 border border-primary text-primary transition-all shadow-sm';
    });
});

// 수강 학기 드롭다운 값 업데이트
const courseSemesterSelect = document.getElementById("course-semester-select");
const courseSemesterInput = document.getElementById("course-semester-input");
if (courseSemesterSelect && courseSemesterInput) {
    courseSemesterSelect.addEventListener('change', () => {
        courseSemesterInput.value = courseSemesterSelect.value;
    });
}

// 난이도 버튼 그룹 핸들러
const difficultyButtonGroup = document.getElementById("difficulty-button-group")
const difficultyInput = document.getElementById("difficulty-input");
if (difficultyButtonGroup && difficultyInput) {
    difficultyButtonGroup.addEventListener('click', e => {
        const clickedButton = e.target.closest('button');
        if (clickedButton) {
            difficultyInput.value = clickedButton.getAttribute('data-value');
        }
    });
}

// 과제량 버튼 그룹 핸들러
const workloadButtonGroup = document.getElementById("workload-button-group")
const workloadInput = document.getElementById("workload-input");
if (workloadButtonGroup && workloadInput) {
    workloadButtonGroup.addEventListener('click', e => {
        const clickedButton = e.target.closest('button');
        if (clickedButton) {
            workloadInput.value = clickedButton.getAttribute('data-value');
        }
    });
}

// 팀플 버튼 그룹 핸들러
const teamProjectButtonGroup = document.getElementById("team-project-button-group")
const teamProjectInput = document.getElementById("team-project-input");
if (teamProjectButtonGroup && teamProjectInput) {
    teamProjectButtonGroup.addEventListener('click', e => {
        const clickedButton = e.target.closest('button');
        if (clickedButton) {
            teamProjectInput.value = clickedButton.getAttribute('data-value');
        }
    });
}

// 출결방식 버튼 그룹 핸들러
const attendanceMethodButtonGroup = document.getElementById("attendance-method-button-group")
const attendanceMethodInput = document.getElementById("attendance-method-input");
if (attendanceMethodButtonGroup && attendanceMethodInput) {
    attendanceMethodButtonGroup.addEventListener('click', e => {
        const clickedButton = e.target.closest('button');
        if (clickedButton) {
            attendanceMethodInput.value = clickedButton.getAttribute('data-value');
        }
    });
}


// ==========================================================
// 4. INITIALIZATION (초기화)
// ==========================================================

// ⭐️ DOMContentLoaded 이벤트 리스너: 페이지 로드 후 실행 ⭐️
document.addEventListener('DOMContentLoaded', () => {

    // 1. 평균 평가 텍스트 정리
    cleanAverageRatingText();

    // 2. 정렬 Select Box 이벤트 리스너 부착
    if (sortReviewsSelect) {
        sortReviewsSelect.addEventListener('change', () => {
            sortReviews(globalReviewList);
        });
    }

    // 3. 최초 리뷰 렌더링 시작 (JSP가 이미 출력했지만, JS 정렬을 적용하기 위해 재실행)
    if (globalReviewList && globalReviewList.length > 0) {
        sortReviews(globalReviewList); // 기본 정렬(최신순) 적용 후 렌더링
    }
});

function toast(status, title, text) {
    new Notify({
        status: status,
        title: title,
        text: text,
        effect: 'fade',
        speed: 300,
        customClass: null,
        customIcon: null,
        showIcon: true,
        showCloseButton: true,
        autoclose: true,
        autotimeout: 3000,
        notificationsPadding: 70,
        gap: 20,
        distance: 50,
        type: 'outline',
        position: 'right top'
    });
}



