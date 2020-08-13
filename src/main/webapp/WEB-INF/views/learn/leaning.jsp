<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kimbogeun
  Date: 2020/08/08
  Time: 5:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학습하기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/learn/learn.css">
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <style>
        .container {
            padding: 0;
        }

    </style>
</head>
<body>
    <div class="container-xg">
        <header class="leaning-header-wrap">
            <div class="leaning-header">
                <div class="leaning-header-left">
                    <button class="text btn btn-secondary btn-custom-option text-weight-medium header-btn-back">
                        <i class="icon_chevron-left"></i>
                        학습 끝내기
                    </button>
                    <ul class="header-index">
                        <li class="text">내 학습보드</li>
                        <li class="text">${currentArticle.title}</li>
                    </ul>
                </div>
                <div class="leaning-header-right">
                    <div id="header-profile" class="text leaning-header-profile">코</div>
                    <i for="header-profile" class="drop-down"></i>
                </div>
            </div>
        </header>
        <article class="leaning-current-article-wrap">
            <div class="container">
                <div class="leaning-current-article leaning-current-article-tags mb-2">
                    <span class="leaning-current-article-category text text-weight-light badge badge-neutral">${currentArticle.category}</span>
                    <span class="leaning-current-article-hashtag text body1 text-color-gray300">${currentArticle.hashtag}</span>
                </div>
                <div class="leaning-current-article leaning-current-article-contents mb-3">
                    <div class="leaning-current-article-left">
                        <div class="leaning-current-article-title text h2 mb-2">
                            ${currentArticle.title}
                        </div>
                        <div class="leaning-current-article-content text h6 text-weight-light text-color-gray200 mb-2">
                            ${currentArticle.summary}
                        </div>
                        <div class="leaning-current-article-date text body1 text-weight-light text-color-gray300 mb-2">
                            발행일 : <span>${currentArticle.reg_date}</span>
                        </div>
                    </div>
                    <div class="leaning-current-article-right">
                        <c:if test="${currentArticle.file_contents ne null}">
                            <img src="${currentArticle.file_contents}">
                        </c:if>
                        <c:if test="${currentArticle.file_contents eq null}">
                            <img src="/images/SoftwareDevelopment-Scanrail-adobe.jpg">
                        </c:if>
                    </div>
                </div>
                <div class="leaning-current-progress-wrap mb-4">
                    <div class="leaning-current-progress-status mb-2">
                        <div class="leaning-current-progress-status-title text h6 text-weight-medium">전체 학습 진도</div>
                        <div class="leaning-current-progress-status-percent text h3 text-weight-bold">32%</div>
                    </div>
                    <div class="leaning-current-progress-bar">
                        <div class="leaning-current-progress-bar"></div>
                        <div class="leaning-current-progress-bar-success"></div>
                    </div>
                </div>
            </div>
        </article>
        <header class="leaning-sub-header">
            <div class="leaning-sub-header container">
                <div class="leaning-sub-header-tab-wrap">
                    <ul class="leaning-sub-header-tab" id="learnTab">
                        <li class="text active">단어 학습하기</li>
                        <li class="text">문장 학습하기</li>
                    </ul>
                </div>
                <div class="leaning-sub-header-sticky-title">
                    <span class="text h6">${currentArticle.title}</span>
                </div>
                <div class="leaning-sub-header-original">
                    <button class="btn btn-outline-secondary btn-custom-option btn-link">
                        <i class="icon_link"></i>
                        원문보기
                    </button>
                </div>
            </div>
        </header>
        <section class="leaning-contents-wrap container">
            <div class="leaning-contents-left">
                <div class="leaning-contents-left-top">
                    <div class="leaning-progress">
                        <div class="leaning-circle-bg">
                            <span class="leaning-progress-percent">
                                <span>0</span>
                                <span class="leaning-progress-span">단어 학습 진도</span>
                            </span>
                        </div>
                        <canvas class="leaning-progress-canvas" width="162" height="162"/>
                    </div>
                </div>
                <div class="leaning-contents-left-down">
                    <ul class="leaning-contents-word-set" id="wordSet">
                        <li>
                            <span>단어 세트 1</span>
                            <div class="leaning-contents-word-count-wrap">
                                <span class="leaning-contents-word-count"><span class="font-point">5</span>/10</span>
                            </div>
                        </li>
                        <li>
                            <span>단어 세트 2</span>
                            <div class="leaning-contents-word-count-wrap">
                                <span class="leaning-contents-word-count"><span class="font-point">5</span>/10</span>
                            </div>
                        </li>
                        <li>
                            <span>단어 세트 3</span>
                            <div class="leaning-contents-word-count-wrap">
                                <span class="leaning-contents-word-count"><span class="font-point">5</span>/10</span>
                            </div>
                        </li>
                        <li>
                            <span>단어 세트 4</span>
                            <div class="leaning-contents-word-count-wrap">
                                <span class="leaning-contents-word-count"><span class="font-point">5</span>/10</span>
                            </div>
                        </li>
                        <li>
                            <span>단어 세트 5</span>
                            <div class="leaning-contents-word-count-wrap">
                                <span class="leaning-contents-word-count"><span class="font-point">5</span>/10</span>
                            </div>
                        </li>
                    </ul>
                    <button class="btn btn-secondary btn-custom-option" id="wordSetAdd">
                        <i class="icon_plus"></i>
                        세트 추가하기
                    </button>
                </div>
            </div>
            <div class="leaning-contents-right">
                <div class="leaning-contents-right-top">
                    <div class="leaning-contents-right-title">
                        <h1>단어 세트 1</h1>
                    </div>
                    <div class="leaning-contents-right-word">
                        <div class="leaning-contents-card-prev">
                            <span><</span>
                        </div>
                        <div class="leaning-contents-card-wrap">
                            <div class="leaning-contents-card-front leaning-card">
                                <div class="text leaning-contents-card-word display-4 text-weight-black front">
                                    Null Pointer Exception
                                </div>
                                <div class="leaning-contents-card-information text alert-info body1 text-weight-medium">
                                    <span class="card-information"><i class="icon_info_circle"></i>클릭하시면 두더지 입니다.</span>
                                </div>
                            </div>
                            <div class="leaning-contents-card-back leaning-card">
                                <div class="text leaning-contents-card-word display-4 text-weight-black back">
                                    <%-- 카드 뒷면이 될곳 --%>
                                    눌 포인트 익셉션
                                </div>
                            </div>
                        </div>
                        <div class="leaning-contents-card-next">
                            <span>></span>
                        </div>
                    </div>
                    <div class="leaning-contents-card-status">
                        <ul>
                            <li>공부한 단어 <span class="font-point">1</span>개</li>
                            <li>전체 단어 10개</li>
                        </ul>
                    </div>
                </div>
                <div class="leaning-contents-right-down">
                    <div class="leaning-contents-right-top-info mb-3">
                        <div class="leaning-contents-table-info">
                            <span>[단어세트3]의 목록</span>
                            <span class="table-word-set-count">(10)</span>
                        </div>
                        <div class="leaning-contents-table-add-word">
                            <button class="btn btn-secondary btn-custom-option table-word-add-btn">
                                <i class="icon_plus"></i>
                                단어 추가하기
                            </button>
                        </div>
                    </div>
                    <div class="leaning-contents-table-contents">
                        <table class="leaning-table">
                            <tr>
                                <th class="text">
                                    단어
                                    <i class="icon_sort"></i>
                                </th>
                                <th class="text">
                                    뜻
                                    <i class="icon_sort"></i>
                                </th>
                                <th class="text">
                                    공부 상태
                                    <i class="icon_sort"></i>
                                </th>
                            </tr>
                            <tr>
                                <td class="text">Null Pointer Exception</td>
                                <td class="text">눌 포인터 익셉션</td>
                                <td class="text">
                                    <span class="text text-weight-light badge badge-primary">완료</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="text">Null Pointer Exception</td>
                                <td class="text">눌 포인터 익셉션</td>
                                <td class="text">
                                    <span class="text text-weight-light badge badge-neutral">미완료</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="text">Null Pointer Exception</td>
                                <td class="text">눌 포인터 익셉션</td>
                                <td class="text">
                                    <span class="text text-weight-light badge badge-neutral">미완료</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="text">Null Pointer Exception</td>
                                <td class="text">눌 포인터 익셉션</td>
                                <td class="text">
                                    <span class="text text-weight-light badge badge-neutral">미완료</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script type="module" src="${pageContext.request.contextPath}/js/learn/learn.js"></script>
</body>
</html>
