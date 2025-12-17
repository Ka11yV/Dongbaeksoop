package com.team.dto.lecture;

public class ReviewSummaryDTO {
    private double avgRating;
    private int countReview;
    private int count5star;
    private int count4star;
    private int count3star;
    private int count2star;
    private int count1star;
    private String avgDifficulty;
    private String avgWorkload;
    private String avgTeamProject;
    private String avgAttendanceMethod;

    public ReviewSummaryDTO(double avgRating, int countReview, int count5star, int count4star, int count3star, int count2star, int count1star, String avgDifficulty, String avgWorkload, String avgTeamProject, String avgAttendanceMethod) {
        this.avgRating = avgRating;
        this.countReview = countReview;
        this.count5star = count5star;
        this.count4star = count4star;
        this.count3star = count3star;
        this.count2star = count2star;
        this.count1star = count1star;
        this.avgDifficulty = avgDifficulty;
        this.avgWorkload = avgWorkload;
        this.avgTeamProject = avgTeamProject;
        this.avgAttendanceMethod = avgAttendanceMethod;
    }

    public double getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(double avgRating) {
        this.avgRating = avgRating;
    }

    public int getCountReview() {
        return countReview;
    }

    public void setCountReview(int countReview) {
        this.countReview = countReview;
    }

    public int getCount5star() {
        return count5star;
    }

    public void setCount5star(int count5star) {
        this.count5star = count5star;
    }

    public int getCount4star() {
        return count4star;
    }

    public void setCount4star(int count4star) {
        this.count4star = count4star;
    }

    public int getCount3star() {
        return count3star;
    }

    public void setCount3star(int count3star) {
        this.count3star = count3star;
    }

    public int getCount2star() {
        return count2star;
    }

    public void setCount2star(int count2star) {
        this.count2star = count2star;
    }

    public int getCount1star() {
        return count1star;
    }

    public void setCount1star(int count1star) {
        this.count1star = count1star;
    }

    public String getAvgDifficulty() {
        return avgDifficulty;
    }

    public void setAvgDifficulty(String avgDifficulty) {
        this.avgDifficulty = avgDifficulty;
    }

    public String getAvgWorkload() {
        return avgWorkload;
    }

    public void setAvgWorkload(String avgWorkload) {
        this.avgWorkload = avgWorkload;
    }

    public String getAvgTeamProject() {
        return avgTeamProject;
    }

    public void setAvgTeamProject(String avgTeamProject) {
        this.avgTeamProject = avgTeamProject;
    }

    public String getAvgAttendanceMethod() {
        return avgAttendanceMethod;
    }

    public void setAvgAttendanceMethod(String avgAttendanceMethod) {
        this.avgAttendanceMethod = avgAttendanceMethod;
    }
}
