package com.team.service;

import com.team.dao.AuthDAO;
import com.team.entity.User;

public class AuthService {
    static AuthDAO authDAO = new AuthDAO();

     public static User login(String loginId) {
        return authDAO.getByUserId(loginId);
    }
}
