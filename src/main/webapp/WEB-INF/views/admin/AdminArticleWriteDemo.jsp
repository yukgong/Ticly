<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %><%--
  Created by IntelliJ IDEA.
  User: Hyeseung Jang
  Date: 2020-08-12
  Time: 오후 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"/>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <style>

        .flex_container {
            display: flex;
            flex-direction: column;
            vertical-align: middle;
            text-align: center;
        }

        .clearfix:after {
            content: "";
            clear: both;
            display: block;
        }

        .item {
            float: left;
        }

        .word-info {
            display: inline-block;
            vertical-align: middle;
            margin: 0;
            padding: 0;

        }

        .myboardBtnGroup {
            margin: 30px;
            /*padding: 30px;*/
        }

        .Admin-header-menu-btn {
            margin: 30px;
        }

        .main-logo {
            margin: 17px;
        }

        .article-find-tab {
            margin-left: 50px;
            padding: 10px;
        }

        .Admin-header-menu-tab {
            margin: 1px 300px;
            padding: 12px;
        }

        .word-info {
            align-content: center;
        }

        .button {
            border-radius: 0;
            border: 0;
            outline: 0;
        }

        .table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .table td {
            padding: 0px;
            line-height: 0;
        }

        h1,h2,h3,h4,h5,h6 {
            display:inline
        }

        a {
            /*margin-left: 1px;*/
            padding: 6px;
        }



    </style>
    <title>AdminArticleWriteDemo.jsp</title>

    <link rel="stylesheet" href="./css/bootstrap.css">
</head>
<body>



