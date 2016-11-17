package com.sist.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RentController {
	
	@RequestMapping(value="/rent/rent.do")
	public ModelAndView rentpage(){
		ModelAndView mav = new ModelAndView("main/main");
		
		
		
		mav.addObject("jsp", "/WEB-INF/jsp/rent/rent.jsp");
		mav.addObject("rentsidebar", "/WEB-INF/jsp/rent/rentsidebar.jsp");
		mav.addObject("rentsub", "/WEB-INF/jsp/rent/detailrent.jsp");
		return mav;
	}
}
