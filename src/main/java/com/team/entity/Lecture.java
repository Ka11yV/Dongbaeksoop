package com.team.entity;

public class Lecture {
    private int id;  // 강의 id
    private String courseType;  // 강의 분류(전공 | 교양)
    private String name;

    public Lecture() {}

    public Lecture(int id, String courseType, String name) {
        this.id = id;
        this.courseType = courseType;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourse_type() {
        return courseType;
    }

    public void setCourse_type(String course_type) {
        this.courseType = course_type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
