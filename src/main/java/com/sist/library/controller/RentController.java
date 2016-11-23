package com.sist.library.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookManagerVO;
import com.sist.library.dao.BookVO;
import com.sist.library.service.PcheckService;
import java.util.*;

@Controller
public class RentController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mypageService")
	private PcheckService mypageService;
	
	@RequestMapping(value="/rent/rent.do")
	public ModelAndView rentpage(HttpServletRequest request,@RequestParam(value="page" ,required=false)String page){
		ModelAndView mav = new ModelAndView("main/main");
		page = (page==null)?"1":page;
		String id="";
		if(request.getSession().getAttribute("id") == null){
			mav.addObject("sessionnull","로그인 후 이용가능합니다.");
			return mav;
		}else{
			id = (String) request.getSession().getAttribute("id");
		}
		
		int curPage = Integer.parseInt(page);		
		int totalPage = mypageService.rentPageCount(id);
		int totalRow = mypageService.rentTotalRow(id);
		int block=5;
		int fromPage=((curPage-1)/block*block)+1;
		int toPage=((curPage-1)/block*block)+block;
		if(toPage>totalPage)toPage=totalPage;
		int pageRow = 5;
		int start = (curPage*pageRow)-(pageRow-1);
		int end = start+(pageRow-1);
		
		System.out.println(start);
		System.out.println(end);
		Map map = new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		map.put("id",id);
		List<BookManagerVO> rentList = mypageService.getRentList(map);
		
		mav.addObject("rentList",rentList);	
		mav.addObject("totalPage",totalPage);
		mav.addObject("totalRow",totalRow);
		mav.addObject("fromPage",fromPage);
		mav.addObject("toPage",toPage);
		mav.addObject("block",block);
		mav.addObject("curPage",curPage);
		mav.addObject("jsp", "/WEB-INF/jsp/rent/rent.jsp");		
		mav.addObject("subpage1", "/WEB-INF/jsp/rent/detailrent.jsp");		
		return mav;
	}	
	
	@RequestMapping(value="/rent/rentreturn.do")
	public @ResponseBody String rentReturn(@RequestParam(value="book_code" ,required=true)String book_code){
		String res = "";
		int result = mypageService.rentReturn(book_code);
		if(result>0){
			res="success";
		}else{
			res="fail";
		}
		return res;
	}
	
	@RequestMapping(value="/rent/reserve.do")
	public ModelAndView reservePage(HttpServletRequest request,@RequestParam(value="page" ,required=false)String page){
		ModelAndView mav = new ModelAndView("main/main");
		page = (page==null)?"1":page;
		String id = (String) request.getSession().getAttribute("id");
		System.out.println(id);
		
		int curPage = Integer.parseInt(page);		
		int totalPage = mypageService.reservePageCount(id);
		int totalRow = mypageService.reserveTotalRow(id);
		int block=5;
		int fromPage=((curPage-1)/block*block)+1;
		int toPage=((curPage-1)/block*block)+block;
		if(toPage>totalPage)toPage=totalPage;
		int pageRow = 5;
		int start = (curPage*pageRow)-(pageRow-1);
		int end = start+(pageRow-1);
		
		Map map = new HashMap<>();
		System.out.println(start);
		System.out.println(end);
		System.out.println(id);
		map.put("start", start);
		map.put("end",end);
		map.put("id",id);
		
		List<BookManagerVO> reserveList = mypageService.getReserveList(map);
		
		mav.addObject("reserveList",reserveList);	
		mav.addObject("totalPage",totalPage);
		mav.addObject("totalRow",totalRow);
		mav.addObject("fromPage",fromPage);
		mav.addObject("toPage",toPage);
		mav.addObject("block",block);
		mav.addObject("curPage",curPage);
		mav.addObject("jsp", "/WEB-INF/jsp/rent/rent.jsp");		
		mav.addObject("subpage1", "/WEB-INF/jsp/rent/detailreserve.jsp");			
		return mav;
	}
	
	@RequestMapping(value="/rent/reserveCancel.do")
	public @ResponseBody String reserceCancel(@RequestParam(value="book_code" ,required=true)String book_code){
		String res = "";
		int result = mypageService.reserveCancel(book_code);
		if(result>0){
			res="success";
		}else{
			res="fail";
		}
		return res;
	}
	
	@RequestMapping(value="/rent/rentDelay.do")
	public @ResponseBody String rentDelay(@RequestParam(value="book_code" ,required=true)String book_code,
			@RequestParam(value="book_management_code" ,required=true)String book_management_code,
			@RequestParam(value="id" ,required=true)String id){
		String res = "";
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("book_code", book_code);
		map.put("book_management_code", book_management_code);
		int result = mypageService.rentDelay(map);
		if(result>0){
			res="success";
		}else{
			res="fail";
		}
		return res;
	}
	
	@RequestMapping(value="/rent/wishbook.do")
	public ModelAndView wishBook(){	
		ModelAndView mav = new ModelAndView("main/main");
		mav.addObject("jsp", "/WEB-INF/jsp/rent/rent.jsp");		
		mav.addObject("subpage1", "/WEB-INF/jsp/rent/wishbook.jsp");		
		return mav;
	}
}
