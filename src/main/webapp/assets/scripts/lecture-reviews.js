const writeReviewBtn = document.getElementById('writeReviewBtn');  // 강의 평가 작성하기 버튼

writeReviewBtn.addEventListener('click', () => {
    const servletUrl = '/lecture-review-detail';
    window.location.href = servletUrl;
})