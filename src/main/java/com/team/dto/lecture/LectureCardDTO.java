package com.team.dto.lecture;

// lecture_id, courseType, professor_id, dept_id, reviewCount, ratingAVG
public class LectureCardDTO {
    private int lecture_id;
    private String courseType;
    private int professor_id;
    private int dept_id;

    public LectureCardDTO(int lecture_id, String courseType, int professor_id, int dept_id) {
        this.lecture_id = lecture_id;
        this.courseType = courseType;
        this.professor_id = professor_id;
        this.dept_id = dept_id;
    }

    public int getLecture_id() {
        return lecture_id;
    }

    public void setLecture_id(int lecture_id) {
        this.lecture_id = lecture_id;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public int getProfessor_id() {
        return professor_id;
    }

    public void setProfessor_id(int professor_id) {
        this.professor_id = professor_id;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }
}
