<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동백숲 - 대학 생활의 모든 것</title>
    <link href="${pageContext.request.contextPath}/styles/output.css" rel="stylesheet">
    <style>
      body {
        font-family: 'Pretendard', sans-serif;
        background-color: #F8FAFC;
        color: #0F172A;
      }

      .glass-header {
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border-bottom: 1px solid rgba(255, 255, 255, 0.3);
      }

      @keyframes blob {
        0% {
          transform: translate(0px, 0px) scale(1);
        }

        33% {
          transform: translate(30px, -50px) scale(1.1);
        }

        66% {
          transform: translate(-20px, 20px) scale(0.9);
        }

        100% {
          transform: translate(0px, 0px) scale(1);
        }
      }

      .animate-blob {
        animation: blob 7s infinite;
      }

      .animation-delay-2000 {
        animation-delay: 2s;
      }

      .animation-delay-4000 {
        animation-delay: 4s;
      }

      .reveal {
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.8s ease-out;
      }

      .reveal.active {
        opacity: 1;
        transform: translateY(0);
      }
    </style>
  </head>

  <body class="antialiased">
    <%@ include file="/view/common/header.jsp" %>

      <!-- Main Content Placeholder -->
      <main class="pt-16">
        <!-- Hero Section -->
        <section class="relative min-h-screen flex items-center justify-center overflow-hidden bg-white pt-16">
          <!-- Background Elements -->
          <div class="absolute inset-0 z-0">
            <div
              class="absolute top-0 left-1/2 -translate-x-1/2 w-full h-full bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-blue-100 via-white to-white opacity-70">
            </div>
            <div
              class="absolute top-20 right-20 w-72 h-72 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob">
            </div>
            <div
              class="absolute top-40 left-20 w-72 h-72 bg-purple-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-2000">
            </div>
            <div
              class="absolute -bottom-8 left-1/2 w-72 h-72 bg-pink-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000">
            </div>
          </div>

          <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <div class="space-y-8">
              <h1 class="text-5xl md:text-7xl font-extrabold tracking-tight text-dark mb-6 leading-tight">
                대학 생활의 모든 것,<br>
                <span class="text-transparent bg-clip-text bg-gradient-to-r from-primary to-purple-600">동백숲</span>에서
                시작하세요
              </h1>
              <p class="text-xl md:text-2xl text-gray-600 max-w-2xl mx-auto mb-10 leading-relaxed">
                공지 구독부터 과제 알림, 강의 평가까지.<br>
                더 스마트하고 즐거운 캠퍼스 라이프를 위한 필수 플랫폼.
              </p>
              <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                <a href="#features"
                  class="px-8 py-4 bg-primary hover:bg-secondary text-white text-lg font-semibold rounded-full shadow-lg shadow-blue-500/30 hover:shadow-blue-500/40 transition-all transform hover:-translate-y-1">
                  기능 살펴보기
                </a>
                <a href="${pageContext.request.contextPath}/register"
                  class="px-8 py-4 bg-white hover:bg-gray-50 text-gray-700 text-lg font-semibold rounded-full border border-gray-200 shadow-sm hover:shadow-md transition-all transform hover:-translate-y-1">
                  지금 시작하기
                </a>
              </div>
            </div>
          </div>

          <!-- Scroll Down Indicator -->
          <div class="absolute bottom-10 left-1/2 transform -translate-x-1/2 animate-bounce">
            <svg class="w-6 h-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3">
              </path>
            </svg>
          </div>
        </section>

        <!-- Features Section -->
        <section id="features" class="py-24 bg-gray-50">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-16 reveal">
              <h2 class="text-primary font-semibold tracking-wide uppercase text-sm mb-2">Features</h2>
              <h3 class="text-3xl md:text-4xl font-bold text-dark">더 편리한 학교 생활을 위한 핵심 기능</h3>
              <p class="mt-4 text-xl text-gray-600">동백숲이 제공하는 특별한 기능들을 만나보세요.</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-10">
              <!-- Feature 1: Notice Subscription -->
              <div
                class="bg-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-300 border border-gray-100 reveal group">
                <div
                  class="w-14 h-14 bg-blue-100 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                  <svg class="w-7 h-7 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9">
                    </path>
                  </svg>
                </div>
                <h4 class="text-xl font-bold text-dark mb-3">맞춤형 공지 구독</h4>
                <p class="text-gray-600 leading-relaxed">
                  학교 공지부터 학과 공지까지.<br>
                  원하는 키워드로 필터링하여 중요한 소식을 이메일로 가장 먼저 받아보세요.
                </p>
              </div>

              <!-- Feature 2: Assignment Deadline -->
              <div
                class="bg-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-300 border border-gray-100 reveal group"
                style="transition-delay: 100ms;">
                <div
                  class="w-14 h-14 bg-red-100 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                  <svg class="w-7 h-7 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                  </svg>
                </div>
                <h4 class="text-xl font-bold text-dark mb-3">과제 마감 알림</h4>
                <p class="text-gray-600 leading-relaxed">
                  놓치기 쉬운 과제 마감일.<br>
                  마감 전 미리 메일로 알려드려 여유롭게 과제를 제출할 수 있도록 도와드립니다.
                </p>
              </div>

              <!-- Feature 3: Course Evaluation -->
              <div
                class="bg-white rounded-2xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-300 border border-gray-100 reveal group"
                style="transition-delay: 200ms;">
                <div
                  class="w-14 h-14 bg-green-100 rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                  <svg class="w-7 h-7 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01">
                    </path>
                  </svg>
                </div>
                <h4 class="text-xl font-bold text-dark mb-3">솔직한 강의 평가</h4>
                <p class="text-gray-600 leading-relaxed">
                  수강 신청 전 필수 확인!<br>
                  선배들의 생생한 강의 후기와 꿀팁을 확인하고 실패 없는 시간표를 만들어보세요.
                </p>
              </div>
            </div>
          </div>
        </section>

        <!-- Detailed Feature 1: Notice Subscription -->
        <section class="py-24 overflow-hidden">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col md:flex-row items-center gap-16">
              <div class="w-full md:w-1/2 reveal">
                <div class="inline-block px-4 py-1 rounded-full bg-blue-100 text-primary font-semibold text-sm mb-6">
                  Smart Notification</div>
                <h3 class="text-4xl md:text-5xl font-bold text-dark mb-6 leading-tight">
                  중요한 공지,<br>
                  <span class="text-primary">놓치지 말고</span> 확인하세요.
                </h3>
                <p class="text-lg text-gray-600 mb-8 leading-relaxed">
                  수많은 학교 공지사항 중 나에게 필요한 정보만 골라보세요.<br>
                  '장학금', '휴강', '특강' 등 원하는 키워드를 등록하면<br>
                  새로운 공지가 올라올 때마다 이메일로 즉시 알려드립니다.
                </p>
                <ul class="space-y-4 mb-8">
                  <li class="flex items-center text-gray-700">
                    <svg class="w-5 h-5 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    학과/학교 홈페이지 통합 모니터링
                  </li>
                  <li class="flex items-center text-gray-700">
                    <svg class="w-5 h-5 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    실시간 키워드 매칭 알림
                  </li>
                  <li class="flex items-center text-gray-700">
                    <svg class="w-5 h-5 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                    스팸 없는 깔끔한 요약 메일
                  </li>
                </ul>
              </div>
              <div class="w-full md:w-1/2 reveal" style="transition-delay: 200ms;">
                <!-- Visual: Email Notification Mock -->
                <div
                  class="relative bg-white rounded-2xl shadow-2xl border border-gray-100 p-6 transform rotate-2 hover:rotate-0 transition-transform duration-500">
                  <div class="flex items-center space-x-2 mb-6">
                    <div class="w-3 h-3 rounded-full bg-red-400"></div>
                    <div class="w-3 h-3 rounded-full bg-yellow-400"></div>
                    <div class="w-3 h-3 rounded-full bg-green-400"></div>
                  </div>
                  <div class="space-y-4">
                    <div class="flex items-center p-4 bg-blue-50 rounded-xl border border-blue-100">
                      <div
                        class="w-10 h-10 rounded-full bg-blue-200 flex items-center justify-center text-blue-600 mr-4">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9">
                          </path>
                        </svg>
                      </div>
                      <div>
                        <p class="text-sm font-bold text-gray-800">[장학] 2024-2학기 국가장학금 신청 안내</p>
                        <p class="text-xs text-gray-500">방금 전 도착 • 키워드: 장학금</p>
                      </div>
                    </div>
                    <div class="flex items-center p-4 bg-white rounded-xl border border-gray-100 opacity-60">
                      <div
                        class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center text-gray-400 mr-4">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z">
                          </path>
                        </svg>
                      </div>
                      <div>
                        <p class="text-sm font-bold text-gray-800">[학사] 수강신청 정정 기간 안내</p>
                        <p class="text-xs text-gray-500">1시간 전 도착</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- Detailed Feature 2: Deadline Notification -->
        <section class="py-24 bg-gray-900 text-white overflow-hidden">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col md:flex-row-reverse items-center gap-16">
              <div class="w-full md:w-1/2 reveal">
                <div class="inline-block px-4 py-1 rounded-full bg-red-500/20 text-red-300 font-semibold text-sm mb-6">
                  Deadline Manager</div>
                <h3 class="text-4xl md:text-5xl font-bold mb-6 leading-tight">
                  과제 마감,<br>
                  <span class="text-red-400">불안해하지 마세요.</span>
                </h3>
                <p class="text-lg text-gray-400 mb-8 leading-relaxed">
                  "아 맞다, 과제!" 하고 놀란 적 있으신가요?<br>
                  동백숲이 마감 3일 전, 1일 전, 3시간 전에 미리 알려드립니다.<br>
                  모든 과제 일정을 한눈에 파악하고 여유롭게 제출하세요.
                </p>
                <a href="${pageContext.request.contextPath}/assignments"
                  class="inline-flex items-center text-white font-semibold hover:text-red-300 transition-colors">
                  알림 설정하러 가기
                  <svg class="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3">
                    </path>
                  </svg>
                </a>
              </div>
              <div class="w-full md:w-1/2 reveal" style="transition-delay: 200ms;">
                <!-- Visual: Calendar/Timer Mock -->
                <div class="relative bg-gray-800 rounded-2xl shadow-2xl border border-gray-700 p-8">
                  <div
                    class="absolute -top-6 -right-6 w-24 h-24 bg-red-500 rounded-full opacity-20 blur-2xl animate-pulse">
                  </div>
                  <div class="flex justify-between items-end mb-8">
                    <div>
                      <p class="text-gray-400 text-sm mb-1">다음 마감 과제</p>
                      <h4 class="text-2xl font-bold text-white">웹 프로그래밍 기초</h4>
                    </div>
                    <div class="text-right">
                      <span
                        class="inline-block px-3 py-1 bg-red-500/20 text-red-400 rounded-lg text-sm font-bold animate-pulse">D-1</span>
                    </div>
                  </div>
                  <div class="space-y-4">
                    <div>
                      <div class="flex justify-between text-sm mb-2">
                        <span class="text-gray-300">남은 시간</span>
                        <span class="text-red-300 font-mono">23:59:42</span>
                      </div>
                      <div class="w-full bg-gray-700 rounded-full h-2">
                        <div class="bg-gradient-to-r from-red-500 to-orange-500 h-2 rounded-full" style="width: 85%">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <!-- Detailed Feature 3: Course Evaluation -->
        <section class="py-24 overflow-hidden bg-white">
          <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col md:flex-row items-center gap-16">
              <div class="w-full md:w-1/2 reveal">
                <div class="inline-block px-4 py-1 rounded-full bg-green-100 text-green-600 font-semibold text-sm mb-6">
                  Course Review</div>
                <h3 class="text-4xl md:text-5xl font-bold text-dark mb-6 leading-tight">
                  실패 없는 수강신청,<br>
                  <span class="text-green-600">선배들의 꿀팁</span>으로.
                </h3>
                <p class="text-lg text-gray-600 mb-8 leading-relaxed">
                  "이 교수님 과제 많나요?", "학점 잘 주시나요?"<br>
                  궁금했던 강의 정보, 이제 동백숲에서 확인하세요.<br>
                  익명으로 작성된 솔직한 강의 평가를 공유합니다.
                </p>
                <div class="flex gap-4">
                  <div class="text-center">
                    <p class="text-3xl font-bold text-dark">5,000+</p>
                    <p class="text-sm text-gray-500">누적 강의평</p>
                  </div>
