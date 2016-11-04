package com.sist.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SeatController {

	@RequestMapping(value="/seat/seat_view.do")
    public ModelAndView seat_view(){
    	ModelAndView mv = new ModelAndView("main/main");
    
    	mv.addObject("jsp", "/WEB-INF/jsp/seat/seat_view.jsp");
    	
    	return mv;
    }
}
