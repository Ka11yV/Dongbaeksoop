// lecture-reviews.jsp
const courseItemBtns = document.querySelectorAll('.courseItemBtn');

courseItemBtns.forEach((btn) => {
    btn.addEventListener('click', (e) => {
        console.log('Card clicked');
        const servletUrl = '/lecture-review-detail';
        window.location.href = servletUrl;
    });
});

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
}

// Add click handlers for criteria buttons to toggle active state
document.querySelectorAll('.grid button[type="button"]').forEach(btn => {
    btn.addEventListener('click', function () {
        const parent = this.parentElement;
        // Reset all siblings
        parent.querySelectorAll('button').forEach(b => {
            b.className = 'flex-1 py-3 text-sm font-medium rounded-xl bg-white border border-gray-200 text-gray-500 hover:bg-gray-50 hover:border-gray-300 transition-all';
        });
        // Set active state
        this.className = 'flex-1 py-3 text-sm font-bold rounded-xl bg-blue-50 border border-primary text-primary transition-all shadow-sm';
    });
});