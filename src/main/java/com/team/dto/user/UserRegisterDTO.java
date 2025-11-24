package com.team.dto.user;

public class UserRegisterDTO {
    private String userId;
    private String email;
    private String password;
    private String confirmPassword;
    private int deptId;
    private int grade;

    public UserRegisterDTO(String userId, String email, String password, String confirmPassword, int deptId, int grade) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.deptId = deptId;
        this.grade = grade;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
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


}
