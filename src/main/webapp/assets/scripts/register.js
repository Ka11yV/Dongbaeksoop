const submit = document.querySelector('#submit');
const userIdInput = document.querySelector('#userId');
const checkIdBtn = document.querySelector('#check-id');
const checkIdBtnText = document.querySelector('#checkIdBtnText');
const idErrorMessage = document.querySelector('#idErrorMessage');

let isIdVerified = false;
let isEmailVerified = false;

checkIdBtn.addEventListener('click', async () => {
  const userId = userIdInput.value;

  if (!userId) {
    idErrorMessage.textContent = '아이디를 입력 해 주세요.'
    return;
  }

  await checkUserIdAvilability(userId);
});

userIdInput.addEventListener('input', () => {
  isIdVerified = false;
  userIdInput.classList.remove('border-green-500');
  userIdInput.classList.remove('border-red-500');
  idErrorMessage.textContent = ''
})

async function checkUserIdAvilability(userId) {
  const url = `${contextPath}/users/check/id?id=${encodeURIComponent(userId)}`;

  try {
    const response = await fetch(url);

    // 200이외 응답 시 에러 toast 메시지를 반환합니다.
    if (!response.ok) {
      toast('error', '서버 오류', `HTTP 오류 발생: ${response.status}`);
      userIdInput.classList.add('border-red-500');
      isIdVerified = false;
      return;
    }

    const data = await response.json();

    if (data.available) {
      // 🟢 사용 가능 (성공)
      idErrorMessage.textContent = '사용 가능한 아이디 입니다.'
      idErrorMessage.classList.remove('text-red-500');
      idErrorMessage.classList.add('text-green-500');
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
    position: 'right bottom'
  })
}

// Email Verification Logic
const emailInput = document.querySelector('#email');
const sendEmailBtn = document.querySelector('#send-email');
const verificationContainer = document.querySelector('#verification-container');
const verificationInputs = document.querySelectorAll('.verification-input');
const emailErrorMessage = document.querySelector('#emailErrorMessage');
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function handleEmailError(text) {
  emailInput.classList.add('border-red-500');
  emailErrorMessage.textContent = text;
  emailErrorMessage.classList.add('text-red-500');
}


function isValidateEmail(email, text) {
  if (emailInput.value === '') {
    handleEmailError("이메일을 입력 해주세요")
    return false
  }

  if (!emailRegex.test(emailInput.value.trim())) {
    handleEmailError("이메일 형식이 잘못되었습니다.")
    return false
  }
  if (!emailInput.value.trim().endsWith("@m365.dongyang.ac.kr")) {
    handleEmailError("학교 이메일만 사용 가능합니다.")
    return false
  }

  return true;
}

async function sendVeirificationCode() {
  try {
    const url = `${contextPath}/auth/verification-code`;
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email: emailInput.value })
    });

    if (!response.ok) {

    }

    const data = await response.json();




  } catch (error) {
    console.log(error)
  }
}

  sendEmailBtn.addEventListener('click', () => {
    if (isValidateEmail(emailInput.value.trim())) {
      sendVeirificationCode()
    }



  });

  emailInput.addEventListener('input', (e) => {
    emailInput.classList.remove('border-red-500');
    emailErrorMessage.textContent = ""
  })

verificationInputs.forEach((input, index) => {
  // Move to next input on entry
  input.addEventListener('input', (e) => {
    if (input.value.length === 1) {
      if (index < verificationInputs.length - 1) {
        verificationInputs[index + 1].focus();
      }
    }
  });

  // Move to previous input on backspace if empty
  input.addEventListener('keydown', (e) => {
    if (e.key === 'Backspace' && input.value === '') {
      if (index > 0) {
        verificationInputs[index - 1].focus();
      }
    }
  });
})


async function sendVerificationCode(email) {

}