package com.team.service;

import com.team.dao.LectureDAO;
import com.team.dto.lecture.LectureInfoDTO;

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
}
