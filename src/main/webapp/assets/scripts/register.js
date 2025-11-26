const submitButton = document.querySelector('#submit');
const userIdInput = document.querySelector('#userId');
const checkIdBtn = document.querySelector('#check-id');
const idErrorMessage = document.querySelector('#idErrorMessage');
const emailInput = document.querySelector('#email');
const sendEmailBtn = document.querySelector('#send-email');
const verificationContainer = document.querySelector('#verification-container');
const verificationInputs = document.querySelectorAll('.verification-input');
const emailErrorMessage = document.querySelector('#emailErrorMessage');
const timerElement = document.querySelector('#timer');
const confirmVerificationBtn = document.querySelector('#confirm-verification');
const guideText = document.querySelectorAll('.guide');
const passwordInput = document.querySelector('#password')
const confirmPasswordInput = document.querySelector('#confirm-password')
const passwordErrorMessage = document.querySelector('#passwordErrorMessage')
const selectDepartment = document.querySelector('#dept_id')
const selectGrade = document.querySelector('#grade')

const TIMER_DURATION = 180;
let isIdVerified = false;
let isEmailVerified = false;
let isPasswordVerified = false;
let isSelectedDepartment = false
let isSelectedGrade = false;

let timerInterval;

const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

document.addEventListener('DOMContentLoaded', () => {
  initializeEventListeners();
});

function initializeEventListeners() {
  checkIdBtn.addEventListener('click', handleCheckId);
  userIdInput.addEventListener('input', resetIdVerification);
  sendEmailBtn.addEventListener('click', handleSendEmail);
  emailInput.addEventListener('input', resetEmailVerification);

  if (confirmVerificationBtn) {
    confirmVerificationBtn.addEventListener('click', handleConfirmVerification);
  }

  verificationInputs.forEach((input, index) => {
    input.addEventListener('input', (e) => handleVerificationInput(e, index));
    input.addEventListener('keydown', (e) => handleVerificationKeydown(e, index, input));
  });

  submit.addEventListener('click', handleSubmit);
}

async function handleCheckId() {
  const userId = userIdInput.value;

  if (!userId) {
    idErrorMessage.textContent = '아이디를 입력 해 주세요.';
    return;
  }

  await checkUserIdAvailability(userId);
}

function resetIdVerification() {
  isIdVerified = false;
  userIdInput.classList.remove('border-green-500', 'border-red-500');
  idErrorMessage.textContent = '';
  idErrorMessage.classList.remove('text-green-500', 'text-red-500');
}

function handleCheckIdSuccess() {
  idErrorMessage.textContent = '사용 가능한 아이디 입니다.';
  idErrorMessage.classList.remove('text-red-500');
  idErrorMessage.classList.add('text-green-500');
  userIdInput.classList.add('border-green-500');
  userIdInput.classList.remove('border-red-500');
  isIdVerified = true;
}

function handleIdDuplicateError() {
  console.log('아이디 중복')
  idErrorMessage.textContent = '이미 사용 중인 아이디입니다.'
  idErrorMessage.classList.add('text-red-500');
  idErrorMessage.classList.remove('text-green-500');
  userIdInput.classList.add('border-red-500');
  userIdInput.classList.remove('border-green-500');
  isIdVerified = false;
}


async function checkUserIdAvailability(userId) {
  const url = `${contextPath}/users/check/id?id=${encodeURIComponent(userId)}`;

  try {
    const response = await fetch(url);

    if (!response.ok) {
      toast("error", response.message);
    }

    const data = await response.json();

    if (data.success) {
      handleCheckIdSuccess()
    } else
      handleIdDuplicateError()
  } catch (e) {
    toast('error', e.message);
    userIdInput.classList.add('border-red-500');
    isIdVerified = false;
  }
}

function handleSendEmail() {
  const email = emailInput.value.trim();

  if (!validateEmail(email)) {
    return;
  }

  sendEmailBtn.innerText = '전송중..';
  sendVerificationEmail(email);
}

