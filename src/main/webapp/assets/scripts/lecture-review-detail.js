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

document.querySelectorAll('.grid button[type="button"]').forEach(btn => {
    btn.addEventListener('click', function () {
        const parent = this.parentElement;
        parent.querySelectorAll('button').forEach(b => {
            b.className = 'flex-1 py-2 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all';
        });
        this.className = 'flex-1 py-2 text-sm font-bold rounded-xl bg-blue-50 border border-primary text-primary transition-all shadow-sm';
    });
});

const courseSemesterSelect = document.getElementById("course-semester-select");
const courseSemesterInput = document.getElementById("course-semester-input");
courseSemesterSelect.addEventListener('change', () => {
    courseSemesterInput.value = courseSemesterSelect.value;
})

const difficultyButtonGroup = document.getElementById("difficulty-button-group")
const difficultyInput = document.getElementById("difficulty-input");
difficultyButtonGroup.addEventListener('click', e => {
    const clickedButton = e.target.closest('button');
    difficultyInput.value = clickedButton.getAttribute('data-value')
})

const workloadButtonGroup = document.getElementById("workload-button-group")
const workloadInput = document.getElementById("workload-input");
workloadButtonGroup.addEventListener('click', e => {
    const clickedButton = e.target.closest('button');
    workloadInput.value = clickedButton.getAttribute('data-value')
})

const teamProjectButtonGroup = document.getElementById("team-project-button-group")
const teamProjectInput = document.getElementById("team-project-input");
teamProjectButtonGroup.addEventListener('click', e => {
    const clickedButton = e.target.closest('button');
    teamProjectInput.value = clickedButton.getAttribute('data-value')
})

const attendanceMethodButtonGroup = document.getElementById("attendance-method-button-group")
const attendanceMethodInput = document.getElementById("attendance-method-input");
attendanceMethodButtonGroup.addEventListener('click', e => {
    const clickedButton = e.target.closest('button');
    attendanceMethodInput.value = clickedButton.getAttribute('data-value')
})
