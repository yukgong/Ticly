package io.ticly.mint.admin.model.dto;

import io.ticly.mint.learn.model.dto.VocaDTO;
import lombok.*;

import java.util.List;

@Setter
@Getter
@Builder
public class ArticleDTO {

    private int article_seq;
    private String title;
    private String summary;
    private int file_seq;
    private String url;
    private String hashtag;
    private String category;
    private String contents;
    private int category_seq;
    private String reg_date;
    private Integer del;
    private Integer apply_count;
    private String image_path;
    private List<VocaDTO> vocaDTOS;
    private String eng_sentence;
    private int _article_seq;

    public ArticleDTO() {
    }

    public ArticleDTO(int article_seq, String title, String summary, int file_seq, String url, String hashtag, String category, String contents, int category_seq, String reg_date, Integer del, Integer apply_count, String image_path, List<VocaDTO> vocaDTOS, String eng_sentence, int _article_seq) {
        this.article_seq = article_seq;
        this.title = title;
        this.summary = summary;
        this.file_seq = file_seq;
        this.url = url;
        this.hashtag = hashtag;
        this.category = category;
        this.contents = contents;
        this.category_seq = category_seq;
        this.reg_date = reg_date;
        this.del = del;
        this.apply_count = apply_count;
        this.image_path = image_path;
        this.vocaDTOS = vocaDTOS;
        this.eng_sentence = eng_sentence;
        this._article_seq = _article_seq;
    }

    public int getArticle_seq() {
        return article_seq;
    }

    public void setArticle_seq(int article_seq) {
        this.article_seq = article_seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public int getFile_seq() {
        return file_seq;
    }

    public void setFile_seq(int file_seq) {
        this.file_seq = file_seq;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getHashtag() {
        return hashtag;
    }

    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }

    public int getCategory_seq() {
        return category_seq;
    }

    public void setCategory_seq(int category_seq) {
        this.category_seq = category_seq;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public Integer getDel() {
        return del;
    }

    public void setDel(Integer del) {
        this.del = del;
    }

    public Integer getApply_count() {
        return apply_count;
    }

    public void setApply_count(Integer apply_count) {
        this.apply_count = apply_count;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public List<VocaDTO> getVocaDTOS() {
        return vocaDTOS;
    }

    public void setVocaDTOS(List<VocaDTO> vocaDTOS) {
        this.vocaDTOS = vocaDTOS;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public String getEng_sentence() {
        return eng_sentence;
    }

    public void setEng_sentence(String eng_sentence) {
        this.eng_sentence = eng_sentence;
    }

    public int get_article_seq() {
        return _article_seq;
    }

    public void set_article_seq(int _article_seq) {
        this._article_seq = _article_seq;
    }
}