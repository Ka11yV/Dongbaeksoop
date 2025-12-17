package com.team.dao;

import com.team.entity.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class UserDAOTest {

    @Test
    @DisplayName("모든 유저 조회 테스트")
    void getAllUsers() {
        // given
        UserDAO userDAO = new UserDAO();

        // when
        List<User> userList = userDAO.getAllUsers();

        // then
        assertNotNull(userList, "유저 리스트는 null이 아니어야 합니다.");
        System.out.println("조회된 유저 수: " + userList.size());

        for (User user : userList) {
            System.out.println("User: " + user.getUserId() + ", Email: " + user.getEmail());
        }
    }
}
