package com.sist.library.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="/main/main.do")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	mv.addObject("jsp", "/WEB-INF/jsp/main/default.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/sitemap/sitemap")
	public ModelAndView sitemap(){
		ModelAndView mav = new ModelAndView("main/main");
		
		mav.addObject("jsp", "/WEB-INF/jsp/sitemap/sitemap.jsp");
		
		return mav;
	}
	

}
