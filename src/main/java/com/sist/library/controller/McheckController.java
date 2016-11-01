package com.sist.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class McheckController {
	
	@RequestMapping(value="/mypage/member_pcheck.do")
	public ModelAndView library_map(){
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/member_pcheck.jsp");
		
		return mv;
	}
}
