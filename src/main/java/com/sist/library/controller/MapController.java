package com.sist.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
	@RequestMapping(value="/librarymap/library_map.do")
	public ModelAndView library_map(){
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/librarymap/library_map.jsp");
		
		return mv;
	}
}
