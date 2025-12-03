package com.team.service;

import com.team.dao.LectureReviewDAO;
import com.team.dto.lecture.LectureReviewDTO;
import com.team.entity.LectureReview;

public class LectureReviewService {
    LectureReviewDAO lectureReviewDAO = new LectureReviewDAO();

    public boolean isDuplicateReview(LectureReviewDTO lectureReviewDTO) {

        int user_id = lectureReviewDTO.getUser_id();
        int lecture_id = lectureReviewDTO.getLecture_id();
        int professor_id = lectureReviewDTO.getProfessor_id();
        String course_semester = lectureReviewDTO.getCourse_semester();
        int rating = lectureReviewDTO.getRating();
        String difficulty = lectureReviewDTO.getDifficulty();
        String workload = lectureReviewDTO.getWorkload();
        String team_project = lectureReviewDTO.getTeam_project();
        String attendance_method = lectureReviewDTO.getAttendance_method();
        String content = lectureReviewDTO.getContent();

        LectureReview lectureReview = new LectureReview(user_id, lecture_id, professor_id, course_semester, rating, difficulty, workload, team_project, attendance_method, content);  // entity



        return lectureReviewDAO.existsByUserIdAndLectureIdAndSemester(lectureReview);  // 중복X = True / 중복O = False
    }
}
