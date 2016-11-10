package com.sist.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserguideController {

	@RequestMapping(value = "/userguide/guidemenu.do")
	public ModelAndView guide_menu(){
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/userguide/guidemenu.jsp");
		return mv;
	}
	
	@RequestMapping(value = "/userguide/library_map.do")
	public ModelAndView library_map() {
		ModelAndView mv = new ModelAndView("main/main");

		mv.addObject("jsp", "/WEB-INF/jsp/userguide/library_map.jsp");

		return mv;
	}

	@RequestMapping(value = "/userguide/library_time.do")
	public ModelAndView library_time() {
		ModelAndView mv = new ModelAndView("main/main");

		mv.addObject("jsp", "/WEB-INF/jsp/userguide/library_time.jsp");

		return mv;
	}

}
