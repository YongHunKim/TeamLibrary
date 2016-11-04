package com.sist.library.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookManagerVO;
import com.sist.library.service.RentalService;

@Controller
public class RentalController {
	
	@Resource(name = "rentalService")
	private RentalService rentalService;
	
	@RequestMapping(value="/mypage/rental_guide.do")
	public ModelAndView rental_guide(){
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/rental_guide.jsp");
		mv.addObject("rentalpage", "/WEB-INF/jsp/mypage/rental.jsp");
		mv.addObject("reservationpage", "/WEB-INF/jsp/mypage/reservation.jsp");
		return mv;
	}
	
	@RequestMapping(value="/mypage/retal.do")
	public ModelAndView rental_history(String id){
		ModelAndView mv = new ModelAndView("main/main");

		List<BookManagerVO> list = rentalService.rental_history(id);
		mv.addObject("rental", list);
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/rental.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/mypage/reservation.do")
	public ModelAndView reservation_history(String id){
		ModelAndView mv = new ModelAndView("main/main");
		
		List<BookManagerVO> list = rentalService.reservation_history(id);
		mv.addObject("reservation", list);
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/reservation.jsp");
		
		return mv;
	}
}