<form action="/AdminDataCheck" id="admin-add-frm" method="post" enctype="multipart/form-data">

    <div class="flex_container">

        <!--  Ticly 로고 라인 탭 -->
        <div class="item">
            <div class="main-logo">
                <img src="./images/logo_color.svg" align="left">

                        <a href="ArticleFindTab.jsp" style="text-decoration:none" align="center" class="article-find-tab" > 아티클 찾기 </a>
                        <a href="IntroService.jsp" style="text-decoration:none" align="center" class="article-find-tab"> 서비스 소개 </a>
                        <a href="AdminArticleWrite.jsp" style="text-decoration:none" align="center" class="article-find-tab"> 관리자 페이지 </a>

                        <input type="image" src="./css/Admin/images/츄.png" border="0" style="float: right;">
                        <input type="button" class="btn btn-success" value="내 학습 보드" style="float: right;">
            </div>
        </div>



        <!-- 관리자 페이지 내 Tab + 저장하기 -->
        <div class="item">
            <hr>
            <div class="Admin-header-menu-tab" align="left">
                <a class="text text-color-green text-weight-medium" style="text-decoration:none" href="AdminArticleWrite.jsp"> <h6> 아티클 등록하기 </h6> </a>
                <a class="text text-color-gray300 text-weight-medium" style="text-decoration:none" href="AdminArticleList.jsp"> <h6> 아티클 목록 </h6> </a>
                <a class="text text-color-gray300 text-weight-medium" style="text-decoration:none" href="AdminMemberList.jsp" > <h6> 회원 관리 </h6> </a>
                <a class="text text-color-gray300 text-weight-medium" style="text-decoration:none" href="AdminAnalysis.jsp" > <h6> 통계 </h6> </a>

                <input type="submit" id="saveBtn" class="btn btn-success" value="저장하기" style="float: right;" onclick="/AdminDataCheck">
                <input type="button" name="backBtn" class="btn" value="뒤로가기" style="float: right;" onclick="history.back()">

            </div>
            <hr>
        </div>

        <hr>

        <!--  아티클 기본 정보 Section -->
        <div class="item">
            <div class="ArticleInfo" align="center">
                <table>
                    <col width="200px"><col width="908px">
                    <tr>
                        <td rowspan="5" valign="top" align="left">
                            <p class="text body1 text-weight-black text-color-gray100"> 아티클 기본 정보 </p>

                        </td>
                        <td>
                            <p class="text body1 text-weight-medium text-color-gray100"> 카테고리 </p>
                            <select class="form-control" name="category">
                                <option value="카테고리X"> 카테고리를 선택하세요 </option>
                                <option value="개발"> 개발 </option>
                                <option value="UI/UX"> UI/UX </option>
                                <option value="브랜딩"> 브랜딩 </option>
                                <option value="마케팅"> 마케팅 </option>
                                <option value="경제"> 경제 </option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p class="ext body1 text-weight-medium text-color-gray100"> 제목 </p>
                            <input type="text" name="title" class="form-control form-control-lg" value="제목Test" placeholder="제목을 입력해주세요">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="ext2 body1 text-weight-medium text-color-gray100"> 원문 URL </p>
                            <input type="text" name="url" class="form-control" aria-describedby="basic-addon3" value="http://aaa.aa.a" placeholder="http://">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p class="ext2 body1 text-weight-medium text-color-gray100"> 아티클 이미지 파일 </p>
                            <input type="file" id="file" name="file">
                            <%--<input type="button" name="file-upload-btn" value="이미지 등록" onclick="window.open('/fileupload','name','resizable=no width=500 height=300');return false">--%>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p class="ext3 body1 text-weight-medium text-color-gray100"> 요약 </p>
                            <textarea name="summary" class="form-control" cols="110" rows="5" placeholder="DISCLAIMER: This project was done by me and my classmates for a school project and is not made, owned, or affiliated directly to Accedo. What if Netflix knew what you want..."> SUMMARY TEST </textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <hr width="65%">

            <!--  아티클 내용 Section -->
            <div class="content" align="center">
                <table>
                    <col width="200px"><col width="908px">
                    <tr>
                        <td valign="top" align="left">
                            <p class="text body1 text-weight-black text-color-gray100"> 내용 </p>
                        </td>
                        <td>
						<textarea name="content" class="form-control" cols="110" rows="10" placeholder="DISCLAIMER: This project was done by me and my classmates for a school project and is not made, owned, or affiliated directly to Accedo. What if Netflix knew what you want..."> 내용 TEST </textarea>
                        </td>
                    </tr>

                    <tr>
                        <td valign="top" align="left">
                            <p class="text body1 text-weight-black text-color-gray100"> 태그 </p>
                        </td>
                        <td>
                            <input type="text" name="hashtag" size="200" value="#태그1 #태그2" placeholder="내용을 입력하세요 (#해시태그)" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                        </td>
                    </tr>

                </table>
            </div>

            <br><br>

            <!--  단어 정보 Section  -->
            <div class="word-info" align="center">
                <table class="table">
                    <col width="200px"><col width="908px">
                    <tr>
                        <td rowspan="5" valign="top" align="left">
                            <p class="text body1 text-weight-black text-color-gray100"> 단어 정보 </p>
                        </td>
                        <td>
                            <div id="divTest" class="table">

                            <table>
                                <col width="260px"><col width="568px"><col width="100px">
                                <tr>
                                    <td>
                                        <p class="ext body1 text-weight-medium text-color-gray100"> 단어 </p>
                                    </td>
                                    <td>
                                        <p class="ext body1 text-weight-medium text-color-gray100"> 뜻 </p>
                                    </td>
                                    <td>  </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" value="account for" size="10" readonly="readonly">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" value="설명하다" size="40" readonly="readonly"><br>
                                    </td>
                                    <td>
                                        <%--<button type="button" class="btn"> 삭제 </button>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" value="Null Pointer Exception" size="10" readonly="readonly">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" value="눌 포인트 익셉션" size="40" readonly="readonly"><br>
                                    </td>
                                    <td>
                                        <%--<button type="button" class="btn"> 삭제 </button>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" name="insertword" class="form-control" size="20" name="insertword" placeholder="단어를 입력하세요">
                                    </td>
                                    <td>
                                        <input type="text" name="insertmean" class="form-control" size="40" name="insertmean" placeholder="뜻을 입력하세요"><br>
                                    </td>
                                    <td>
                                       <%-- <button type="button" class="btn" onclick="Remove_WordBox(this)"> 삭제 </button>--%>
                                           <button type="button" class="btn" > 삭제 </button>
                                </tr>

                            </table>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <input type="button" class="btn" onclick="Add_WordBox()" value=" + 단어 추가하기">
                        </td>
                    </tr>

                </table>

            </div>
        <!-- 가장 바깥 div -->
        </div>

    </div>
