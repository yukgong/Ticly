
<%--
  Created by IntelliJ IDEA.
  User: Hyeseung
  Date: 2020-08-18
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"/>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Common -->
    <c:import url="/WEB-INF/views/layout/globalImport.jsp"></c:import>

    <style>
        .flex_container {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            width: 100%;
            padding-top: 60px;
            text-align: center;
        }

        .item {
            float: left;
        }

        .admin-header{
            position: sticky;
            top: 80px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: white;
            border: solid 1px #E1E1E8;
            z-index: 12;
        }

        .admin-header-container{
            display: flex;
            justify-content: space-between;
            padding-top: 16px;
            padding-bottom: 16px;
        }

        .Admin-header-menu-tab {
            display: flex;
            text-align: justify;
            align-items: center;
            height: 40px;
        }

        .Admin-header-menu-tab a{
            margin-right: 17px;
        }


    </style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/globalNav.jsp"></c:import>
<div class="admin-catalog ticly__basic-layout">
    <div class="admin-header">
        <div class="container admin-header-container">
            <div class="Admin-header-menu-tab" align="left">
                <a href="/writeForm"> <h6 class="text text-color-gray300 text-weight-medium" > 아티클 등록하기 </h6> </a>
                <a href="/ArticleList"> <h6 class="text text-color-green text-weight-medium"> 아티클 목록 </h6> </a>
                <a href="/admin/clientmanage"> <h6 class="text text-color-gray300 text-weight-medium"> 회원 관리 </h6> </a>
            </div>
        </div>
    </div>
    <div class="container flex_container ticly__basic-content-layout">

    <table width="700" class="table table-hover">
        <colgroup>
            <col width="10"><col width="180"><col width="80"><col width="20">
        </colgroup>
        <tr>
            <td>번호</td>
            <td>아티클 제목</td>
            <td>작성일</td>
            <td>삭제</td>
        <tr>
        <c:forEach items="${list}" var="dto">
            <tr>
                <td>${dto.article_seq}</td>
                <%--<td><a href="${pageContext.request.contextPath}/AdminWriteDetail?title=${dto.title}">${dto.title}</td>--%>
                <td><a href="${pageContext.request.contextPath}/AdminWriteDetail?articleseq=${dto.article_seq}">${dto.title}</td>
                <td>${dto.reg_date}</a></td>
                <td><a href="delete?article_seq=${dto.article_seq}" >X</a></td>
            <tr>
        </c:forEach>
    </table>


</div>
<c:import url="/WEB-INF/views/layout/globalFooter.jsp"></c:import>

    <script type="text/javascript">



    </script>


</body>
</html>
