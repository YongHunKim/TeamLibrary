package com.sist.library.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.sist.library.dao.BookVO;
import com.sist.library.service.SearchService;

@Controller
public class SearchController {
	
	@Resource(name="searchService")
	private SearchService searchService;
	
	@RequestMapping(value = "/search/search.do")
	public ModelAndView delay_form() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/search/search.jsp");

		return mav;
	}
	
	public ModelAndView search_ok(@RequestParam(value="page" ,required=false)String page,String searchWord){
		ModelAndView mav = new ModelAndView("main/main");
		
		page = (page==null) ? "1" : page;
		int numPage = Integer.parseInt(page);
		List<BookVO> list = searchService.search(numPage,searchWord);
		mav.addObject("list", list);
		mav.addObject("jsp", "/WEB-INF/jsp/search/search.jsp");

		return mav;

	}
}
