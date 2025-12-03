package com.team.entity;

// 강의 세부 정보 (lectureId, session, professorId, deptId)
public class LectureDetail {

    // [변경] 스네이크 케이스(_사용) -> 카멜 케이스(대문자 구분)
    private int lectureId;
    private int professorId;
    private int deptId;

    public LectureDetail() {}

    public LectureDetail(int lectureId, int professorId, int deptId) {
        this.lectureId = lectureId;
        this.professorId = professorId;
        this.deptId = deptId;
    }

    // Getter & Setter 메서드 이름도 표준 자바 규약(getLectureId)으로 변경됨

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

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }
}