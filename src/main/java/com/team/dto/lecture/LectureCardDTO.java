package com.team.dto.lecture;

public class LectureCardDTO {
    private String lectureName;
    private String courseType;
    private String professorName;
    private String deptName;
    private int lectureId;
    private int professorId;

    public LectureCardDTO(String lectureName, String courseType, String professorName, String deptName, int lectureId, int professorId) {
        this.lectureName = lectureName;
        this.courseType = courseType;
        this.professorName = professorName;
        this.deptName = deptName;
        this.lectureId = lectureId;
        this.professorId = professorId;
    }

    public LectureCardDTO(int lectureId, int professorId) {
        this.lectureId = lectureId;
        this.professorId = professorId;
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
}
