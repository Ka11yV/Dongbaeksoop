package com.team.service;

import com.team.dao.UserDAO;
import com.team.dto.user.UserRegisterDTO;

public class UserService {
    UserDAO userDAO = new UserDAO();

    public boolean registerUser(UserRegisterDTO userDTO) {
        return true;
    }

    public boolean isUserIdExists(String userId) {
        return userDAO.isUserIdExists(userId);
    }
}
