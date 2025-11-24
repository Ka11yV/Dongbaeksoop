package com.team.dto.user;

public class UserLoginDTO {
    private String userId;
    private String password;

    public UserLoginDTO(String password, String userId) {
        this.userId = userId;
        this.password = password;
    }

    public UserLoginDTO() {

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
}
