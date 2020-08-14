package io.ticly.mint.admin;

import io.ticly.mint.admin.model.dao.ArticleDAO;
import io.ticly.mint.admin.model.dto.ArticleDTO;
import io.ticly.mint.admin.model.dto.CategoryDTO;
import io.ticly.mint.admin.model.service.AdminArticleWriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;

@Controller
public class AdminAddController {

    @Autowired
    AdminArticleWriteService adminArticleWriteService;


    @RequestMapping("/WriteTest")
    public String writeTest() {
        return "/admin/AdminArticleWriteDemo";
    }
/*

    @RequestMapping(value = "/AdminDataTest", method=RequestMethod.GET)
    public String dataTest() {
        return "admin/AdminDataCheck";
    }

*/

    @RequestMapping(value= "/AdminDataTest", method=RequestMethod.GET)
    public String goWriteTest(HttpServletRequest request, Model model){

        System.out.println("=== goWriteTest start ===");

        // 선택한 카테고리 문자열로 가져오기
        String[] category = request.getParameterValues("category");
        if(category != null) {
            for(int i=0; i< category.length; i++){
                System.out.println(Arrays.toString(category));
            }
        }

        String title = request.getParameter("title");
        String url = request.getParameter("url");
        String summary = request.getParameter("summary");
        String hashtag = request.getParameter("hashtag");
        String content = request.getParameter("content");

        String[] insert_word = request.getParameterValues("insertword");
        String[] insert_mean = request.getParameterValues("insertmean");

        System.out.println("단어: " + Arrays.toString(insert_word) + "\n" + "뜻: " + Arrays.toString(insert_mean));

        /*
        if(insert_word != null && insert_mean != null) {
            for(int i=0; i< insert_word.length; i++){
                System.out.println("단어: " + Arrays.toString(insert_word) + "뜻: " + Arrays.toString(insert_mean));
                // System.out.println(Arrays.toString(insert_mean));
            }
        }
        */

        System.out.println("title: " + title);
        System.out.println("원문URL: " + url);
        System.out.println("Summary: " + summary);
        System.out.println("Hashtag: " + hashtag);
        System.out.println("content: " + content);

        model.addAttribute("category", category);
        model.addAttribute("title", title);
        model.addAttribute("summary", summary);
        model.addAttribute("url", url);
        model.addAttribute("hashtag", hashtag);
        model.addAttribute("content", content);
        model.addAttribute("insertword", insert_word);
        model.addAttribute("insertmean", insert_mean);


        return "/AdminDataTest";
    }



    @RequestMapping("/list")
    public String list(Model model) throws Exception {
        model.addAttribute("list", adminArticleWriteService.ArticleListAll());
        return "ArticleDAO/list";
    }

    @RequestMapping("/read")
    public String read(@RequestParam("ArticleNum") int anum, Model model) throws Exception {
        model.addAttribute("article", adminArticleWriteService.ArticleDetail(anum));
        return "ArticleDAO/read";
    }

    @GetMapping("write")
    public String writeForm() {
        return "ArticleDAO/write";
    }

    @PostMapping("write")
    public String write(@ModelAttribute("article") ArticleDTO articleDTO) throws Exception {
        // service = new AdminArticleWriteServiceImpl();
        System.out.println("article");
        adminArticleWriteService.WriteArticle(articleDTO);
        return "redirect:list";
    }

    @RequestMapping("update")
    public String modify(@ModelAttribute("article") ArticleDAO articleDAO) throws Exception {
        // service = new AdminArticleWriteServiceImpl();
        adminArticleWriteService.ArticleUpdate(articleDAO);
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String Delete(@ModelAttribute("ArticleNum") int anum) throws Exception {
        // service = new AdminArticleWriteServiceImpl();
        adminArticleWriteService.ArticleDelete(anum);
        return "ArticleDAO/admin";
    }

    /*
    // 카테고리 seq로 바꾸어 저장
    @RequestMapping("/categoryseq")
    public String saveCategory(HttpServletRequest request, Model model){

        String categoryName = request.getParameter("category");
        // 받아온 request 객체의 category값 저장

        int categoryNum = 0;

        // category 문자열 값에 따라 category seq에 int형으로 저장
        if(category == "개발"){
            categoryNum = 1;
        }
        else if(category == "UI/UX"){
            categoryNum = 2;
        }
        else if(category == "브랜딩"){
            categoryNum = 3;
        }
        else if(category == "마케팅"){
            categoryNum = 4;
        }
        else if(category == "경제"){
            categoryNum = 5;
        }
        else {
            out.println("Category is error");
        }

        // request 객체에 지정된 카테고리 seq 저장
        request.setAttribute("categoryNum", categoryNum);

        // 포워딩
        return "/view.jsp";
    }
    */

}