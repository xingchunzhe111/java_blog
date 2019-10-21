package com.my.blog.model.table;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "blog_category")
public class CategoryTable implements Serializable {
    @Id
    @GeneratedValue(generator = "id")
    int id;
    private String title;
    private int is_del;
    private String time;

    @Override
    public String toString() {
        return "CategoryTable{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", is_del=" + is_del +
                ", time='" + time + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIs_del() {
        return is_del;
    }

    public void setIs_del(int is_del) {
        this.is_del = is_del;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }


}