function validateEmail(email) {
  if (!email) {
    handleEmailError("이메일을 입력 해주세요");
    return false;
  }

  if (!emailRegex.test(email)) {
    handleEmailError("이메일 형식이 잘못되었습니다.");
    return false;
  }

  if (!email.endsWith("@m365.dongyang.ac.kr")) {
    handleEmailError("학교 이메일만 사용 가능합니다.");
    return false;
  }

  return true;
}

function handleEmailError(text) {
  emailInput.classList.add('border-red-500');
  emailErrorMessage.textContent = text;
  emailErrorMessage.classList.add('text-red-500');
}

function resetEmailVerification() {
  emailInput.classList.remove('border-red-500');
  emailErrorMessage.textContent = "";
  isEmailVerified = false;
}

function handleEmailSuccess() {
  emailInput.classList.remove('border-red-500')
  emailInput.classList.remove('border-green-500')
  emailErrorMessage.textContent("이메일 인증에 성공했습니다.")
  emailErrorMessage.classList.add('text-green-500')
  emailErrorMessage.classList.remove('text-red-500')
}

async function sendVerificationEmail(email) {
  try {
    const url = `${contextPath}/auth/verification-code`;
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email: email })
    });

    const data = await response.json();

    if (!response.ok) {
      emailErrorMessage.textContent = data.message;
      emailErrorMessage.classList.add('text-red-500');
      emailInput.classList.add('border-red-500');
      sendEmailBtn.innerText = '인증하기';
      return;
    }

    emailErrorMessage.textContent = data.message;
    emailErrorMessage.classList.remove('border-red-500');
    emailErrorMessage.classList.add('text-green-500');

    verificationContainer.classList.remove('hidden');
    sendEmailBtn.innerText = '재전송';

    guideText.forEach(element => {
      element.classList.add('hidden');
    });

    startTimer(TIMER_DURATION);
    enableVerificationInputs();

  } catch (error) {
    console.error(error);
    sendEmailBtn.innerText = '인증하기';
  }
}

function enableVerificationInputs() {
  verificationInputs.forEach(input => {
    input.disabled = false;
    input.value = '';
  });
  confirmVerificationBtn.disabled = false;
  confirmVerificationBtn.classList.remove('bg-gray-400', 'cursor-not-allowed');
  confirmVerificationBtn.classList.add('bg-primary', 'hover:bg-secondary');

  if (verificationInputs.length > 0) {
    verificationInputs[0].focus();
  }
}

async function handleConfirmVerification() {
  const code = Array.from(verificationInputs).map(input => input.value).join('');

  if (code.length !== 6) {
    handleEmailError("인증번호 6자리를 모두 입력해주세요.")
    return;
  }

  await verifyCode(code);
}

async function verifyCode(code) {
  try {
    const url = `${contextPath}/auth/verification`;
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        code: code
      })
    });

    const data = await response.json();

    if (response.ok && data.success) {
      handleVerificationSuccess();
    } else {
      handleEmailError('인증번호가 일치하지 않습니다.')
    }
  } catch (error) {
    handleEmailError('인증 확인 중 오류가 발생했습니다.')
  }
}

function handleVerificationSuccess() {
  clearInterval(timerInterval);
  isEmailVerified = true;

  verificationContainer.classList.add('hidden');


  emailInput.disabled = true;
  emailInput.classList.add('bg-gray-100', 'text-gray-500');

  sendEmailBtn.disabled = true;
  sendEmailBtn.classList.add('hidden');


  emailErrorMessage.textContent = '이메일 인증이 완료되었습니다.';
  emailErrorMessage.classList.remove('text-red-500');
  emailErrorMessage.classList.add('text-green-500');
  emailInput.classList.add('border-green-500')
  emailInput.classList.remove('border-red-500')
}

