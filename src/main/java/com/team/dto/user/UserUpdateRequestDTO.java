package com.team.dto.user;

public class UserUpdateRequestDTO {
    private String userId;
    private int deptId;
    private int grade;
    private String password;

    public UserUpdateRequestDTO(){}

    public UserUpdateRequestDTO(String user_id, int dept_id, int grade, String password) {
        this.userId = user_id;
        this.deptId = dept_id;
        this.grade = grade;
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
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
