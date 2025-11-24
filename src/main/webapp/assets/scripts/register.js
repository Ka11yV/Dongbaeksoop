const submit = document.querySelector('#submit');
const userIdInput = document.querySelector('#userId');
const checkIdBtn = document.querySelector('#check-id');

checkIdBtn.addEventListener('click', async () => {
  const userId = userIdInput.value.trim();
  if (userId === '') {
    toast('error', '아이디를 입력해주세요');
    return;
  }

  const response = await fetch(`${contextPath}/users/check-id?id=${encodeURIComponent(userId)}`, {
    method: 'GET'
  });

  if(!response.ok) {
    toast("서버 에러");
  } else {
    toast('good')
  }








});



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