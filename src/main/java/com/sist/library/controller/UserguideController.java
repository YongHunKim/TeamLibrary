package com.sist.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserguideController {

	@RequestMapping(value = "/userguide/guide.do")
	public ModelAndView guide(){
		ModelAndView mav = new ModelAndView("main/main");
		
		mav.addObject("jsp", "/WEB-INF/jsp/userguide/guide.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/userguide/guidemenu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/userguide/library_map.jsp");
		
		return mav;
	}

	@RequestMapping(value = "/userguide/guidemenu.do")
	public ModelAndView guide_menu(){
		ModelAndView mav = new ModelAndView("main/main");
		
		mav.addObject("jsp", "/WEB-INF/jsp/userguide/guide.jsp");
		mav.addObject("test", "/WEB-INF/jsp/userguide/library_map.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/userguide/library_map.do")
	public ModelAndView library_map() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/userguide/guide.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/userguide/guidemenu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/userguide/library_map.jsp");

		return mav;
	}

	@RequestMapping(value = "/userguide/library_time.do")
	public ModelAndView library_time() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/userguide/guide.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/userguide/guidemenu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/userguide/library_time.jsp");
		return mav;
	}

}
