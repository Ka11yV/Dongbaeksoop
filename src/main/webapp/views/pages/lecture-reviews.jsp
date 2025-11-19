<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
    <title>동백숲</title>
</head>
<body>
    <%@ include file="/views/common/header.jsp"%>
    <div class="bg-gray-50 py-8">
        <div class="container mx-auto max-w-4xl px-4">
            <div class="mt-4 mb-8 flex flex-col gap-2">
                <h1 class="text-4xl font-medium tracking-tight text-neutral-950">강의 평가</h1>
                <p class="text-base font-normal text-gray-600">원하는 강의를 선택하고 실제 수강생들의 평가를 확인해보세요</p>
            </div>

            <div class="mb-8 w-full rounded-2xl border border-black/10 bg-white p-4 shadow-sm md:p-6">
                <div class="relative mb-4 w-full">
                    <input type="text" placeholder="강의명 또는 교수명 검색..." class="h-10 w-full rounded-lg border border-transparent bg-zinc-100 py-1 pr-3 pl-10 text-sm font-normal text-gray-500 placeholder-gray-500 focus:ring-2 focus:ring-sky-700 focus:outline-none" />
                    <svg class="absolute top-2 left-3 h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </div>

                <div class="flex flex-wrap gap-3">
                    <div class="flex h-10 w-40 cursor-pointer items-center justify-between rounded-lg border border-transparent bg-zinc-100 px-3">
                        <span class="text-sm leading-5 font-normal text-neutral-950">전체</span>
                        <svg class="h-4 w-4 shrink-0 text-gray-500 opacity-50" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                        </svg>
                    </div>
                    <div class="flex h-10 w-40 cursor-pointer items-center justify-between rounded-lg border border-transparent bg-zinc-100 px-3">
                        <span class="text-sm leading-5 font-normal text-neutral-950">평점순</span>
                        <svg class="h-4 w-4 shrink-0 text-gray-500 opacity-50" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                        </svg>
                    </div>
                </div>
            </div>

            <p class="mb-6 text-base font-normal text-gray-600">총 <span class="text-sky-700">8</span>개의 강의</p>

            <div class="flex w-full flex-col gap-4">
                <div class="flex w-full cursor-pointer items-start rounded-2xl border border-l-4 border-sky-700/50 bg-white p-6 transition hover:shadow-lg">
                    <div class="flex flex-1 flex-col justify-start gap-2 pr-4 md:pr-10">
                        <div class="flex items-center gap-2">
                            <h3 class="truncate text-lg leading-7 font-normal text-neutral-950">데이터베이스</h3>
                            <span class="shrink-0 rounded-lg bg-sky-700 px-2 py-0.5 text-xs leading-4 font-medium text-white">전공</span>
                        </div>
                        <div class="flex flex-wrap items-center gap-x-4 text-sm font-normal text-gray-600">
                            <span>이교수</span>
                            <span class="text-gray-400">•</span>
                            <span>소프트웨어과</span>
                            <span class="text-gray-400">•</span>
                            <span class="flex items-center gap-1">
              <svg class="h-3.5 w-3.5 shrink-0 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3h9m-9 3h9m-3 1.5a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              18개의 리뷰
            </span>
                        </div>
                        <p class="mt-1 truncate text-sm font-normal text-gray-500">"어렵지만 실무에 도움되는 강의"</p>
                    </div>

                    <div class="flex shrink-0 items-center gap-3">
                        <div class="flex flex-col items-end gap-1">
                            <div class="flex items-center gap-1">
                                <div class="flex text-yellow-400">
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5 text-yellow-200" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                </div>
                            </div>
                            <div class="flex items-baseline text-right">
                                <span class="text-sm font-normal text-sky-700">4.8</span>
                                <span class="text-sm font-normal text-gray-400">/5.0</span>
                            </div>
                        </div>
                        <svg class="h-5 w-5 shrink-0 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                        </svg>
                    </div>
                </div>

                <div class="flex w-full cursor-pointer items-start rounded-2xl border border-l-4 border-sky-700/50 bg-white p-6 transition hover:shadow-lg">
                    <div class="flex flex-1 flex-col justify-start gap-2 pr-4 md:pr-10">
                        <div class="flex items-center gap-2">
                            <h3 class="truncate text-lg leading-7 font-normal text-neutral-950">알고리즘</h3>
                            <span class="shrink-0 rounded-lg bg-sky-700 px-2 py-0.5 text-xs leading-4 font-medium text-white">전공</span>
                        </div>
                        <div class="flex flex-wrap items-center gap-x-4 text-sm font-normal text-gray-600">
                            <span>한교수</span>
                            <span class="text-gray-400">•</span>
                            <span>소프트웨어과</span>
                            <span class="text-gray-400">•</span>
                            <span class="flex items-center gap-1">
              <svg class="h-3.5 w-3.5 shrink-0 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3h9m-9 3h9m-3 1.5a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              20개의 리뷰
            </span>
                        </div>
                        <p class="mt-1 truncate text-sm font-normal text-gray-500">"문제 해결 능력이 많이 향상됩니다"</p>
                    </div>
                    <div class="flex shrink-0 items-center gap-3">
                        <div class="flex flex-col items-end gap-1">
                            <div class="flex items-center gap-1">
                                <div class="flex text-yellow-400">
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5 text-yellow-200" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                </div>
                            </div>
                            <div class="flex items-baseline text-right">
                                <span class="text-sm font-normal text-sky-700">4.7</span>
                                <span class="text-sm font-normal text-gray-400">/5.0</span>
                            </div>
                        </div>
                        <svg class="h-5 w-5 shrink-0 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                        </svg>
                    </div>
                </div>

                <div class="flex w-full cursor-pointer items-start rounded-2xl border border-l-4 border-sky-700/50 bg-white p-6 transition hover:shadow-lg">
                    <div class="flex flex-1 flex-col justify-start gap-2 pr-4 md:pr-10">
                        <div class="flex items-center gap-2">
                            <h3 class="truncate text-lg leading-7 font-normal text-neutral-950">자료구조</h3>
                            <span class="shrink-0 rounded-lg bg-sky-700 px-2 py-0.5 text-xs leading-4 font-medium text-white">전공</span>
                        </div>
                        <div class="flex flex-wrap items-center gap-x-4 text-sm font-normal text-gray-600">
                            <span>최교수</span>
                            <span class="text-gray-400">•</span>
                            <span>소프트웨어과</span>
                            <span class="text-gray-400">•</span>
                            <span class="flex items-center gap-1">
              <svg class="h-3.5 w-3.5 shrink-0 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3h9m-9 3h9m-3 1.5a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              15개의 리뷰
            </span>
                        </div>
                        <p class="mt-1 truncate text-sm font-normal text-gray-500">"과제는 어렵지만 성취감이 커요"</p>
                    </div>
                    <div class="flex shrink-0 items-center gap-3">
                        <div class="flex flex-col items-end gap-1">
                            <div class="flex items-center gap-1">
                                <div class="flex text-yellow-400">
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5 text-yellow-200" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                </div>
                            </div>
                            <div class="flex items-baseline text-right">
                                <span class="text-sm font-normal text-sky-700">4.6</span>
                                <span class="text-sm font-normal text-gray-400">/5.0</span>
                            </div>
                        </div>
                        <svg class="h-5 w-5 shrink-0 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                        </svg>
                    </div>
                </div>

                <div class="flex w-full cursor-pointer items-start rounded-2xl border border-l-4 border-sky-700/50 bg-white p-6 transition hover:shadow-lg">
                    <div class="flex flex-1 flex-col justify-start gap-2 pr-4 md:pr-10">
                        <div class="flex items-center gap-2">
                            <h3 class="truncate text-lg leading-7 font-normal text-neutral-950">웹 프로그래밍</h3>
                            <span class="shrink-0 rounded-lg bg-sky-700 px-2 py-0.5 text-xs leading-4 font-medium text-white">전공</span>
                        </div>
                        <div class="flex flex-wrap items-center gap-x-4 text-sm font-normal text-gray-600">
                            <span>김교수</span>
                            <span class="text-gray-400">•</span>
                            <span>소프트웨어과</span>
                            <span class="text-gray-400">•</span>
                            <span class="flex items-center gap-1">
              <svg class="h-3.5 w-3.5 shrink-0 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3h9m-9 3h9m-3 1.5a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              12개의 리뷰
            </span>
                        </div>
                        <p class="mt-1 truncate text-sm font-normal text-gray-500">"실습 위주라 배울 것이 많아요"</p>
                    </div>
                    <div class="flex shrink-0 items-center gap-3">
                        <div class="flex flex-col items-end gap-1">
                            <div class="flex items-center gap-1">
                                <div class="flex text-yellow-400">
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5 text-yellow-200" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                </div>
                            </div>
                            <div class="flex items-baseline text-right">
                                <span class="text-sm font-normal text-sky-700">4.5</span>
                                <span class="text-sm font-normal text-gray-400">/5.0</span>
                            </div>
                        </div>
                        <svg class="h-5 w-5 shrink-0 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                        </svg>
                    </div>
                </div>

                <div class="flex w-full cursor-pointer items-start rounded-2xl border border-l-4 border-sky-700/50 bg-white p-6 transition hover:shadow-lg">
                    <div class="flex flex-1 flex-col justify-start gap-2 pr-4 md:pr-10">
                        <div class="flex items-center gap-2">
                            <h3 class="truncate text-lg leading-7 font-normal text-neutral-950">네트워크</h3>
                            <span class="shrink-0 rounded-lg bg-sky-700 px-2 py-0.5 text-xs leading-4 font-medium text-white">전공</span>
                        </div>
                        <div class="flex flex-wrap items-center gap-x-4 text-sm font-normal text-gray-600">
                            <span>강교수</span>
                            <span class="text-gray-400">•</span>
                            <span>전기전자과</span>
                            <span class="text-gray-400">•</span>
                            <span class="flex items-center gap-1">
              <svg class="h-3.5 w-3.5 shrink-0 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3h9m-9 3h9m-3 1.5a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              10개의 리뷰
            </span>
                        </div>
                        <p class="mt-1 truncate text-sm font-normal text-gray-500">"이론과 실습이 적절히 섞여있어요"</p>
                    </div>
                    <div class="flex shrink-0 items-center gap-3">
                        <div class="flex flex-col items-end gap-1">
                            <div class="flex items-center gap-1">
                                <div class="flex text-yellow-400">
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5 text-yellow-200" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                </div>
                            </div>
                            <div class="flex items-baseline text-right">
                                <span class="text-sm font-normal text-sky-700">4.3</span>
                                <span class="text-sm font-normal text-gray-400">/5.0</span>
                            </div>
                        </div>
                        <svg class="h-5 w-5 shrink-0 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                        </svg>
                    </div>
                </div>

                <div class="flex w-full cursor-pointer items-start rounded-2xl border border-l-4 border-sky-700/50 bg-white p-6 transition hover:shadow-lg">
                    <div class="flex flex-1 flex-col justify-start gap-2 pr-4 md:pr-10">
                        <div class="flex items-center gap-2">
                            <h3 class="truncate text-lg leading-7 font-normal text-neutral-950">영어회화</h3>
                            <span class="shrink-0 rounded-lg bg-gray-100 px-2 py-0.5 text-xs leading-4 font-medium text-gray-950">교양</span>
                        </div>
                        <div class="flex flex-wrap items-center gap-x-4 text-sm font-normal text-gray-600">
                            <span>박교수</span>
                            <span class="text-gray-400">•</span>
                            <span>교양과</span>
                            <span class="text-gray-400">•</span>
                            <span class="flex items-center gap-1">
              <svg class="h-3.5 w-3.5 shrink-0 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3h9m-9 3h9m-3 1.5a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              8개의 리뷰
            </span>
                        </div>
                        <p class="mt-1 truncate text-sm font-normal text-gray-500">"편한 분위기에서 즐겁게 배워요"</p>
                    </div>
                    <div class="flex shrink-0 items-center gap-3">
                        <div class="flex flex-col items-end gap-1">
                            <div class="flex items-center gap-1">
                                <div class="flex text-yellow-400">
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                    <svg class="h-5 w-5 text-yellow-200" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.071 3.292a1 1 0 00.95.694h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.031a1 1 0 00-.364 1.118l1.071 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.031a1 1 0 00-1.175 0l-2.8 2.031c-.784.57-1.838-.197-1.539-1.118l1.071-3.292a1 1 0 00-.364-1.118l-2.8-2.031c-.783-.57-.381-1.81.588-1.81h3.462a1 1 0 00.95-.694l1.071-3.292z" /></svg>
                                </div>
                            </div>
                            <div class="flex items-baseline text-right">
                                <span class="text-sm font-normal text-sky-700">4.2</span>
                                <span class="text-sm font-normal text-gray-400">/5.0</span>
                            </div>
                        </div>
                        <svg class="h-5 w-5 shrink-0 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                        </svg>
                    </div>
                </div>
            </div>

            <div class="mt-8 flex items-center justify-center gap-1">
                <button class="flex h-9 w-24 cursor-not-allowed items-center justify-center rounded-lg p-2 text-sm font-medium text-neutral-950 opacity-50 disabled:opacity-30" disabled>
                    <svg class="mr-2 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                    </svg>
                    Previous
                </button>

                <button class="flex h-9 w-9 items-center justify-center rounded-lg border border-black/10 bg-white text-sm font-medium text-neutral-950">1</button>

                <button class="flex h-9 w-9 items-center justify-center rounded-lg text-sm font-medium text-neutral-950 transition hover:bg-gray-100">2</button>

                <button class="flex h-9 w-20 items-center justify-center rounded-lg p-2 text-sm font-medium text-neutral-950 transition hover:bg-gray-100">
                    Next
                    <svg class="ml-2 h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <%@ include file="/views/common/footer.jsp"%>
</body>
</html>
