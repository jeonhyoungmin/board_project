package com.surup.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BoardListController {
    @GetMapping("/list")
    public String boardListPage(){
        return "boardList";
    }
}
