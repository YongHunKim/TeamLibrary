package com.sist.library.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookManagerVO;
import com.sist.library.service.RentalService;

@Controller
public class RentalController {
	
	@Resource(name = "rentalService")
	private RentalService rentalService;
	
	@RequestMapping(value="/mypage/rental_guide.do")
	public ModelAndView rental_guide(@RequestParam(value="id", required=true)String id){
		ModelAndView mav = new ModelAndView("main/main");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/rental_guide.jsp");
		mav.addObject("rentalpage", "/WEB-INF/jsp/mypage/rental.jsp");
		mav.addObject("reservationpage", "/WEB-INF/jsp/mypage/reservation.jsp");
		return mav;
	}
	
	@RequestMapping(value="/mypage/retal.do")
	public ModelAndView rental_history(String id) throws Exception{
		ModelAndView mav = new ModelAndView("main/main");
		
		
		
		List<BookManagerVO> list = rentalService.rental_history(id);
		mav.addObject("rental", list);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/rental.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/mypage/reservation.do")
	public ModelAndView reservation_history(@RequestParam(value="id", required=true)String id) throws Exception{
		ModelAndView mav = new ModelAndView("main/main");
		System.out.println(id);
		
		List<BookManagerVO> list = rentalService.reservation_history(id);
		mav.addObject("reservation", list);
		
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/reservation.jsp");
		
		return mav;
	}
}
