package com.my.blog.model.table;

import javax.persistence.*;

@Entity
@Table(name = "blog_article")
public class ArticleTable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String article_title;
    private String article_desc;
    private String article_content;
    private int class_id;
    private int status;
    private int views_count;
    private int created_at;
    private int updated_at;
    private int is_hot;

    @Override
    public String toString() {
        return "ArticleTable{" +
                "id=" + id +
                ", article_title='" + article_title + '\'' +
                ", article_desc='" + article_desc + '\'' +
                ", article_content='" + article_content + '\'' +
                ", class_id=" + class_id +
                ", status=" + status +
                ", views_count=" + views_count +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                ", is_hot=" + is_hot +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public String getArticle_desc() {
        return article_desc;
    }

    public void setArticle_desc(String article_desc) {
        this.article_desc = article_desc;
    }

    public String getArticle_content() {
        return article_content;
    }

    public void setArticle_content(String article_content) {
        this.article_content = article_content;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getViews_count() {
        return views_count;
    }

    public void setViews_count(int views_count) {
        this.views_count = views_count;
    }

    public int getCreated_at() {
        return created_at;
    }

    public void setCreated_at(int created_at) {
        this.created_at = created_at;
    }

    public int getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(int updated_at) {
        this.updated_at = updated_at;
    }

    public int getIs_hot() {
        return is_hot;
    }

    public void setIs_hot(int is_hot) {
        this.is_hot = is_hot;
    }
}
