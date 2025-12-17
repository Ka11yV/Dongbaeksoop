package com.team.entity;

import java.time.LocalDate;

public class Notification {
    private Long id;
    private String postId;
    private int deptId;
    private String title;
    private String url;
    private String content;
    private LocalDate postedDate;
    private String summation;

    public Notification() {
    }

    public Notification(Long id, String postId, int deptId, String title, String url, String content,
            LocalDate postedDate, String summation) {
        this.id = id;
        this.postId = postId;
        this.deptId = deptId;
        this.title = title;
        this.url = url;
        this.content = content;
        this.postedDate = postedDate;
        this.summation = summation;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDate getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(LocalDate postedDate) {
        this.postedDate = postedDate;
    }

    public String getSummation() {
        return summation;
    }

    public void setSummation(String summation) {
        this.summation = summation;
    }
}
