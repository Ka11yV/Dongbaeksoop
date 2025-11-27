package com.team.dto.user;

public class UpdateInfoDTO {
    private String user_id;
    private int dept_id;
    private int grade;
    private String password;

    public UpdateInfoDTO(){}

    public UpdateInfoDTO(String user_id, int dept_id, int grade, String password) {
        this.user_id = user_id;
        this.dept_id = dept_id;
        this.grade = grade;
        this.password = password;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
