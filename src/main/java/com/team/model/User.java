package com.team.model;

import java.util.Date;

public class User {
    private int id;
    private String user_id;
    private String password;
    private String school_password;
    private String email;
    private int grade;
    private int dept_id;
    private boolean is_ban;
    private boolean is_notice_alert_enabled;
    private boolean is_assignment_alert_enabled;
    private String role;
    private Date created_at;



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSchool_password() {
        return school_password;
    }

    public void setSchool_password(String school_password) {
        this.school_password = school_password;
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

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public boolean isIs_ban() {
        return is_ban;
    }

    public void setIs_ban(boolean is_ban) {
        this.is_ban = is_ban;
    }

    public boolean isIs_notice_alert_enabled() {
        return is_notice_alert_enabled;
    }

    public void setIs_notice_alert_enabled(boolean is_notice_alert_enabled) {
        this.is_notice_alert_enabled = is_notice_alert_enabled;
    }

    public boolean isIs_assignment_alert_enabled() {
        return is_assignment_alert_enabled;
    }

    public void setIs_assignment_alert_enabled(boolean is_assignment_alert_enabled) {
        this.is_assignment_alert_enabled = is_assignment_alert_enabled;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
