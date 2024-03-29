package com.my.blog.model.bean;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "blog_category")
public class CategoryTable implements Serializable {
    @Id
//    @GeneratedValue(generator = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String title;
    private Integer is_del;
    private String time;
    private String icon;

    @Override
    public String toString() {
        return "CategoryTable{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", is_del=" + is_del +
                ", time='" + time + '\'' +
                '}';
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public int getId() {
        return id;
    }

//    public void setId(int id) {
//        this.id = id;
//    }

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
