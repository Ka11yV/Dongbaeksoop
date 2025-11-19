<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
  <title>동백숲</title>
</head>
<body>
  <%@ include file="/views/common/header.jsp"%>

  <div class="bg-gray-50 min-h-screen" data-name="HomePage" data-node-id="149:1242">
    <div class="relative h-[364px] overflow-hidden w-full" data-name="Section" data-node-id="149:1391">
      <div class="absolute inset-0 bg-[url('/assets/dongyang.jpg')] bg-cover bg-center" data-name="Container" data-node-id="149:1392"></div>
      <div class="absolute inset-0 bg-gradient-to-r from-[rgba(0,0,0,0.7)] to-[rgba(0,0,0,0.7)] via-50% via-[rgba(0,0,0,0.5)]" data-name="Container" data-node-id="149:1394"></div>
      <div class="relative z-10 flex flex-col gap-6 items-center justify-center h-full text-center px-4 max-w-4xl mx-auto" data-name="Container" data-node-id="149:1395">
        <h1 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-5xl text-white tracking-[0.3516px]" data-node-id="149:1397">
          동백숲에 오신 것을 환영합니다
        </h1>
        <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-xl text-gray-100 tracking-[-0.4492px]" data-node-id="149:1399">
          동양미래대 학생들을 위한 강의 평가와 맞춤형 공지 알림 서비스
        </p>
        <div class="flex gap-4" data-name="Container" data-node-id="149:1400">
          <a href="${pageContext.request.contextPath}/lecture-review" class="bg-white rounded-lg px-6 py-2 flex items-center justify-center" data-name="Link" data-node-id="149:1401">
            <p class="font-['Inter:Medium','Noto_Sans_KR:Regular',sans-serif] font-medium text-sm text-[#0062ad] text-center tracking-[-0.1504px]" data-node-id="149:1402">
              강의평가 보기
            </p>
          </a>
          <a href="${pageContext.request.contextPath}/notice-subscription-management" class="bg-[rgba(0,98,173,0.9)] rounded-lg px-6 py-2 flex items-center justify-center" data-name="Link" data-node-id="149:1403">
            <p class=" font-['Inter:Medium','Noto_Sans_KR:Regular',sans-serif] font-medium text-sm text-white text-center tracking-[-0.1504px]" data-node-id="149:1404">
              공지 구독하기
            </p>
          </a>
        </div>
      </div>
    </div>

    <%-- 카드 컨테이너   --%>
    <div class="container mx-auto py-16 px-4" data-name="Section" data-node-id="149:1243">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

        <%-- 카드1 --%>
        <div class="cursor-pointer hover:border-sky-700 bg-white border-2 border-[rgba(0,0,0,0.1)] border-solid rounded-xl p-6 flex flex-col items-start hover:border-primary" data-name="Link" data-node-id="149:1244">
          <div class="flex items-center justify-center bg-blue-100 rounded-lg w-12 h-12 mb-4" data-name="HomePage" data-node-id="149:1247">
            <img alt="" class="w-6 h-6" src="https://www.figma.com/api/mcp/asset/2dbeac9d-2a33-4eb8-b985-b05d6e517e65" data-name="Icon" data-node-id="149:1248" />
          </div>
          <h2 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-xl text-neutral-950 mb-2" data-node-id="149:1252">강의 평가</h2>
          <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-[#4a5565]" data-node-id="149:1254">
            실제 수강생들의 솔직한 강의 평가를 확인하고, 나의 경험도 공유해보세요.
          </p>
        </div>

        <%--   카드2     --%>
        <div class="cursor-pointer hover:border-sky-700 bg-white border-2 border-[rgba(0,0,0,0.1)] border-solid rounded-xl p-6 flex flex-col items-start" data-name="Link" data-node-id="149:1255">
          <div class="flex items-center justify-center bg-blue-100 rounded-lg w-12 h-12 mb-4" data-name="HomePage" data-node-id="149:1258">
            <img alt="" class="w-6 h-6" src="https://www.figma.com/api/mcp/asset/477819c6-e24f-4884-ac62-56f3c98ba028" data-name="Icon" data-node-id="149:1259" />
          </div>
          <h2 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-xl text-neutral-950 mb-2" data-node-id="149:1263">맞춤형 공지</h2>
          <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-[#4a5565]" data-node-id="149:1265">
            관심 있는 키워드로 필터링한 공지사항을 이메일로 받아보세요.
          </p>
        </div>

        <%--  카드3      --%>
        <div class="cursor-pointer hover:border-sky-700 bg-white border-2 border-[rgba(0,0,0,0.1)] border-solid rounded-xl p-6 flex flex-col items-start" data-name="Link" data-node-id="149:1266">
          <div class="flex items-center justify-center bg-blue-100 rounded-lg w-12 h-12 mb-4" data-name="HomePage" data-node-id="149:1269">
            <img alt="" class="w-6 h-6" src="https://www.figma.com/api/mcp/asset/bbcb7299-ccd3-41ac-bb22-ad0b7b96f1c8" data-name="Icon" data-node-id="149:1270" />
          </div>
          <h2 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-xl text-neutral-950 mb-2" data-node-id="149:1278">과제 관리 & 알림</h2>
          <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-[#4a5565]" data-node-id="149:1280">
            학교 포털과 연동하여 과제 마감일을 확인하고 이메일 알림을 받아보세요.
          </p>
        </div>
      </div>
    </div>


    <div class="container mx-auto py-16 px-4" data-name="Section" data-node-id="149:1281">
      <div class="flex justify-between items-center mb-8">
        <div class="flex items-center gap-2">
          <img alt="" class="w-6 h-6" src="https://www.figma.com/api/mcp/asset/027967c3-9f81-4b22-8b03-e07972eb2ad0" data-name="Icon" data-node-id="149:1284" />
          <h2 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-3xl text-neutral-950" data-node-id="149:1288">
            최신 강의 평가
          </h2>
        </div>
        <a href="${pageContext.request.contextPath}/lecture-review" class="text-[#0062ad] font-['Inter:Medium','Noto_Sans_KR:Regular',sans-serif] font-medium text-sm flex items-center gap-1" data-name="Link" data-node-id="149:1289">
          전체보기 &rarr;
        </a>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="hover:shadow-xl cursor-pointer bg-white border border-[rgba(0,0,0,0.1)] border-solid rounded-xl p-6 flex flex-col" data-name="Card" data-node-id="149:1292">
          <div class="flex justify-between items-start mb-2">
            <div>
              <h3 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-neutral-950" data-node-id="149:1297">웹 프로그래밍</h3>
              <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1299">김교수</p>
            </div>
            <span class="bg-[#eceef2] rounded-lg px-2 py-1 text-xs font-['Inter:Medium','Noto_Sans_KR:Regular',sans-serif] font-medium text-[#030213]" data-node-id="149:1301">전공</span>
          </div>
          <div class="flex justify-between items-center mb-4">
            <div class="flex items-center gap-1" data-name="StarRating" data-node-id="149:1303">
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/342765ce-7320-4862-9408-7c623a263959" />
              <p class="font-['Inter:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1320">4.5</p>
            </div>
            <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1322">난이도: 중</p>
          </div>
          <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-[#4a5565]" data-node-id="149:1324">
            과제는 많지만 배울 것이 많은 수업입니다.
          </p>
        </div>

        <div class="hover:shadow-xl cursor-pointer bg-white border border-[rgba(0,0,0,0.1)] border-solid rounded-xl p-6 flex flex-col" data-name="Card" data-node-id="149:1325">
          <div class="flex justify-between items-start mb-2">
            <div>
              <h3 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-neutral-950" data-node-id="149:1330">데이터베이스</h3>
              <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1332">이교수</p>
            </div>
            <span class="bg-[#eceef2] rounded-lg px-2 py-1 text-xs font-['Inter:Medium','Noto_Sans_KR:Regular',sans-serif] font-medium text-[#030213]" data-node-id="149:1334">전공</span>
          </div>
          <div class="flex justify-between items-center mb-4">
            <div class="flex items-center gap-1" data-name="StarRating" data-node-id="149:1336">
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/342765ce-7320-4862-9408-7c623a263959" />
              <p class="font-['Inter:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1353">4.8</p>
            </div>
            <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1355">난이도: 상</p>
          </div>
          <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-[#4a5565]" data-node-id="149:1357">
            어렵지만 실무에 정말 도움되는 강의예요.
          </p>
        </div>

        <div class="hover:shadow-xl cursor-pointer bg-white border border-[rgba(0,0,0,0.1)] border-solid rounded-xl p-6 flex flex-col" data-name="Card" data-node-id="149:1358">
          <div class="flex justify-between items-start mb-2">
            <div>
              <h3 class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-neutral-950" data-node-id="149:1363">영어회화</h3>
              <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1365">박교수</p>
            </div>
            <span class="bg-[#eceef2] rounded-lg px-2 py-1 text-xs font-['Inter:Medium','Noto_Sans_KR:Regular',sans-serif] font-medium text-[#030213]" data-node-id="149:1367">교양</span>
          </div>
          <div class="flex justify-between items-center mb-4">
            <div class="flex items-center gap-1" data-name="StarRating" data-node-id="149:1369">
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/1d45d47f-4044-4db6-8e46-3bc0aadb1b7f" />
              <img alt="" class="w-4 h-4" src="https://www.figma.com/api/mcp/asset/342765ce-7320-4862-9408-7c623a263959" />
              <p class="font-['Inter:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1386">4.2</p>
            </div>
            <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-sm text-[#4a5565]" data-node-id="149:1388">난이도: 하</p>
          </div>
          <p class="font-['Inter:Regular','Noto_Sans_KR:Regular',sans-serif] font-normal text-base text-[#4a5565]" data-node-id="149:1390">
            편한 분위기에서 즐겁게 배울 수 있어요.
          </p>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="/views/common/footer.jsp"%>
</body>
</html>