package com.team.dto.user;

// 클라이언트가 JSON으로 보낼 데이터의 구조와 일치하는 DTO
public class EmailRequestDTO {
    // 필드명은 클라이언트의 JSON 키와 정확히 일치해야 합니다.
    String email;

    // Getter/Setter는 Gson 파싱에는 필수는 아니지만, 일반적인 Java Bean 규약상 추가할 수 있습니다.
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}