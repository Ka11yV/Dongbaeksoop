package com.team.dto.lecture;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ReviewInfoDTO {
    private int lectureId;
    private int professorId;
    private String courseSemester;
    private int rating;
    private String difficulty;
    private String workload;
    private String teamProject;
    private String attendanceMethod;
    private String content;
    private Timestamp createdAt;

    public ReviewInfoDTO(int lectureId, int professorId, String courseSemester, int rating, String difficulty, String workload, String teamProject, String attendanceMethod, String content, Timestamp createdAt) {
        this.lectureId = lectureId;
        this.professorId = professorId;
        this.courseSemester = courseSemester;
        this.rating = rating;
        this.difficulty = difficulty;
        this.workload = workload;
        this.teamProject = teamProject;
        this.attendanceMethod = attendanceMethod;
        this.content = content;
        this.createdAt = createdAt;
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

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
