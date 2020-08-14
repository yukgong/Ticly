package io.ticly.mint.admin.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Builder
@Getter
public class ArticleDTO {

    private int article_seq;
    private String title;
    private String summary;
    private int file_seq;
    private String url;
    private String hashtag;
    private int category_seq;
    private String reg_date;
    private Integer del;
    private Integer apply_count;

    public ArticleDTO() {
    }



    public ArticleDTO(int article_seq, String title, String summary, int file_seq, String url, String hashtag, int category_seq, String reg_date, Integer del, Integer apply_count) {
        this.article_seq = article_seq;
        this.title = title;
        this.summary = summary;
        this.file_seq = file_seq;
        this.url = url;
        this.hashtag = hashtag;
        this.category_seq = category_seq;
        this.reg_date = reg_date;
        this.del = del;
        this.apply_count = apply_count;
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
}