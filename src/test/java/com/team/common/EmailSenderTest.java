package com.team.common;

import jakarta.mail.MessagingException;
import org.junit.jupiter.api.Test;

class EmailSenderTest {

    @Test
    void sendVerificationEmail_ShouldSendEmailWithCorrectContent() {
        // Given
        String toEmail = "elsword3552@m365.dongyang.ac.kr";
        String authCode = "123456";

        // When & Then
        try {
            EmailSender.sendVerificationEmail(toEmail, authCode);
        } catch (MessagingException e) {
            throw new RuntimeException("Failed to send email", e);
        }
    }
}
