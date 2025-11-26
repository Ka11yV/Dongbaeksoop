package com.team.dto.user;

public class UserRegisterDTO {
    private String userId;
    private String email;
    private String password;
    private String deptId;
    private String grade;

    public UserRegisterDTO(String userId, String email, String password, String confirmPassword, String deptId, String grade) {
        this.userId = userId;
        this.email = email;
        this.password = password;
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

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }


}
