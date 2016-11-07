package com.sist.library.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.sist.library.dao.BookVO;
import com.sist.library.service.BookService;
import com.sist.library.service.SearchService;

@Controller
public class BookController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bookService")
	private BookService bookService;
	
	@RequestMapping(value="/book/rent.do")
	public ModelAndView rentForm(@RequestParam(value="book_code" ,required=true)String book_code){
		
		ModelAndView mav = new ModelAndView("main/main");
		//mav.addObject("book_code",book_code);
		BookVO vo = bookService.bookInfo(book_code);
		mav.addObject("vo", vo);
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, +7);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str_date = sdf.format(date);
		String return_date = sdf.format(cal.getTime());
		
		mav.addObject("today", str_date);
		mav.addObject("return_day", return_date);
		mav.addObject("jsp", "/WEB-INF/jsp/book/rent.jsp");
		return mav;
	}
	
	@RequestMapping(value="/book/rent_ok.do")
	public @ResponseBody String rent_ok(@RequestParam(value="book_code" ,required=true)String book_code,
			@RequestParam(value="id" ,required=true)String id){
		String str_result="";		
		int result = bookService.bookRent(book_code,id);		
		
		if(result>0){
			str_result="success";
		}else{
			str_result="fail";
		}
		return str_result;
	}
	
}
