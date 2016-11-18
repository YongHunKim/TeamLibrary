package com.sist.library.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		String id = (String) request.getSession().getAttribute("id");
		System.out.println(id);
		
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
		mav.addObject("subpage2", "/WEB-INF/jsp/rent/detailreserve.jsp");
		mav.addObject("subpage3", "/WEB-INF/jsp/rent/wishbook.jsp");
		return mav;
	}	
	
	
}
