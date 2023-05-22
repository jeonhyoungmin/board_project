package com.surup.board.controller;

import com.surup.board.dao.BoardDao;
import com.surup.board.domain.BoardDto;
import com.surup.board.domain.PageHandler;
import com.surup.board.domain.SearchCondition;
import com.surup.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.Timestamp;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ListIterator;

@Controller
public class BoardListController {

    @Autowired
    BoardService boardService;

    @Autowired
    BoardDao boardDao;

    @GetMapping("/list")
    public String boardListPage(SearchCondition sc, Model m) {
        int numbering = 1;
        int numberingPlus = (sc.getPage() - 1) * sc.getPageSize(); // 페이지 "no"에 (page-1)*10 만큼의 일정 수 더하기

        try {
            int total_cnt = boardService.getCount(sc); // 총 게시물 개수

            PageHandler ph = new PageHandler(total_cnt, sc); // paging
            m.addAttribute("ph", ph);

            List<BoardDto> list = boardService.getPage(sc); // 검색 조건에 해당하는 게시물 List
            ListIterator<BoardDto> listIterator = list.listIterator();
            while (listIterator.hasNext()) { // List<boardDto>의 날짜 데이터 변환 & "no" 추가
                BoardDto boardDto = listIterator.next();
                LocalDateTime reg_date = boardDto.getReg_date();
                String format_date = reg_date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String format_time = reg_date.format(DateTimeFormatter.ofPattern("HH:mm"));
                boardDto.setReg_date_format_date(format_date); // yyyy-MM-dd 날짜 형식으로 저장
                boardDto.setReg_date_format_time(format_time); // HH:mm 시간 형식으로 저장
                boardDto.setReg_date_milliseconds(Timestamp.valueOf(boardDto.getReg_date()).getTime()); // 등록 일자 밀리세컨드 변환 후 저장
                boardDto.setNumbering(numbering + numberingPlus); // numbering 작성
                numbering++;
            }

            m.addAttribute("list", list);

            // 금일 시작 시간
            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli()); // 금일 시작 시간 밀리세컨드 변환 후 저장

        } catch (Exception e) {
            e.printStackTrace();
//            m.addAttribute("msg", "PAGE_NOT_FOUND");
        }

        return "boardList";
    }

}
