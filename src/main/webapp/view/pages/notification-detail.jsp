<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${notification.title} - 동백숲</title>
    <link href="${pageContext.request.contextPath}/assets/styles/output.css" rel="stylesheet">
    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
    <style>
        body {
            font-family: 'Pretendard', sans-serif;
            background-color: #F8FAFC;
            color: #0F172A;
        }
        .prose img {
            max-width: 100%;
            height: auto;
            border-radius: 0.5rem;
        }
    </style>
</head>
<body class="antialiased">
    <%@ include file="/view/common/header.jsp" %>

    <main class="pt-24 pb-12 min-h-screen">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Back Button -->
            <div class="mb-6">
                <a href="${pageContext.request.contextPath}/notifications" 
                   class="inline-flex items-center text-sm text-gray-500 hover:text-primary transition-colors">
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                    </svg>
                    목록으로 돌아가기
                </a>
            </div>

            <!-- Content Card -->
            <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                <!-- Header -->
                <div class="p-6 sm:p-8 border-b border-gray-100 bg-gray-50/50">
                    <div class="flex items-center gap-2 mb-4">
                        <span class="px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-50 text-blue-600 border border-blue-100">
                            공지사항
                        </span>
                        <span class="text-sm text-gray-500">${notification.postedDate}</span>
                    </div>
                    <h1 class="text-2xl sm:text-3xl font-bold text-gray-900 leading-tight mb-4">
                        ${notification.title}
                    </h1>
                    <div class="flex items-center justify-between">
                        <div class="flex items-center gap-2 text-sm text-gray-500">
                            <span>학과 ID: ${notification.deptId}</span>
                        </div>
                        <a href="${notification.url}" target="_blank" 
                           class="inline-flex items-center text-sm font-medium text-primary hover:text-secondary transition-colors">
                            원본 글 보러가기
                            <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"/>
                            </svg>
                        </a>
                    </div>
                </div>

                <!-- Body Content -->
                <div class="p-6 sm:p-8 prose prose-blue max-w-none">
                    ${notification.content}
                </div>

                <!-- AI Summary Section -->
                <div class="p-6 sm:p-8 bg-gradient-to-br from-indigo-50 to-purple-50 border-t border-indigo-100">
                    <div class="flex items-start gap-4">
                        <div class="flex-shrink-0 p-2 bg-white rounded-xl shadow-sm border border-indigo-100">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                            </svg>
                        </div>
                        <div class="flex-1">
                            <h3 class="text-lg font-bold text-gray-900 mb-2 flex items-center gap-2">
                                AI 요약
                                <span class="px-2 py-0.5 rounded text-[10px] font-medium bg-indigo-100 text-indigo-600">BETA</span>
                            </h3>
                            <div class="text-gray-700 leading-relaxed bg-white/60 rounded-xl p-4 border border-indigo-100/50">
                                <c:choose>
                                    <c:when test="${not empty notification.summation}">
                                        ${notification.summation}
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-gray-500 italic">요약된 내용이 없습니다.</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <p class="mt-2 text-xs text-gray-500">
                                * AI가 자동으로 요약한 내용이며, 정확하지 않을 수 있습니다. 반드시 원본 글을 확인해주세요.
                            </p>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </main>

    <%@ include file="/view/common/footer.jsp" %>
</body>
</html>
