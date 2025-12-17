package com.team.entity;

import java.time.LocalDateTime;

public class LectureReview {
    // 1:1 매칭
    private int id;
    private int userId;
    private int lectureId;
    private int professorId;
    private String courseSemester;
    private int rating;
    private String difficulty;
    private String workload;
    private String teamProject;
    private String attendanceMethod;
    private String content;
    private LocalDateTime createdAt;

    public LectureReview(int userId, int lectureId, int professorId, String courseSemester, int rating, String difficulty, String workload, String teamProject, String attendanceMethod, String content) {
        this.userId = userId;
        this.lectureId = lectureId;
        this.professorId = professorId;
        this.courseSemester = courseSemester;
        this.rating = rating;
        this.difficulty = difficulty;
        this.workload = workload;
        this.teamProject = teamProject;
        this.attendanceMethod = attendanceMethod;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public int getProfessorId() {
        return professorId;
    }

    public void setProfessorId(int professorId) {
        this.professorId = professorId;
    }

    public String getCourseSemester() {
        return courseSemester;
    }

    public void setCourseSemester(String courseSemester) {
        this.courseSemester = courseSemester;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getWorkload() {
        return workload;
    }

    public void setWorkload(String workload) {
        this.workload = workload;
    }

    public String getTeamProject() {
        return teamProject;
    }

    public void setTeamProject(String teamProject) {
        this.teamProject = teamProject;
    }

    public String getAttendanceMethod() {
        return attendanceMethod;
    }

    public void setAttendanceMethod(String attendanceMethod) {
        this.attendanceMethod = attendanceMethod;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
