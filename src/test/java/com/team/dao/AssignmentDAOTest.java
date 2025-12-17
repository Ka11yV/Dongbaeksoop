package com.team.dao;

import com.team.entity.Assignment;
import org.junit.jupiter.api.Test;
import java.util.List;

public class AssignmentDAOTest {

    @Test
    public void testGetAssignments() {
        AssignmentDAO dao = new AssignmentDAO();
        // Try with the userId from the example
        String userIdStr = "11";

        // Check if user exists
        UserDAO userDAO = new UserDAO();
        int userId = -1;

        if (!userDAO.isUserIdExists(userIdStr)) {
            System.out.println("User " + userIdStr + " does not exist. Creating...");
            com.team.entity.User newUser = new com.team.entity.User();
            newUser.setUserId(userIdStr);
            newUser.setEmail("test@test.com");
            newUser.setPassword("password");
            newUser.setDeptId(1);
            newUser.setGrade(1);
            userDAO.insertUser(newUser);
        }

        // Get the integer ID of the user
        com.team.entity.User user = userDAO.getByUserId(userIdStr);
        userId = user.getId();

        List<Assignment> list = dao.getAssignmentsByUserId(userId);

        if (list.isEmpty()) {
            System.out.println("No assignments found. Inserting sample data...");
            Assignment sample = new Assignment(
                    String.valueOf(userId), // Assuming Assignment entity still stores userId as String for now, or
                                            // needs update?
                    // Wait, Assignment entity userId field is String. If DB column is INT, entity
                    // should probably be INT too,
                    // but for now let's just pass the string representation of the INT ID if the
                    // entity expects String.
                    // However, AssignmentDAO.addAssignment uses assignment.getUserId() which is
                    // String.
                    // If DB column user_id is INT (which it should be for FK), then addAssignment
                    // will fail if we pass "11" (string)
                    // IF "11" is not the INT ID.
                    // But wait, the user said "assignment에 user_id 값은 user 테이블의 userId 값이 아닌 id
                    // 입니다."
                    // So assignment.user_id should be the INT ID.
                    // So Assignment entity's userId field should probably hold the INT ID.
                    // But it is defined as String.
                    // I should probably update Assignment entity to have int userId (or int
                    // userPkId).
                    // For now, I will store the INT ID as a String in the Assignment entity to
                    // minimize changes,
                    // unless I update Assignment entity too.
                    // Let's update Assignment entity to be consistent.
                    "알고리즘[YC]",
                    "13주차_과제",
                    "제출 안 함",
                    "2025-12-7 23:55",
                    "1 일 3 시간");
            // We need to update Assignment entity to store int userId if we want to be
            // clean,
            // or just put the int ID in the string field.
            // Let's put the int ID in the string field for now to avoid changing Entity
            // signature if not strictly needed,
            // BUT `addAssignment` sets string to prepared statement. If column is INT, JDBC
            // might handle "123" -> 123 conversion,
            // but it's risky.
            // Let's check TableInitializer again. I defined user_id as VARCHAR(50) in
            // TableInitializer!
            // "user_id VARCHAR(50)"
            // The user said "assignment에 user_id 값은 user 테이블의 userId 값이 아닌 id 입니다."
            // So the column `user_id` in `assignment` table SHOULD BE INT if `user.id` is
            // INT.
            // I need to recreate the table with INT user_id.

            // Let's first finish this replacement to fix compilation error, then I will fix
            // the table.

            // Actually, I should fix the test to use the int ID.

            sample.setUserId(String.valueOf(userId));
            boolean added = dao.addAssignment(sample);
            System.out.println("Insert result: " + added);
            list = dao.getAssignmentsByUserId(userId);
        }

        System.out.println("Assignments found: " + list.size());
        for (Assignment a : list) {
            System.out.println(a.getTitle());
        }
    }
}
