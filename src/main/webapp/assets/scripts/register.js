const submit = document.querySelector('#submit');
const userIdInput = document.querySelector('#userId');
const checkIdBtn = document.querySelector('#check-id');

let isIdVerified = false;
let isEmailVerified = false;

checkIdBtn.addEventListener('click', async () => {
  const userId = userIdInput.value;

  await checkUserIdAvilability(userId);
});

async function checkUserIdAvilability(userId) {
  const url = `${contextPath}/users/check/id?id=${encodeURIComponent(userId)}`;

  try {

    const response = await fetch(url);
    console.log(await response.text());

    // 200이외 응답 시 에러 toast 메시지를 반환합니다.
    if (!response.ok) {
      toast('error', '서버 오류', `HTTP 오류 발생: ${response.status}`);
      userIdInput.classList.add('border-red-500');
      isIdVerified = false;
      return;
    }

    if (data.available) {
      // 🟢 사용 가능 (성공)
      toast('success', '사용 가능', data.message || '사용 가능한 아이디입니다.');
      userIdInput.classList.add('border-green-500');
      userIdInput.classList.remove('border-red-500');
    } else {
      toast('warning', '중복 ID', data.message || '이미 사용 중인 아이디입니다.');
      userIdInput.classList.add('border-red-500');
      userIdInput.classList.remove('border-green-500');
      isIdVerified = false;
    }
  } catch (e) {
    console.error('JSON 파싱 오류:', e);
    toast('error', '응답 형식 오류', '서버에서 JSON이 아닌 데이터를 받았습니다.');
    userIdInput.classList.add('border-red-500');
    isIdVerified = false;
    return;
  }
}



function toast(status, title, text = "") {
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
    gap: 20,
    distance: 50,
    type: 'outline',
    position: 'x-center'
  })
}