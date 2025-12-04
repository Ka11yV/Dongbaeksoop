package com.team.service;

import com.team.dao.LectureDAO;
import com.team.dto.lecture.LectureCardDTO;

import java.util.ArrayList;

public class LectureService {
    LectureDAO lectureDAO = new LectureDAO();

    public ArrayList<LectureCardDTO> getLectureCards() {
        ArrayList<LectureCardDTO> lectureList = lectureDAO.getLectureCard();

        if(lectureList == null) {  // 조회된 내용이 없을 때
            System.out.println("조회된 내용이 없습니다.");
            return new ArrayList<>();
        }

        return lectureList;
    }
}