</form>



<script type="text/javascript">
    var count = 1;

    function Add_WordBox() {

        var obj = document.getElementById("divTest");
        var WordDiv = document.createElement('div');

        WordDiv.innerHTML = "<table>\n" +
            "                  <col width=\"260px\"><col width=\"568px\"><col width=\"100px\">\n" +
            "                     <tr>\n" +
            "                        <td>\n" +
            "                            <input type=\"text\" class=\"form-control\" size=\"20\" name=\"insertword\" placeholder=\"단어를 입력하세요\">" +
            "                        </td>\n" +
            "                        <td>\n" +
            "                            <input type=\"text\" class=\"form-control\" size=\"40\" name=\"insertmean\" placeholder=\"뜻을 입력하세요\"><br>\n" +
            "                        </td>\n" +
            "                        <td>\n" +
            "                            <button type=\"button\" class=\"btn\">삭제</button>\n" +
            "                        </td>\n" +
            "                      </tr>" +
            "                  </table> \n";


        WordDiv.setAttribute("id", "myDiv");

        WordDiv.onclick = function () {
            var p = this.parentElement;
            //    p.removeChild(this);
        };
        obj.appendChild(WordDiv);

    }


    /* 단어 입력 삭제 */
    $(document).on('click', "button.btn", function (){
    //    alert('click');
        $(this).parent().parent().remove();
    });


    function WriteConfirm() {

        var title = ArticleSave.title.value;
        var content = ArticleSave.content.value;
        var url = ArticleSave.url.value;

        if (title.trim() == ''){
            alert("제목을 입력해주세요");
            return false;
        }
        if (content.trim() == ''){
            alert("작성자를 입력해주세요");
            return false;
        }
        if (url.trim() == ''){
            alert("내용을 입력해주세요");
            return false;
        }
        ArticleSave.submit();
    }


</script>

<script>

    /*
    const category = document.querySelector("input[category=category]"),
             title = document.querySelector("input[title=title]"),
             summary = document.querySelector("input[summary=summary]"),
             url = document.querySelector("input[url=url]"),
             hashtag = document.querySelector("input[hashtag=hashtag]")
             saveBtn = document.querySelector(".saveBtn")
    */

    /* 2. 데이터 로드 */
    function loadTestArticle(axios) {
        axios.get('http://localhost:8090/WriteTest?category=' + category + 'title=' + title).then(response => {
            const category = document.getElementsByName('Category');
            const title = document.getElementsByName('ArticleTitle');
            const url = document.getElementsByName('ArticleUrl');
            const summary = document.getElementsByName('summary')
            const hashtag = document.getElementsByName('hashtag');
            const content = document.getElementsByName('content');
            const word = document.getElementsByName('word-insert');
            const meaning = document.getElementsByName('mean-insert');

        });
    }

    /* 3. 데이터 받아오기 */
    function getJson() {
        // get 방식으로 데이터 받아오기
        axios.get('WriteTest?category=send?title=send')

            .then(function(json) {
                console.log("Receive Success!");

                for (let key of json.data) {

                    let text = document.createElement("span");

                    // JSON을 문자열로 변환해 text에 대입한다.
                    text.innerHTML = JSON.stringify(key.title) + " ";
                    pTag.append(text);
                }
            })
            .catch(function(error) {
                console.log(error);
            })
            .finally(function() {
                // always executed
                console.log("always executed");
            });
    }

</script>


</body>
</html>