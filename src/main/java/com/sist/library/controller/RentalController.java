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
	public ModelAndView rental_guide(@RequestParam(value="id", required=true)String id) throws Exception{
		ModelAndView mav = new ModelAndView("main/main");
		
		List<BookManagerVO> rentalList = rentalService.rental_history(id);		
		
		
		mav.addObject("rental", rentalList);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/rental_guide.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/mypage/reserve_guide.do")
	public ModelAndView reserve_guide(@RequestParam(value="id", required=true)String id) throws Exception{
		ModelAndView mav = new ModelAndView("main/main");
		
		List<BookManagerVO> reservationList = rentalService.reservation_history(id);
		
		mav.addObject("reservation", reservationList);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/reserve_guide.jsp");
		
		return mav;
	}
}
