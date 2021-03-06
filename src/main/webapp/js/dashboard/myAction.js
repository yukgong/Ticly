'use static';

import LearningListCard from './module/learningListCard.js';

(() => {
    const learningListSection = document.querySelector(".js-learningList-section"),
        listTabBtn = document.querySelectorAll(".js-list-tab-btn"),
        selectBox = document.querySelector(".js-my-select-box"),
        userEmail = document.querySelector("input[name=userEmail]").value;

    const MY_ARTICLE_LIST_PATH = "getMyArticleListInfo?", // 내가 [학습하기]로 선택한 아티클 정보를 구하는 경로
        MAXIMUM_NUMBER_OF_CARDS = 5; // 한 번에 보여주는 카드 개수

    let myArticleList = []; // axios로 받아온 데이터를 담는 배열
    let scrollCount = 0; // 무한 스크롤용 스크롤 횟수
    let state = 0; // 학습중 / 학습완료 탭 중 현재 활성화된 탭의 상태를 저장하는 변수

    //---------------------------------------------------------------------------------------

    // 무한 스크롤을 위한 함수
    function infinityScroll() {
        window.onscroll = function (ev) {
            // window height + window scrollY 값이 document height보다 클 경우,
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {

                // 스크롤할 때 마다 (한 번에 보여주는 카드 개수 * 스크롤 횟수)번째 카드 부터
                // (한 번에 보여주는 카드 개수만큼)  카드 그려주기
                let startCount = MAXIMUM_NUMBER_OF_CARDS * scrollCount;

                let result = listFilter(myArticleList, state);
                if (startCount < result.length) {
                    articleCardModule(result, startCount);
                }
            }
        }
    }

    // 정렬 옵션에 변동사항이 있을 때 마다 카드의 정렬을 바꾸는 함수
    function changeSortOption() {
        scrollCount = 0;
        let selectedValue = selectBox.options[selectBox.selectedIndex].value;
        let state = null;

        listTabBtn.forEach(el => {
            if (el.classList.contains("active")) {
                state = el.value;
            }
        });

        // 선택한 옵션에 따라 배열 정렬하기
        let newSortedList = myArticleList;
        if (newSortedList.length > 1) {
            switch (selectedValue) {
                // 최근 학습순 정렬
                case "1":
                    newSortedList.sort((a, b) => {
                        return a.last_learning_date > b.last_learning_date ? -1 : a.last_learning_date < b.last_learning_date ? 1 : 0;
                    });
                    break;

                // 최신 등록순
                case "2":
                    newSortedList.sort((a, b) => {
                        return a.reg_date > b.reg_date ? -1 : a.reg_date < b.reg_date ? 1 : 0;
                    });
                    break;

                // 제목순
                case "3":
                    newSortedList.sort((a, b) => {
                        return a.title < b.title ? -1 : a.title > b.title ? 1 : 0;
                    });
                    break;
            }
            paintCard(newSortedList, state)
        }
    }

    // 리스트 탭 버튼 클릭시 이벤트
    function handleListTabBtnEvent(ev) {
        let targetElem = ev.target;
        if (ev.target.nodeName === 'SPAN') {
            targetElem = targetElem.parentElement;
        }
        if (!targetElem.classList.contains("active")) {
            // 눌려진 아티클 목록 탭의 버튼의 value 받아오기
            // 0 : 학습중 / 1 : 학습 완료
            state = targetElem.value;

            // 탭 활상화 상태 바꿔주기
            listTabBtn.forEach(el => {
                el.classList.remove("active");
            });
            targetElem.classList.add("active");

            // scrollCount 초기화
            scrollCount = 0;

            // 상태에 따라 아티클 목록에 학습 카드 그려주기
            paintCard(myArticleList, state);
        }
    }

    // null인지 확인하는 함수
    function isNull(v) {
        return (v === undefined || v === null) ? true : false;
    }

    // 아티클 카드 모듈
    function articleCardModule(list, startCount) {
        let count = 0;
        scrollCount++;

        for (let i = startCount; i < list.length; i++) {
            // 그려주는 카드 개수 제한
            if (count == MAXIMUM_NUMBER_OF_CARDS) {
                return;
            }

            learningListSection.appendChild(new LearningListCard(
                JSON.stringify(list[i].image_path)
                , JSON.stringify(list[i].article_seq)
                , JSON.stringify(list[i].url)
                , JSON.stringify(list[i].category_title)
                , JSON.stringify(list[i].hashtag)
                , JSON.stringify(list[i].title)
                , JSON.stringify(list[i].summary)
                , JSON.stringify(list[i].reg_date)
                , JSON.stringify(list[i].last_learning_date)
                , JSON.stringify(list[i].achievement_rate)
                , JSON.stringify(list[i].learning_done)
                , JSON.stringify(list[i].user_article_show)
            ).getElements());
            count++;
        }
    }

    function listFilter(list, state){
        let resultList = null;
        if (state == 0) {
            resultList = list.filter(it => JSON.stringify(it.user_article_show).includes("TRUE"));
            resultList = resultList.filter(it => JSON.stringify(it.learning_done).includes(0));
        }
        else if (state == 1) {
            resultList = list.filter(it => JSON.stringify(it.learning_done).includes(1));
        }
        else if (state == 2) {
            resultList = list.filter(it => JSON.stringify(it.user_article_show).includes("FALSE"));
            resultList = resultList.filter(it => JSON.stringify(it.learning_done).includes(0));
        }
        return resultList;
    }

    // list의 정보를 가져와 학습중인 아티클 카드를 그려주기
    function paintCard(list, state) {
        // section의 모든 자식 요소 삭제
        while (learningListSection.hasChildNodes()) {
            learningListSection.removeChild(learningListSection.firstChild);
        }

        learningListSection.style.display = "grid";

        if (!isNull(list)) {
            let result = listFilter(list, state);

            if (result.length > 0) {
                articleCardModule(result, scrollCount);
            } else {
                paintDefault(state);
            }
        } else {
            paintDefault(state);
        }
    }

    // 디폴트 페이지 그려주기
    function paintDefault(state) {

        // default message
        const defaultStateWrapper = document.createElement("div");
        defaultStateWrapper.className = "default__null text h4";

        const defaultText = document.createElement("div");
        defaultText.className = "text h4";
        if (state == 0) {
            defaultText.innerHTML = `학습중인 아티클이 없네요🙈<br> 공부하고 싶은 아티클을 찾으러 가볼까요?`;
            const goToFindArticleBtn = document.createElement("button");
            goToFindArticleBtn.className = "btn btn-primary btn-right-icon"
            goToFindArticleBtn.innerHTML = "아티클 찾기<i class='icon_chevron-right'></i>"
            goToFindArticleBtn.setAttribute("onclick", "location.href='../articleBoard/findArticle'");
            defaultStateWrapper.appendChild(defaultText);
            defaultStateWrapper.appendChild(goToFindArticleBtn);
        } else if (state == 1) {
            defaultText.innerHTML = `아직 완료한 아티클이 없네요🙈<br> 열심히 공부해서 이곳을 꽉 채워주세요!`;
            defaultStateWrapper.appendChild(defaultText);
        } else if (state == 2) {
            defaultText.innerHTML = `<span class="text text-color-green">학습중</span>인 아티클을 숨길 수 있어요🙈<br> 숨기길 원하시면 카드 우측 상단의 '<i class="icon_show"></i>' 버튼을 클릭해주세요!`;
            defaultStateWrapper.appendChild(defaultText);
        }
        learningListSection.appendChild(defaultStateWrapper);
        learningListSection.style.display = "block";
    }

    // 아티클 목록에서 완료 유무를 파악해 각각 몇개의 목록을 가지고 있는지 연산하는 함수
    function counting(list) {
        // 학습중
        let result = list.filter(it => JSON.stringify(it.user_article_show).includes("TRUE"));
        result = result.filter(it => JSON.stringify(it.learning_done).includes(0));
        listTabBtn[0].firstElementChild.innerHTML = result.length;

        // 학습 완료
        result = list.filter(it => JSON.stringify(it.learning_done).includes(1));
        listTabBtn[1].firstElementChild.innerHTML = result.length;

        // 숨긴 아티클
        result = list.filter(it => JSON.stringify(it.user_article_show).includes("FALSE"));
        result = result.filter(it => JSON.stringify(it.learning_done).includes(0));
        listTabBtn[2].firstElementChild.innerHTML = result.length;
    }

    // json 객체를 리스트에 담아주는 비동기 처리
    function getArticleList(path, state) {
        axios({
            method: 'get',
            url   : path
        })
            .then(function (json) {
                console.log("Receive Success!");
                console.log(json.data);

                if (json.data.length != 0) {
                    myArticleList = json.data;
                    paintCard(myArticleList, state);
                    counting(myArticleList);
                } else {
                    paintDefault(state);
                }
            });
    }

    // axios를 통해 담아 보낼 수 있도록 email을 movePath에 담기
    function createPath(startSpot) {
        let path = startSpot;
        path += "email=" + userEmail;
        return path;
    }

    // 숨기기 & 보이기 클릭 이벤트 처리
    function handleShowAndHideClickEvent(ev) {
        // hide event
        if(ev.target.classList.contains("js-modal-hide-btn")){
            scrollCount = 0;
            $(ev.target).tooltip('hide');
            const path = ev.target.value;
            getArticleList(path, 0);
            document.querySelector("body").className = "";
            document.querySelector(".modal-backdrop").remove();
        }

        // show event
        else if(ev.target.id == "js-show-btn"){
            $(ev.target).tooltip('hide');
            scrollCount = 0;
            const path = ev.target.value;
            getArticleList(path, 2);
        }
    }

    // 숨기기 & 보이기 호버 이벤트 처리
    function handleShowAndHideHoverEvent(ev) {
        // show event
        if (ev.target.id == "js-show-btn" || ev.target.id == "js-hide-btn") {
            $(ev.target).tooltip('show');
        }
    }

    // 화면 로드시 아티클 카드를 그려주는 함수
    function pageLoadEvent() {
        const path = createPath(MY_ARTICLE_LIST_PATH);
        getArticleList(path, 0);
    }

    function init() {

        // 다른 페이지에서 뒤로가기 했을 때 새로고침 해주는 이벤트
        let perfEntries = performance.getEntriesByType("navigation");
        if (perfEntries[0].type === "back_forward") {
            location.reload(true);
        }

        window.onpageshow = () => {
            pageLoadEvent();
        };

        // 무한 스크롤 이벤트
        infinityScroll();

        // 학습중 / 학습완료 탭 이벤트
        listTabBtn.forEach(el => {
            el.addEventListener("click", handleListTabBtnEvent);
        });

        // 카드 정렬 이벤트
        selectBox.addEventListener("change", changeSortOption);

        // 비로그인시 로그인 모달을 닫을 때 이벤트
        document.querySelector("#modal-close").addEventListener("click", () => {
            location.href = "../articleBoard/findArticle";
        });

        // 숨기기 & 보이기 관련 이벤트
        learningListSection.addEventListener("mouseover", handleShowAndHideHoverEvent);
        learningListSection.addEventListener("click", handleShowAndHideClickEvent);
    }

    init();
})();