function startTimer(duration) {
  clearInterval(timerInterval);
  let timer = duration;
  updateTimerDisplay(timer);

  timerInterval = setInterval(() => {
    timer--;
    updateTimerDisplay(timer);

    if (timer <= 0) {
      clearInterval(timerInterval);
      handleTimerExpiration();
    }
  }, 1000);
}

function updateTimerDisplay(time) {
  const minutes = Math.floor(time / 60);
  const seconds = time % 60;
  timerElement.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
}

function handleTimerExpiration() {
  emailErrorMessage.textContent('인증시간이 만료되었습니다. 다시 인증 해주세요');
  emailErrorMessage.classList.add('text-red-500')
  emailErrorMessage.classList.remove('text-green-500')

  verificationInputs.forEach(input => input.disabled = true);
  confirmVerificationBtn.disabled = true;
  confirmVerificationBtn.classList.remove('bg-primary', 'hover:bg-secondary');
  confirmVerificationBtn.classList.add('bg-gray-400', 'cursor-not-allowed');
}

function handleVerificationInput(e, index) {
  if (e.target.value.length === 1) {
    if (index < verificationInputs.length - 1) {
      verificationInputs[index + 1].focus();
    }
  }
}

function handleVerificationKeydown(e, index, input) {
  if (e.key === 'Backspace' && input.value === '') {
    if (index > 0) {
      verificationInputs[index - 1].focus();
    }
  }
}



confirmPasswordInput.addEventListener('input', () => {
  password = passwordInput.value
  confirmPassword = confirmPasswordInput.value

  if (password === confirmPassword) {
    handleConfirmPasswordSuccess()
  } else {
    handleConfirmPasswordError()
  }
})

function handleConfirmPasswordSuccess() {
  passwordErrorMessage.textContent = '비밀번호가 일치합니다.'
  passwordErrorMessage.classList.add('text-green-500')
  passwordErrorMessage.classList.remove('text-red-500')
  isPasswordVerified = true
}

function handleConfirmPasswordError() {
  passwordErrorMessage.textContent = '비밀번호가 일치하지 않습니다.'
  passwordErrorMessage.classList.add('text-red-500')
  passwordErrorMessage.classList.remove('text-green-500')
  isPasswordVerified = false
}


submitButton.addEventListener('click', handleSubmit);


function handleSubmit(e) {
  e.preventDefault();
  if (!isIdVerified) {
    userIdInput.focus()
    e.preventDefault();
    toast('error', '가입 실패', '아이디 중복 확인을 해주세요.');
    return;
  }

  if (!isEmailVerified) {
    emailInput.focus()
    e.preventDefault();
    toast('error', '가입 실패', '이메일 인증을 완료해주세요.');
    return;
  }

  if (!isPasswordVerified) {
    passwordInput.focus()
    e.preventDefault();
    toast('error', '가입 실패', '비밀번호가 일치하지 않습니다.');
    return;
  }

  if (!selectDepartment.value) {
    selectDepartment.focus()
    e.preventDefault();
    toast('error', '가입 실패', '학과를 선택 해주세요');
    return;
  }

  if (!selectGrade.value) {
    selectGrade.focus()
    toast('error', '가입 실패', '학년을 선택 해주세요');
    return;
  }

  register()
}

async function register() {
  const url = `${contextPath}/users`
  const response = await fetch(url, {
    method: "POST",
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      userId: userIdInput.value,
      email: emailInput.value,
      password: passwordInput.value,
      deptId: selectDepartment.value,
      grade: selectGrade.value
    })
  })

  const data = await response.json()

  if (!response.ok) {
    toast("error", data.message)
    return;
  }

  if (data.success) {
    window.location.replace(`${contextPath}/auth/login`);
    toast('success', "회원가입에 성공했습니다.")
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
    notificationsPadding: 70,
    gap: 20,
    distance: 50,
    type: 'outline',
    position: 'right top'
  });
}


