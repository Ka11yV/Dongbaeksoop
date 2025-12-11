package com.team.entity;

public class Assignment {
    private String userId;
    private String courseName;
    private String title;
    private String submissionStatus;
    private String dueDate;
    private String timeLeft;

    public Assignment() {
    }

    public Assignment(String userId, String courseName, String title, String submissionStatus, String dueDate,
            String timeLeft) {
        this.userId = userId;
        this.courseName = courseName;
        this.title = title;
        this.submissionStatus = submissionStatus;
        this.dueDate = dueDate;
        this.timeLeft = timeLeft;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubmissionStatus() {
        return submissionStatus;
    }

    public void setSubmissionStatus(String submissionStatus) {
        this.submissionStatus = submissionStatus;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getTimeLeft() {
        return timeLeft;
    }

    public void setTimeLeft(String timeLeft) {
        this.timeLeft = timeLeft;
    }
}
