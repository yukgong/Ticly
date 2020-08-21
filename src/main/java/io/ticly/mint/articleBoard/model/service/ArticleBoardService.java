package io.ticly.mint.articleBoard.model.service;

import io.ticly.mint.articleBoard.model.dao.ArticleBoardDAO;
import io.ticly.mint.articleBoard.model.dto.ArticleInfoDTO;
import io.ticly.mint.articleBoard.model.dto.HashtagDTO;
import io.ticly.mint.articleBoard.model.dto.MemberDTO;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.TreeSet;

@Service
public class ArticleBoardService {

    private ArticleBoardDAO articleBoardDAO;

    public ArticleBoardService(ArticleBoardDAO articleBoardDAO){
        this.articleBoardDAO = articleBoardDAO;
    }

    /**
     * 선택한 관심 분야에 맞는 해시태그 찾기
     * @param categories
     * @return
     */
    public List<HashtagDTO> getHashtagInfo(List<String> categories){

        // DB에서 받아온 해시태그를 # 단위로 잘라서 중복 제거를 위해 hashSet에 담은 후
        // 리턴할 때 사용하기 위해 다시 리스트에 담아주기
        List<HashtagDTO> originHashTagList = articleBoardDAO.getHashtagInfo(categories);
        List<HashtagDTO> disHashTagList = new ArrayList<HashtagDTO>(new HashSet<HashtagDTO>(splitList(originHashTagList)));

        // 인기순 키워드 정렬
        alignList(disHashTagList);
        return disHashTagList;
    }

    /**
     * 해시태그를 # 단위로 잘라서 List에 저장
     * @param originList
     * @return
     */
    public List<HashtagDTO> splitList(List<HashtagDTO> originList){
        List<HashtagDTO> returnList = new ArrayList<HashtagDTO>();

        for (int i = 0; i < originList.size(); i++){
            String hashtagInList =  originList.get(i).getHashtag();
            String[] hashtagArr = (hashtagInList.substring(1, hashtagInList.length())).split("#");
            for (int j = 0; j < hashtagArr.length; j++) {
                String hashtag = hashtagArr[j];
                int apply_count = originList.get(i).getApply_count();
                returnList.add(new HashtagDTO(hashtag, apply_count));
            }
        }
        return returnList;
    }

    /**
     * 리스트 내림차순 정렬 메소드
     * @param list
     * @return
     */
    public List<HashtagDTO> alignList(List<HashtagDTO> list){
        HashtagDTO temp = null;
        for (int i = 0; i < list.size() - 1; i++){
            for (int j = i + 1; j < list.size(); j++){
                HashtagDTO i_obj = list.get(i);
                HashtagDTO j_obj = list.get(j);
                if(i_obj.getApply_count() < j_obj.getApply_count()){
                    temp = i_obj;
                    list.set(i, j_obj);
                    list.set(j, temp);
                }
            }
        }
        return list;
    }

    /**
     * 전달된 키워드와 동일한 아티클을 찾는 메소드
     * @param  'list'   : 'categoryArr'     사용자가 선택한 관심 분야
     * @param  'String' : 'searchKeyword'   사용자가 입력한 키워드
     */
    public List<ArticleInfoDTO> findArticleBySearch(List<String> categories, String searchKeyword) {
        return articleBoardDAO.findArticleBySearch(categories, searchKeyword);
    }

    /**
     * 선택한 관심 분야와 동일한 아티클 찾기
     * @param  'list' : 'categoryArr'   사용자가 선택한 관심 분야
     */
    public List<ArticleInfoDTO> findMyTypeArticle(List<String> categories) {
        return articleBoardDAO.findMyTypeArticle(categories);
    }

    /**
     * 사용자가 선택한 카테고리를 불러오는 메소드
     * @return 'List<String>' : 'categories'
     */
    public List<String> getCategoriesAtParameter(Model model, HttpServletRequest req){
        // 전송받은 "categories"의 값을 낚아채 리스트에 넣어준다.
        String[] categoriesStr = req.getParameterValues("categories");
        List<String> categories = new ArrayList<String>();
        for(String key : categoriesStr) {
            categories.add(key);
        }
        return categories;
    }
}
