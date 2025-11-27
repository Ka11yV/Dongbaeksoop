package com.team.service;

import com.team.common.PasswordUtil;
import com.team.dao.UserDAO;
import com.team.dto.user.UpdateInfoDTO;
import com.team.dto.user.UserRegisterDTO;
import com.team.entity.User;
import jakarta.xml.bind.ValidationException;

public class UserService {
    UserDAO userDAO = new UserDAO();

    public boolean registerUser(UserRegisterDTO userDTO) throws ValidationException {

        // 1. 문자열 -> 정수 변환 (한 번만 수행)
        int deptId = 0;
        int grade = 0;
        try {
            deptId = Integer.parseInt(userDTO.getDeptId());
            grade = Integer.parseInt(userDTO.getGrade());
        } catch (NumberFormatException e) {
            throw new ValidationException("학년 또는 학과 ID 값이 유효한 숫자가 아닙니다.");
        }

        if (userDAO.isUserIdExists(userDTO.getUserId()))
            throw new ValidationException("아이디가 중복되었습니다.");

        if (userDAO.isEmailExists(userDTO.getEmail()))
            throw new ValidationException("이메일이 중복되었습니다.");

        if (!userDTO.getEmail().endsWith("@m365.dongyang.ac.kr")) {
            throw new ValidationException("동양미래대학교 이메일만 사용 가능합니다.");
        }

        if (grade < 1 || grade > 4) {
            throw new ValidationException("학년은 1 이상 4 이하여야 합니다.");
        }

        if (deptId < 1 || deptId > 23) {
            System.out.println(deptId);
            throw new ValidationException("학과를 찾을 수 없습니다.");
        }

        String hashPassword = PasswordUtil.hashPassword(userDTO.getPassword());

        User user = new User(
                userDTO.getUserId(),
                userDTO.getEmail(),
                hashPassword,
                deptId,
                grade);

        return userDAO.insertUser(user);

    }

    public boolean isUserIdExists(String userId) {
        return userDAO.isUserIdExists(userId);
    }

    public boolean isEmailExists(String email) {
        return userDAO.isEmailExists(email);
    }

    public String selectUserDept(User user) {return userDAO.selectUserDept(user);}

    public boolean updateDeptAndGrade(UpdateInfoDTO updateInfoDTO) {
        boolean isUpdate = userDAO.updateProfileInformation(updateInfoDTO.getDept_id(), updateInfoDTO.getGrade(),updateInfoDTO.getUser_id());

        if(isUpdate) {  // update 성공
            return true;
        } else {
            return false;
        }
    }

    public boolean updatePassword(UpdateInfoDTO updateInfoDTO) {

        String hashedPassword = PasswordUtil.hashPassword(updateInfoDTO.getPassword());
        boolean isUpdate = userDAO.updatePassword(hashedPassword, updateInfoDTO.getUser_id());

        if(isUpdate) {  // update 성공
            return true;
        } else {
            return false;
        }
    }
}
