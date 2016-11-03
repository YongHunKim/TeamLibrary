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
		mav.addObject("type","search");
		mav.addObject("jsp", "/WEB-INF/jsp/search/search.jsp");

		return mav;
	}
	
	@RequestMapping(value="/search/search_ok.do")
	public ModelAndView search_ok(@RequestParam(value="page" ,required=false)String page,String searchWord){
		ModelAndView mav = new ModelAndView("main/main");
		page = (page==null) ? "1" : page;
		int curPage = Integer.parseInt(page);
		List<BookVO> list = searchService.search(curPage,searchWord);
		int totalPage = searchService.pageCount(searchWord);
		int totalRow = searchService.totalRow(searchWord);
		int block=5;
		int fromPage=((curPage-1)/block*block)+1;
		int toPage=((curPage-1)/block*block)+block;
		if(toPage>totalPage)toPage=totalPage;
		
		mav.addObject("totalRow", totalRow);
		mav.addObject("block",block);
		mav.addObject("toPage",toPage);
		mav.addObject("fromPage", fromPage);
		mav.addObject("totalPage",totalPage);
		mav.addObject("curPage",curPage );
		mav.addObject("searchWord", searchWord);
		mav.addObject("list", list);
		mav.addObject("type","search");
		mav.addObject("jsp", "/WEB-INF/jsp/search/search.jsp");
		
		return mav;

	}
	
	@RequestMapping(value="/search/newbook.do")
	public ModelAndView newbook(@RequestParam(value="page" ,required=false)String page){
		ModelAndView mav = new ModelAndView("main/main");
		page = (page==null) ? "1" : page;
		int curPage = Integer.parseInt(page);
		List<BookVO> list = searchService.newbook(curPage);
		int totalPage = searchService.newBookCount();
		int totalRow = searchService.newBookRow();
		int block=5;
		int fromPage=((curPage-1)/block*block)+1;
		int toPage=((curPage-1)/block*block)+block;
		if(toPage>totalPage)toPage=totalPage;
		
		
		mav.addObject("totalRow", totalRow);
		mav.addObject("block",block);
		mav.addObject("toPage",toPage);
		mav.addObject("fromPage", fromPage);
		mav.addObject("totalPage",totalPage);
		mav.addObject("curPage",curPage );
		mav.addObject("list", list);
		mav.addObject("type","newbook");
		mav.addObject("jsp", "/WEB-INF/jsp/search/search.jsp");

		return mav;
	}
	
	@RequestMapping(value="/search/popularbook.do")
	public ModelAndView popularBook(){
		ModelAndView mav = new ModelAndView("main/main");
		
		List<BookVO> list = searchService.popularBook();
		mav.addObject("list", list);
		mav.addObject("type","popular");
		mav.addObject("jsp", "/WEB-INF/jsp/search/search.jsp");
		
		return mav;
	}
}
