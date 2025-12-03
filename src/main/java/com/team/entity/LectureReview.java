package com.team.entity;

import java.time.LocalDateTime;

// 강의리뷰(id, user_id, lecture_id, professor_id, rating, difficulty, workload, team_project, attendance_method, content, created_at)
public class LectureReview {
    private int id;
    private int user_id;
    private int lecture_id;
    private int professor_id;
    private int rating;
    private String difficulty;
    private String workload;
    private String team_project;
    private String attendance_method;
    private String content;
    private LocalDateTime created_at;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getLecture_id() {
        return lecture_id;
    }

    public void setLecture_id(int lecture_id) {
        this.lecture_id = lecture_id;
    }

    public int getProfessor_id() {
        return professor_id;
    }

    public void setProfessor_id(int professor_id) {
        this.professor_id = professor_id;
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

    public String getTeam_project() {
        return team_project;
    }

    public void setTeam_project(String team_project) {
        this.team_project = team_project;
    }

    public String getAttendance_method() {
        return attendance_method;
    }

    public void setAttendance_method(String attendance_method) {
        this.attendance_method = attendance_method;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }
}
