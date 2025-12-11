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

// JSP의 강의 목록 컨테이너
const lectureContainer = document.querySelector('.flex.w-full.flex-col.gap-4');
// 총 강의 개수 표시 span
const countLecturesSpan = document.getElementById('countLectures');

function renderLectures(lectureList) {
    if (countLecturesSpan) {
        // 필터링된 리스트의 개수로 업데이트
        countLecturesSpan.textContent = lectureList.length;
    }

    let newHtml = '';

    if (lectureList && lectureList.length > 0) {
        lectureList.forEach(lecture => {
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
            `;
        })
    } else {
        newHtml = `
            <div class="text-center text-gray-500 py-10 rounded-2xl bg-white shadow-sm border border-gray-100">
                선택한 학과에 등록된 강의가 없습니다.
            </div>
        `;
    }

    if (lectureContainer) {
        lectureContainer.innerHTML = newHtml;
    }

    attachDetailEventListeners();
}

function attachDetailEventListeners() {
    const lectureCards = document.querySelectorAll('.lecture-card[data-lecture-id][data-professor-id]')

    lectureCards.forEach((card) => {
        card.onclick = function () {
            const lectureId = this.dataset.lectureId;
            const professorId = this.dataset.professorId;

            // ID가 없으면 클릭 무시 (선택적)
            if (!lectureId || !professorId) {
                console.warn('Lecture ID or Professor ID not found on card:', this);
                return;
            }

            const servletUrl = `${contextPath}/lecture-review-detail?id=${lectureId}&professorId=${professorId}`;
            window.location.href = servletUrl;
        };
    });
}

const deptSelect = document.getElementById('deptSelect');
deptSelect.addEventListener('change', () => {
    // 선택된 학과 ID를 정수로 변환
    const currentDeptId = parseInt(deptSelect.value);

    let filteredList;

    if (currentDeptId === 0) {
        // '전체학과' 선택 시, 전체 리스트 사용
        filteredList = globalLectureList;
    } else {
        // 선택한 학과 ID(currentDeptId)로 필터링
        filteredList = globalLectureList.filter(lecture =>
            lecture.deptId === currentDeptId
        );
    }

    // 필터링된 리스트를 화면에 즉시 렌더링
    renderLectures(filteredList);
});

attachDetailEventListeners();