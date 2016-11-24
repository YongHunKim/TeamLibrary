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
		
		mav.addObject("jsp", "/WEB-INF/jsp/main/main.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/sitemap/sitemap.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/rent/rent.jsp");
		
		mav.addObject("jsp", "/WEB-INF/jsp/search/search.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/search/newbook.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/search/popularbook.jsp");
		
		mav.addObject("jsp", "/WEB-INF/jsp/notice/notice.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/lostBoard/list.jsp");
		
		mav.addObject("jsp", "/WEB-INF/jsp/userguide/guide.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/userguide/library_map.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/userguide/library_time.jsp");
		
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mybook.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/member_pcheck.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/member_leave.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/rental_guide.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/reserve_guide.jsp");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/rec_select.jsp");
		
		return mav;
	}
	

}
