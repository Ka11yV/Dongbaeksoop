const updateBtn = document.querySelector("#updateBtn");
const saveBtn = document.querySelector("#saveBtn");
const cancelBtn = document.querySelector("#cancelBtn");
const changePwd = document.querySelector("#changePwd")

updateBtn.addEventListener('click', () => {  // 수정하기 버튼
    const my_info_div = document.querySelector("#my_info_div");
    const edit_div = document.querySelector("#edit_div");

    my_info_div.classList.add('hidden');
    edit_div.classList.remove('hidden');
});

cancelBtn.addEventListener('click', () => {  // 취소 버튼
    const my_info_div = document.querySelector("#my_info_div");
    const edit_div = document.querySelector("#edit_div");

    my_info_div.classList.remove('hidden');
    edit_div.classList.add('hidden');
});

saveBtn.addEventListener('click', async (event) => {  // 저장하기 버튼
    event.preventDefault();
    const selectDept = document.querySelector("#selectDept");
    const selectGrade = document.querySelector("#selectGrade");
    const url = `${contextPath}/my-page/change-dept-grade`;

    const dataToSend = {
        "dept_id": selectDept.value,
        "grade": selectGrade.value
    };

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

        // Update the UI with the new values
        const deptNameSpan = document.querySelector("#deptNameSpan");
        const gradeSpan = document.querySelector("#gradeSpan");

        deptNameSpan.textContent = selectDept.options[selectDept.selectedIndex].text;
        gradeSpan.textContent = `${selectGrade.value}학년`;

        // Switch back to the info view
        const my_info_div = document.querySelector("#my_info_div");
        const edit_div = document.querySelector("#edit_div");
        my_info_div.classList.remove('hidden');
        edit_div.classList.add('hidden');


        toast('success', "마이페이지 수정", "프로필 정보를 수정하였습니다.");

    } catch (error) {
        console.error('Fetch Error:', error);
        alert(error.message); // Show error to the user
    }
});

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



