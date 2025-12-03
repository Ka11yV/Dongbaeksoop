package com.team.entity;

import java.util.Date;

public class User {
    private int id;
    private String userId;
    private String password;
    private String schoolPassword;
    private String email;
    private int grade;
    private int deptId;
    private boolean isBan;
    private boolean isNoticeAlertEnabled;
    private boolean isAssignmentAlertEnabled;
    private String role;
    private Date createdAt;


    public User() {}

    public User(String userId, String email, String password, int deptId, int grade) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.deptId = deptId;
        this.grade = grade;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSchoolPassword() {
        return schoolPassword;
    }

    public void setSchoolPassword(String schoolPassword) {
        this.schoolPassword = schoolPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public boolean getIsBan() {
        return isBan;
    }

    public void setIsBan(boolean isBan) {
        this.isBan = isBan;
    }

    public boolean isNoticeAlertEnabled(boolean isNoticeAlertEnabled) {
        return this.isNoticeAlertEnabled;
    }

    public void setNoticeAlertEnabled(boolean noticeAlertEnabled) {
        this.isNoticeAlertEnabled = noticeAlertEnabled;
    }

    public boolean isAssignmentAlertEnabled() {
        return isAssignmentAlertEnabled;
    }

    public void setAssignmentAlertEnabled(boolean assignmentAlertEnabled) {
        this.isAssignmentAlertEnabled = assignmentAlertEnabled;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}