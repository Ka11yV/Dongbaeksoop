package com.team.dto.lecture;

// (user_id, lecture_id, professor_id, course_semester, rating, difficulty, workload, team_project, attendance_method, content)
public class LectureReviewDTO {
    private int user_id;
    private int lecture_id;
    private int professor_id;
    private String course_semester;
    private int rating;
    private String difficulty;
    private String workload;
    private String team_project;
    private String attendance_method;
    private String content;


    public LectureReviewDTO(int user_id, int lecture_id, int professor_id, String course_semester, int rating, String difficulty, String workload, String team_project, String attendance_method, String content) {
        this.user_id = user_id;
        this.lecture_id = lecture_id;
        this.professor_id = professor_id;
        this.course_semester = course_semester;
        this.rating = rating;
        this.difficulty = difficulty;
        this.workload = workload;
        this.team_project = team_project;
        this.attendance_method = attendance_method;
        this.content = content;
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

    public String getCourse_semester() {
        return course_semester;
    }

    public void setCourse_semester(String course_semester) {
        this.course_semester = course_semester;
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
}
