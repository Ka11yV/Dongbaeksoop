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

const ratingInput = document.getElementById('rating');

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

    if (rating) {
        ratingInput.value = rating;
    }
}

// Add click handlers for criteria buttons to toggle active state
document.querySelectorAll('.grid button[type="button"]').forEach(btn => {
    btn.addEventListener('click', function () {
        const parent = this.parentElement;
        parent.querySelectorAll('button').forEach(b => {
            b.className = 'flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all';
        });
        this.className = 'flex-1 py-3 text-sm font-bold rounded-xl bg-blue-50 border border-primary text-primary transition-all shadow-sm';
    });
});

const semester = document.getElementById('semester');
if (semester) {
    const semesterSelect = semester.parentElement.querySelector('select');
    // 초기값 설정
    semester.value = semesterSelect.value;

    // 변경 이벤트 리스너 추가
    semesterSelect.addEventListener('change', function () {
        semester.value = this.value;
    });
}

const difficulty = document.getElementById('difficulty');
const difficultyBtnGroup = document.getElementById('difficultyBtnGroup');

if (difficultyBtnGroup) {
    const difficultyBtn = difficultyBtnGroup.querySelectorAll('.flex-1')

    difficultyBtn.forEach(btn => {
        btn.addEventListener('click', (e) => {
            difficulty.value = e.currentTarget.dataset.value;
        })
    })
}

const workload = document.getElementById('workload')
const workloadBtnGroup = document.getElementById('workloadBtnGroup')
if (workloadBtnGroup) {
    const workloadBtn = workloadBtnGroup.querySelectorAll('.flex-1')

    workloadBtn.forEach(btn => {
        btn.addEventListener('click', e => {
            workload.value = e.currentTarget.dataset.value;
        })
    })
}

const team_project = document.getElementById('team_project')
const team_projectBtnGroup = document.getElementById('team_projectBtnGroup')
if (team_projectBtnGroup) {
    const team_projectBtn = team_projectBtnGroup.querySelectorAll('.flex-1')

    team_projectBtn.forEach(btn => {
        btn.addEventListener('click', e => {
            team_project.value = e.currentTarget.dataset.value;
        })
    })
}

const attendance_method = document.getElementById('attendance_method')
const attendance_methodBtnGroup = document.getElementById('attendance_methodBtnGroup')
if (attendance_methodBtnGroup) {
    const attendance_methodBtn = attendance_methodBtnGroup.querySelectorAll('.flex-1')

    attendance_methodBtn.forEach(btn => {
        btn.addEventListener('click', e => {
            attendance_method.value = e.currentTarget.dataset.value;
        })
    })
}
