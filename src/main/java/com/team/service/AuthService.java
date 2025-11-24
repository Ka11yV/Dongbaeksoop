package com.team.service;

import com.team.dao.AuthDAO;
import com.team.dto.user.UserLoginDTO;
import com.team.entity.User;

public class AuthService {
    AuthDAO authDAO = new AuthDAO();

     public User login(UserLoginDTO userLoginDTO) {  // userLoginDTO는 사용자가 로그인폼에 작성한 아이디, 비밀번호 묶음
         // 유효성 검사
         // 비어있는지
         if((userLoginDTO.getUserId()).isEmpty()) {
             throw new RuntimeException("아이디가 비어있습니다.");
         } else if((userLoginDTO.getPassword()).isEmpty()) {
             throw new RuntimeException("비밀번호가 비어있습니다.");
         }

         System.out.println(userLoginDTO.getUserId());
         // 아이디로 조회 했을때 컬럼이 있는지 확인
         User user = authDAO.getByUserId(userLoginDTO.getUserId());  // SELECT user_id, password FROM user WHERE user_id = "userLoginDTO.getUSerId()";  쿼리 수행. 조회되면 User 객체 반환, 아니면 null 반환

         if(user != null) {  // 반환값 있으면
             String formPassword = userLoginDTO.getPassword();
             String dbPassword = user.getPassword();

             // 디버깅을 위해 두 비밀번호와 길이를 콘솔에 출력
             System.out.println("Form Password: [" + formPassword + "], Length: " + formPassword.length());
             System.out.println("DB Password: [" + dbPassword + "], Length: " + dbPassword.length());

             System.out.println("user id :" + user.getUserId());
             System.out.println("user password :" + user.getPassword());
             // .trim()으로 양쪽 공백을 제거한 후 비교
             if(formPassword.trim().equals(dbPassword.trim())) {
                 return user;
             } else {
                 throw new RuntimeException("비밀번호가 틀렸습니다.");
             }
         } else {  // 반환값 없으면
             throw new RuntimeException("아이디가 존재하지 않습니다.");
         }
     }
}