<%--                    <div class="w-px bg-gray-200"></div>--%>
<%--                    <div class="text-center">--%>
<%--                      <p class="text-3xl font-bold text-dark">4.8/5</p>--%>
<%--                      <p class="text-sm text-gray-500">사용자 만족도</p>--%>
<%--                  </div>--%>
                </div>
              </div>
              <div class="w-full md:w-1/2 reveal" style="transition-delay: 200ms;">
                <!-- Visual: Review Card Mock -->
                <div class="grid grid-cols-1 gap-4">
                  <div
                    class="bg-white rounded-2xl shadow-xl border border-gray-100 p-6 transform hover:-translate-y-1 transition-transform duration-300">
                    <div class="flex justify-between items-start mb-4">
                      <div>
                        <h5 class="font-bold text-lg text-dark">알고리즘 분석</h5>
                        <p class="text-sm text-gray-500">김동양 교수님</p>
                      </div>
                      <div class="flex items-center bg-green-50 px-2 py-1 rounded-lg">
                        <span class="font-bold text-green-700">4.8</span>
                      </div>
                    </div>
                    <p class="text-gray-600 text-sm leading-relaxed mb-4">
                      "교수님 설명이 정말 명쾌하십니다. 과제는 좀 있지만 얻어가는 게 많은 수업이에요. 시험은 수업 시간에 강조하신 내용 위주로 나옵니다. 강추!"
                    </p>
                    <div class="flex gap-2">
                      <span class="px-2 py-1 bg-gray-100 text-gray-500 text-xs rounded">#과제많음</span>
                      <span class="px-2 py-1 bg-gray-100 text-gray-500 text-xs rounded">#학점느님</span>
                      <span class="px-2 py-1 bg-gray-100 text-gray-500 text-xs rounded">#명강의</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

