package com.sist.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SeatController {

	@RequestMapping(value = "/seat/seat_view.do")
	public ModelAndView seat_view() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/seat/seat_view.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/seat/seat_menu.jsp");
		
		return mav;
	}

	@RequestMapping(value = "/seat/seat_reserve.do")
	public ModelAndView seat_reserve(){
		ModelAndView mav = new ModelAndView("main/main");
		
		mav.addObject("jsp", "/WEB-INF/jsp/seat/seat_reserve.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/seat/seat_menu.jsp");
		
		return mav;
	}
	
	@RequestMapping(value = "/seat/seat_menu.do")
	public ModelAndView seat_menu(){
		ModelAndView mav = new ModelAndView("main/main");
		
		mav.addObject("jsp", "/WEB-INF/jsp/seat/seat_view.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/seat/seat_reserve.jsp");
		mav.addObject("test1", "/WEB-INF/jsp/seat/seat_select1.jsp");
		mav.addObject("test2", "/WEB-INF/jsp/seat/seat_select2.jsp");
		mav.addObject("test3", "/WEB-INF/jsp/seat/seat_select3.jsp");

		return mav;
	}
	
	@RequestMapping(value = "/seat/seat_select1.do")
	public ModelAndView seat_select1() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/seat_seat_view.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/seat/seat_reserve.jsp");
		mav.addObject("test1", "/WEB-INF/jsp/seat/seat_select1.jsp");

		return mav;
	}

	@RequestMapping(value = "/seat/seat_select2.do")
	public ModelAndView seat_select2() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/seat_seat_view.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/seat/seat_reserve.jsp");
		mav.addObject("test2", "/WEB-INF/jsp/seat/seat_select2.jsp");

		return mav;
	}

	@RequestMapping(value = "/seat/seat_select3.do")
	public ModelAndView seat_select3() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/seat_seat_view.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/seat/seat_reserve.jsp");
		mav.addObject("test3", "/WEB-INF/jsp/seat/seat_select3.jsp");

		return mav;
	}
}
