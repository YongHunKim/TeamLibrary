package com.sist.library.controller;

import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.sist.library.dao.BookRecommendVO;
import com.sist.library.dao.BookVO;
import com.sist.library.dao.MailVO;
import com.sist.library.dao.ReserveVO;
import com.sist.library.dao.WishListVO;
import com.sist.library.mail.MailManager;
import com.sist.library.service.BookService;

@Controller
public class BookController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "bookService")
	private BookService bookService;

	@Autowired
	private MailManager mail;

	@RequestMapping(value = "/book/rent.do")
	public ModelAndView rentForm(@RequestParam(value = "book_code", required = true) String book_code) {

		ModelAndView mav = new ModelAndView("main/main");
		// mav.addObject("book_code",book_code);
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

	@RequestMapping(value = "/book/rent_ok.do")
	public @ResponseBody String rent_ok(@RequestParam(value = "book_code", required = true) String book_code,
			@RequestParam(value = "id", required = true) String id) throws AddressException, MessagingException {
		String str_result = "";
		int result = bookService.bookRent(book_code, id);
		bookService.bookRentyn(book_code);
		int book_management_code = bookService.getBookManagementCode(book_code, id);
		MailVO vo = bookService.mailInfo(book_management_code, id);
		System.out.println(vo.getEmail());
		String type = "rent";
		mail.sendMail(vo, type);

		if (result > 0) {
			str_result = "success";
		} else {
			str_result = "fail";
		}
		return str_result;
	}

	@RequestMapping(value = "/book/reserve.do")
	public ModelAndView reserveForm(@RequestParam(value = "book_code", required = true) String book_code) {

		ModelAndView mav = new ModelAndView("main/main");

		ReserveVO vo = bookService.getReserveInfo(book_code);

		mav.addObject("vo", vo);
		mav.addObject("jsp", "/WEB-INF/jsp/book/reserve.jsp");
		return mav;
	}

	@RequestMapping(value = "/book/reserve_ok.do")
	public @ResponseBody String reserve_ok(@RequestParam(value = "book_code", required = true) String book_code,
			@RequestParam(value = "id", required = true) String id) throws AddressException, MessagingException {

		String str_result = "";
		int result = bookService.bookReserve(book_code, id);
		bookService.bookReserveyn(book_code);
		int book_management_code = bookService.getBookManagementCode(book_code, id);
		MailVO vo = bookService.mailInfo(book_management_code, id);
		System.out.println(vo.getEmail());
		String type = "reserve";
		mail.sendMail(vo, type);

		if (result > 0) {
			str_result = "success";
		} else {
			str_result = "fail";
		}

		return str_result;
	}

	@RequestMapping(value = "/book/detail.do")
	public ModelAndView bookDetail(@RequestParam(value = "book_code", required = true) String book_code,
			@RequestParam(value = "curPage", required = true) String curPage,
			@RequestParam(value = "searchWord", required = true) String searchWord) {
		ModelAndView mav = new ModelAndView("main/main");

		BookVO vo = bookService.bookInfo(book_code);
		System.out.println(book_code);
		// 한줄평 가져오기
		List<BookRecommendVO> reclist = bookService.bookRecommed(book_code);
		mav.addObject("reclist", reclist);
		mav.addObject("vo", vo);
		mav.addObject("curPage", curPage);
		mav.addObject("searchWord", searchWord);
		mav.addObject("jsp", "/WEB-INF/jsp/book/book_detail.jsp");
		return mav;
	}

	@RequestMapping(value = "/book/recInsert.do")
	public @ResponseBody String recInsert(BookRecommendVO vo) {
		String res = "";

		int result = bookService.insertRec(vo);

		if (result > 0) {
			res = "success";
		} else {
			res = "fail";
		}
		// List<BookRecommendVO> list =
		// bookService.bookRecommed(vo.getBook_code()+"");

		return res;
	}

	@RequestMapping(value = "/book/recModify.do")
	public @ResponseBody String recModify(BookRecommendVO vo) {
		String res = "";
		int result = bookService.bookRecommendModify(vo);
		if (result > 0) {
			res = "success";
		} else {
			res = "fail";
		}
		return res;
	}

	@RequestMapping(value = "/book/recDelete.do")
	public @ResponseBody String recDelete(@RequestParam(value = "book_code", required = true) String book_code,
			@RequestParam(value = "book_recommend_code", required = true) String book_recommend_code) {
		String res = "";
		int result = bookService.bookRecommendDelete(book_code, book_recommend_code);

		if (result > 0) {
			res = "success";
		} else {
			res = "fail";
		}
		return res;
	}

	/*
	 * @RequestParam(value="id", required=true)String id,
	 * 
	 * @RequestParam(value="book_code", required=true)String book_code
	 */

	@RequestMapping(value = "/wish/wish_add.do")
	public @ResponseBody String wish_add(@RequestParam(value = "id", required = true)String id,
			@RequestParam(value = "book_code", required = true)String book_code, WishListVO vo) {
		String res = "";
		int wishCount = bookService.wishCheck(id, book_code);
		if(wishCount > 0){
			res= "fail";
		}else{
			int result = bookService.wishInsert(vo);

			if (result > 0) {
				res = "success";
			} else {
				res = "fail";
			}

		}
		
		return res;
	}

}