<%--        <!-- Bottom CTA Section -->--%>
<%--        <section class="py-20 bg-primary relative overflow-hidden">--%>
<%--          <div class="absolute inset-0">--%>
<%--            <div class="absolute top-0 left-0 w-full h-full bg-gradient-to-r from-primary to-blue-600 opacity-90"></div>--%>
<%--            <div--%>
<%--              class="absolute -top-24 -right-24 w-96 h-96 bg-white rounded-full mix-blend-overlay filter blur-3xl opacity-20 animate-blob">--%>
<%--            </div>--%>
<%--            <div--%>
<%--              class="absolute -bottom-24 -left-24 w-96 h-96 bg-purple-300 rounded-full mix-blend-overlay filter blur-3xl opacity-20 animate-blob animation-delay-2000">--%>
<%--            </div>--%>
<%--          </div>--%>

<%--          <div class="relative z-10 max-w-4xl mx-auto px-4 text-center text-white">--%>
<%--            <h2 class="text-3xl md:text-5xl font-bold mb-6">지금 바로 동백숲을 시작하세요</h2>--%>
<%--            <p class="text-lg md:text-xl text-blue-100 mb-10">--%>
<%--              더 스마트한 대학 생활, 동백숲과 함께라면 가능합니다.<br>--%>
<%--              지금 가입하고 모든 기능을 무료로 이용해보세요.--%>
<%--            </p>--%>
<%--            <div class="flex flex-col sm:flex-row items-center justify-center gap-4">--%>
<%--              <a href="${pageContext.request.contextPath}/register"--%>
<%--                class="w-full sm:w-auto px-8 py-4 bg-white text-primary text-lg font-bold rounded-full shadow-lg hover:bg-gray-50 transition-all transform hover:-translate-y-1">--%>
<%--                무료로 시작하기--%>
<%--              </a>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </section>--%>

        <!-- Scroll to Top Button -->
        <button id="scrollToTopBtn"
          class="fixed bottom-8 right-8 bg-primary text-white p-3 rounded-full shadow-lg hover:bg-secondary transition-all duration-300 transform translate-y-20 opacity-0 z-50 focus:outline-none">
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
          </svg>
        </button>

        <script>
          // Simple Intersection Observer for scroll animations
          document.addEventListener('DOMContentLoaded', () => {
            const reveals = document.querySelectorAll('.reveal');

            const revealOnScroll = () => {
              const windowHeight = window.innerHeight;
              const elementVisible = 150;

              reveals.forEach((reveal) => {
                const elementTop = reveal.getBoundingClientRect().top;
                if (elementTop < windowHeight - elementVisible) {
                  reveal.classList.add('active');
                }
              });
            };

            window.addEventListener('scroll', revealOnScroll);
            // Trigger once on load
            revealOnScroll();

            // Scroll to Top Logic
            const scrollToTopBtn = document.getElementById('scrollToTopBtn');

            window.addEventListener('scroll', () => {
              if (window.scrollY > 300) {
                scrollToTopBtn.classList.remove('translate-y-20', 'opacity-0');
              } else {
                scrollToTopBtn.classList.add('translate-y-20', 'opacity-0');
              }
            });

            scrollToTopBtn.addEventListener('click', () => {
              window.scrollTo({
                top: 0,
                behavior: 'smooth'
              });
            });
          });
        </script>
      </main>

      <%@ include file="/view/common/footer.jsp" %>
  </body>

  </html>