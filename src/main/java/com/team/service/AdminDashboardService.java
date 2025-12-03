package com.team.service;

import com.team.dao.UserDAO;
import com.team.entity.User;

import java.util.List;

public class AdminDashboardService {
    UserDAO userDAO = new UserDAO();

    public int getUserCount() {
        return userDAO.getUserCount();
    }

    public List<User> getUserList() {
        return userDAO.getUserList();
    }


}
