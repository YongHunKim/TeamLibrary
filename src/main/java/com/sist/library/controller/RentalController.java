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

	@RequestMapping(value = "/mypage/rental_guide.do")
	public ModelAndView rental_guide(@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "page", required = false) String page) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");
		System.out.println(id);

		page = (page == null) ? "1" : page;
		int curPage = Integer.parseInt(page);
		List<BookManagerVO> rentalList = rentalService.rental_history(curPage, id);
		int totalPage = rentalService.rentalPage(id);
		int totalRow = rentalService.rentalRow(id);
		int block = 5;
		int fromPage = ((curPage - 1) / block * block) + 1;
		int toPage = ((curPage - 1) / block * block) + block;
		if (toPage > totalPage)
			toPage = totalPage;

		mav.addObject("totalRow", totalRow);
		mav.addObject("block", block);
		mav.addObject("toPage", toPage);
		mav.addObject("fromPage", fromPage);
		mav.addObject("totalPage", totalPage);
		mav.addObject("curPage", curPage);
		mav.addObject("id", id);
		mav.addObject("rental", rentalList);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/rental_guide.jsp");
		return mav;
	}

	@RequestMapping(value = "/mypage/reserve_guide.do")
	public ModelAndView reserve_guide(@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "page", required = false) String page) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");

		page = (page == null) ? "1" : page;
		int curPage = Integer.parseInt(page);
		List<BookManagerVO> reservationList = rentalService.reservation_history(curPage, id);
		int totalPage = rentalService.reservePage(id);
		int totalRow = rentalService.rentalRow(id);
		int block = 5;
		int fromPage = ((curPage - 1) / block * block) + 1;
		int toPage = ((curPage - 1) / block * block) + block;
		if (toPage > totalPage)
			toPage = totalPage;

		mav.addObject("totalRow", totalRow);
		mav.addObject("block", block);
		mav.addObject("toPage", toPage);
		mav.addObject("fromPage", fromPage);
		mav.addObject("totalPage", totalPage);
		mav.addObject("curPage", curPage);
		mav.addObject("reservation", reservationList);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/reserve_guide.jsp");

		return mav;
	}
}
