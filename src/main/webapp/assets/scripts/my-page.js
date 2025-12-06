function switchTab(tabName) {
    document.getElementById('section-profile').classList.add('hidden');
    document.getElementById('section-reviews').classList.add('hidden');
    document.getElementById('section-account').classList.add('hidden');
    document.getElementById('section-' + tabName).classList.remove('hidden');
    const tabs = ['profile', 'reviews', 'account'];

    tabs.forEach(t => {
        const btn = document.getElementById('tab-' + t);

        if (t === tabName) {
            btn.className = 'w-full py-2.5 text-sm font-bold leading-5 text-primary bg-white rounded-lg shadow transition-all';
        } else {
            btn.className = 'w-full py-2.5 text-sm font-medium leading-5 text-gray-500 rounded-lg hover:text-gray-700 hover:bg-white/50 transition-all';
        }
    });
}

function toggleAccountLink() {
    const notLinked = document.getElementById('account-not-linked');
    const linked = document.getElementById('account-linked');

    if (notLinked.classList.contains('hidden')) {
        notLinked.classList.remove('hidden');
        linked.classList.add('hidden');
    } else {
        notLinked.classList.add('hidden');
        linked.classList.remove('hidden');

    }
}

// -- 프로필  --
// 1. 학과, 학년 변경
const updateBtn = document.querySelector("#updateBtn");  // 수정하기 버튼
const cancelBtn = document.querySelector("#cancelBtn");  // 취소하기 버튼
const saveBtn = document.querySelector("#saveBtn");  // 저장하기
const myInfo = document.querySelector("#myInfo");  // 내 정보
const editDeptGrade = document.querySelector("#editDeptGrade");  // 학과, 학년 수정 버튼
const selectDept = document.querySelector("#selectDept");  // 학과 selection
const selectGrade = document.querySelector("#selectGrade");  // 학년 selection
const deptName = document.querySelector("#deptName");
const grade = document.querySelector("#grade");

// 수정하기
updateBtn.addEventListener('click', () => {
    console.log('수정 버튼 클릭');
    myInfo.classList.add('hidden');
    editDeptGrade.classList.remove('hidden');
});

// 취소하기
cancelBtn.addEventListener('click', () => {
    myInfo.classList.remove('hidden');
    editDeptGrade.classList.add('hidden');
});

// 저장하기
saveBtn.addEventListener('click', async () => {
    const url = `${contextPath}/change-dept-grade`;

    const dataToSend = {
        "deptId": selectDept.value,
        "grade": selectGrade.value
    };

    console.log("Data to send:", dataToSend);
    console.log("Request body:", JSON.stringify(dataToSend));

    try {
        const response = await fetch(url, {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},  // 서버에게 JSON 형식임을 알림
            body: JSON.stringify(dataToSend) // JS 객체를 JSON 문자열로 변환하여 전송
        })

        if (!response.ok) {
            const errorData = await response.json().catch(() => null);
            const errorMessage = errorData ? errorData.message : `HTTP error! status: ${response.status}`;
            throw new Error(`수정 실패: ${errorMessage}`);
        }

        const data = await response.json();
        console.log('Server Success:', data);


        deptName.textContent = selectDept.options[selectDept.selectedIndex].text;
        grade.textContent = `${selectGrade.value}학년`;

        const myInfo = document.querySelector("#myInfo");
        const editDeptGrade = document.querySelector("#editDeptGrade");
        myInfo.classList.remove('hidden');
        editDeptGrade.classList.add('hidden');

    } catch (error) {
        console.error('Fetch Error:', error);
        toast('error', "마이페이지 수정", "시스템 에러 발생 : ", error);
    }
});

// 2. 비밀번호 변경
const changePwd = document.querySelector("#changePwd");  // 비밀번호 변경 버튼

changePwd.addEventListener('click', async (event) => {  // 저장하기 버튼
    event.preventDefault();
    const currentPwd = document.querySelector("#currentPwd")
    const newPwd = document.querySelector("#newPwd")
    const newPwdCheck = document.querySelector("#newPwdCheck")
    const url = `${contextPath}/my-page/change-password`;

    const dataToSend = {
        "password": newPwd.value
    };

    if ((newPwd.value === newPwdCheck.value)) {
        console.log("Data to send:", dataToSend);
        console.log("Request body:", JSON.stringify(dataToSend));

        try {
            const response = await fetch(url, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json' // 서버에게 JSON 형식임을 알림
                },
                body: JSON.stringify(dataToSend) // JS 객체를 JSON 문자열로 변환하여 전송
            })
                .catch(error => {
                    console.error('Fetch Error:', error);  // 요청 실패 또는 오류 처리
                });

            if (!response.ok) {
                const errorData = await response.json().catch(() => null); // In case error response is not JSON
                const errorMessage = errorData ? errorData.message : `HTTP error! status: ${response.status}`;
                throw new Error(`수정 실패: ${errorMessage}`);
            }

            const data = await response.json();
            console.log('Server Success:', data);

            currentPwd.value = "";
            newPwd.value = "";
            newPwdCheck.value = ""

            toast('success', "마이페이지 수정", "비밀번호를 수정하였습니다.");

        } catch (error) {
            console.error('Fetch Error:', error);
            alert(error.message); // Show error to the user
        }
    }
});

// 토스트 메시지
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
        customWrapper: ''
    })
}



