package com.sist.library.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookVO;
import com.sist.library.dao.WishBookVO;
import com.sist.library.dao.lostBoardVO;
import com.sist.library.service.AdminService;
import com.sist.library.service.SearchService;

@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminService")
	private AdminService AdminService;
	
	@RequestMapping(value="/admin/book_plus.do")
	public ModelAndView book_plus(Map<String, Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/admin/book_plus.jsp");
		
		return mv;
	}
	@RequestMapping(value="/admin/book_plus_ok.do")
    public ModelAndView lostboard_insert_ok(BookVO vo) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	
    	AdminService.book_plus(vo);
    	
    	
    	mv.addObject("jsp", "/WEB-INF/jsp/admin/book_plus_ok.jsp");
    	
    	return mv;
    }
	
	@Resource(name="searchService")
	private SearchService searchService;
	
	@RequestMapping(value = "/admin/book_management.do")
	public ModelAndView delay_form(String page, String searchWord) {
		ModelAndView mav = new ModelAndView("main/main");
		mav.addObject("type","search");
		mav.addObject("page", page);
		mav.addObject("searchWord", searchWord);
		mav.addObject("jsp", "/WEB-INF/jsp/admin/book_management.jsp");

		return mav;
	}
	
	@RequestMapping(value="/admin/book_management_ok.do")
	public ModelAndView search_ok(@RequestParam(value="page" ,required=false)String page,
			@RequestParam(value="searchWord" ,required=false)String searchWord){
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
		mav.addObject("curPage",curPage);
		mav.addObject("searchWord", searchWord);
		mav.addObject("list", list);
		mav.addObject("type","search");
		mav.addObject("jsp", "/WEB-INF/jsp/admin/book_management.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/book_delete.do")
    public ModelAndView book_delete(String book_code, String page, String searchWord) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	
    	mv.addObject("type","search");
		mv.addObject("page", page);
		mv.addObject("searchWord", searchWord);
    	AdminService.book_delete(Long.parseLong(book_code));
    	mv.addObject("jsp", "/WEB-INF/jsp/admin/book_delete.jsp");
    	return mv;
    }
	
	@RequestMapping(value="/admin/book_update.do")
    public ModelAndView book_update(@RequestParam(value="book_code")String book_code) throws Exception{
		
    	ModelAndView mv = new ModelAndView("admin/book_update");
    	BookVO vo = AdminService.book_update(Long.parseLong(book_code)); 	
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/admin/book_update.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/admin/book_update_ok.do")
    public ModelAndView book_update_ok(BookVO vo) throws Exception{
    	ModelAndView mv = new ModelAndView("admin/book_update_ok");

    	AdminService.book_update_ok(vo);
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/admin/book_update_ok.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/admin/wishbooklist.do")
	public ModelAndView wishBookList(@RequestParam(value="page" ,required=false)String page){
		
		page = (page==null)?"1":page;
		int curPage = Integer.parseInt(page);		
		int totalPage = AdminService.wishTotalPage();
		int totalRow = AdminService.wishTotalRow();
		int block=5;
		int fromPage=((curPage-1)/block*block)+1;
		int toPage=((curPage-1)/block*block)+block;
		if(toPage>totalPage)toPage=totalPage;
		int pageRow = 5;
		int start = (curPage*pageRow)-(pageRow-1);
		int end = start+(pageRow-1);
		
		Map map = new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		ModelAndView mav = new ModelAndView("main/main");
		List<WishBookVO> wishList = AdminService.wishBookList(map);
		mav.addObject("wishList",wishList);	
		mav.addObject("totalPage",totalPage);
		mav.addObject("totalRow",totalRow);
		mav.addObject("fromPage",fromPage);
		mav.addObject("toPage",toPage);
		mav.addObject("block",block);
		mav.addObject("curPage",curPage);
		
		mav.addObject("jsp", "/WEB-INF/jsp/admin/wishbook.jsp");
		return mav;		
	}
	
}
