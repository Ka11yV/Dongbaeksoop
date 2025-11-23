package com.team.common;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import java.sql.Connection;
import java.sql.SQLException;
import static org.junit.jupiter.api.Assertions.*;

class DBUtilTest {

    @Test
    @DisplayName("DB 커넥션 가져오기")
    void getConnection() {
        Connection connection = null;
        try {
            connection = DBUtil.getConnection();
            assertNotNull(connection, "DB 커넥션 객체는 null이 아니어야 합니다.");
            assertTrue(connection.isValid(1), "DB 커넥션은 유효해야 합니다.");
        } catch (SQLException e) {
            fail("DB 연결 중 SQLException이 발생했습니다: " + e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    // 테스트 종료 시 연결을 닫는 데 실패한 것은 테스트 실패로 간주하지 않을 수 있습니다.
                    // 로깅만 할 수도 있습니다.
                    e.printStackTrace();
                }
            }
        }
    }
}
