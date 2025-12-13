package com.team.dto.lecture;

public class LectureInfoDTO {

    private String lectureName;
    private String courseType;
    private String professorName;
    private String deptName;
    private int professorId;
    private int deptId;
    private int lectureId;
    private ReviewSummaryDTO reviewSummaryDTO;

    public LectureInfoDTO(String lectureName, String courseType, String professorName, String deptName, int professorId, int deptId, int lectureId) {
        this.lectureName = lectureName;
        this.courseType = courseType;
        this.professorName = professorName;
        this.deptName = deptName;
        this.professorId = professorId;
        this.deptId = deptId;
        this.lectureId = lectureId;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public String getProfessorName() {
        return professorName;
    }

    public void setProfessorName(String professorName) {
        this.professorName = professorName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public int getProfessorId() {
        return professorId;
    }

    public void setProfessorId(int professorId) {
        this.professorId = professorId;
    }

    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public ReviewSummaryDTO getReviewSummaryDTO() {
        return reviewSummaryDTO;
    }

    public void setReviewSummaryDTO(ReviewSummaryDTO reviewSummaryDTO) {
        this.reviewSummaryDTO = reviewSummaryDTO;
    }
}
