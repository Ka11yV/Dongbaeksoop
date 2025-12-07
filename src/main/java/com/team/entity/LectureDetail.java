package com.team.entity;

public class LectureDetail {
    // 1:1 매칭
    private int lecture_id;
    private int professor_id;
    private int dept_id;

    public LectureDetail(int lecture_id, int professor_id, int dept_id) {
        this.lecture_id = lecture_id;
        this.professor_id = professor_id;
        this.dept_id = dept_id;
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

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }
}


