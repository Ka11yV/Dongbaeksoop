package com.team.service;

import com.team.dao.LectureDAO;
import com.team.dto.lecture.LectureInfoDTO;
import com.team.dto.lecture.ReviewInfoDTO;
import com.team.dto.lecture.ReviewRegistrationDTO;
import com.team.entity.LectureReview;

import java.util.ArrayList;

public class LectureService {
    LectureDAO lectureDAO = new LectureDAO();

    public ArrayList<LectureInfoDTO> getAllLecturesInfoList() {
        ArrayList<LectureInfoDTO> lectureList = lectureDAO.selectAllLecturesWithDetails();

        if (lectureList.isEmpty()) {
            throw new RuntimeException("조회할 수 있는 강의 목록이 없습니다. - getAllLecturesInfoList");
        }

        return lectureList;
    }

    public int getTotalLectureCount() {
        return lectureDAO.countAllLectures();
    }

    public LectureInfoDTO getLectureInfo(int lectureId, int professorId) {
        LectureInfoDTO lectureInfoDTO = lectureDAO.findLectureInfoByLectureAndProfessor(lectureId, professorId);

        if(lectureInfoDTO == null) {
            throw new RuntimeException("강의를 불러올 수 없습니다. - getLectureInfo");
        }

        return lectureInfoDTO;
    }

    public void registerLectureReview(ReviewRegistrationDTO reviewRegistrationDTO) {
        if(!(reviewRegistrationDTO.getRating() >= 1 && reviewRegistrationDTO.getRating() <= 5)) {
            throw new RuntimeException("평점을 선택해주세요. - registerLectureReview");
        }
        if(reviewRegistrationDTO.getDifficulty().equals("default")
        || reviewRegistrationDTO.getWorkload().equals("default")
        || reviewRegistrationDTO.getTeamProject().equals("default")
        || reviewRegistrationDTO.getAttendanceMethod().equals("default")) {
            throw new RuntimeException("입력값을 넣어주세요. - registerLectureReview");
        }

        LectureReview lectureReview = new LectureReview(
                reviewRegistrationDTO.getUserId(),
                reviewRegistrationDTO.getLectureId(),
                reviewRegistrationDTO.getProfessorId(),
                reviewRegistrationDTO.getCourseSemester(),
                reviewRegistrationDTO.getRating(),
                reviewRegistrationDTO.getDifficulty(),
                reviewRegistrationDTO.getWorkload(),
                reviewRegistrationDTO.getTeamProject(),
                reviewRegistrationDTO.getAttendanceMethod(),
                reviewRegistrationDTO.getContent()
        );

        boolean success = lectureDAO.insertLectureReview(lectureReview);

        if(!success) {
            throw new RuntimeException("평가를 등록할 수 없습니다. - registerLectureReview");
        }
    }

    public ArrayList<ReviewInfoDTO> getLectureReviews(int lectureId, int professorId) {
        ArrayList<ReviewInfoDTO> lectureReviews = lectureDAO.selectLectureReviewsByLectureAndProfessor(lectureId, professorId);

        if(lectureReviews.isEmpty()) {
            throw new RuntimeException("조회할 수 있는 리뷰 목록이 없습니다. - getLectureReviews");
        }

        return lectureReviews;
    }
}
