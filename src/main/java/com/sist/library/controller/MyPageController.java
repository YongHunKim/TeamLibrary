package com.sist.library.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookRecommendVO;
import com.sist.library.dao.MemberVO;
import com.sist.library.dao.WishListVO;
import com.sist.library.service.PcheckService;

@Controller
public class MyPageController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mypageService")
	private PcheckService mypageService;

	@RequestMapping(value = "/mypage/mypage.do")
	public ModelAndView mypage(@RequestParam(value = "page", required=false)String page,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("main/main");

		page = (page == null) ? "1" : page;
		int curPage = Integer.parseInt(page);
		String id = (String) request.getSession().getAttribute("id");
		List<WishListVO> list = mypageService.wishlist(curPage, id);
		int totalPage = mypageService.wishPage(id); 
		int totalRow = mypageService.wishRow(id);
		int block = 5;
		int fromPage = ((curPage-1)/block * block)+1;
		System.out.println(fromPage);
		int toPage = ((curPage-1)/block * block)+block;
		System.out.println(toPage);
		if(toPage > totalPage) toPage = totalPage;
		
		mav.addObject("totalRow", totalRow);
		mav.addObject("block", block);
		mav.addObject("toPage", toPage);
		mav.addObject("fromPage", fromPage);
		mav.addObject("totalPage", totalPage);
		mav.addObject("curPage", curPage);
		mav.addObject("id", id);
		mav.addObject("list", list);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/mybook.jsp");

		return mav;
	}

	@RequestMapping(value = "/mypage/mypage_menu.do")
	public ModelAndView mypage_menu() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");

		return mav;
	}

	@RequestMapping(value = "/mypage/member_pcheck.do")
	public ModelAndView member_pcheck() {
		ModelAndView mav = new ModelAndView("main/main");
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/member_pcheck.jsp");
		return mav;
	}

	@RequestMapping(value = "/mypage/member_pcheck_ok.do")
	public @ResponseBody String pcheck_ok(@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "pwd", required = true) String pwd) {

		System.out.println(id);
		System.out.println(pwd);

		String res = "";
		int result = mypageService.pcheck_ok(id, pwd);
		System.out.println(result);

		if (result > 0) {
			res = "success";
		} else {
			res = "fail";
		}

		return res;
	}

	@RequestMapping(value = "/mypage/member_update.do")
	public ModelAndView member_update(@RequestParam(value = "id", required = true) String id,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");
		// System.out.println(id);
		String pwd = request.getParameter("pwd");
		MemberVO vo = mypageService.member_update(id, pwd);
		mav.addObject("vo", vo);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/member_update.jsp");

		return mav;
	}

	@RequestMapping(value = "/mypage/member_update_ok.do")
	public @ResponseBody String member_update_ok(MemberVO vo) {
		String res = "";
		int result = mypageService.member_update_ok(vo);
		System.out.println(result);
		if (result > 0) {
			res = "success";
		} else {
			res = "fail";
		}
		return res;
	}

	@RequestMapping(value = "/mypage/mybook.do")
	public ModelAndView mybook(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "id", required = false) String id) {
		ModelAndView mav = new ModelAndView("main/main");

		page = (page == null) ? "1" : page;
		int curPage = Integer.parseInt(page);
		System.out.println(curPage);
		List<WishListVO> list = mypageService.wishlist(curPage, id);
		int totalPage = mypageService.wishPage(id);
		int totalRow = mypageService.wishRow(id);
		int block = 5;
		int fromPage = ((curPage - 1) / block * block) + 1;
		System.out.println(fromPage);
		int toPage = ((curPage - 1) / block * block) + block;
		System.out.println(toPage);
		if (toPage > totalPage)
			toPage = totalPage;

		mav.addObject("totalRow", totalRow);
		mav.addObject("block", block);
		mav.addObject("toPage", toPage);
		mav.addObject("fromPage", fromPage);
		mav.addObject("totalPage", totalPage);
		mav.addObject("curPage", curPage);
		mav.addObject("id", id);
		mav.addObject("list", list);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/mybook.jsp");

		return mav;
	}

	@RequestMapping(value = "/mypage/rec_select.do")
	public ModelAndView rec_select(@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "page", required = false) String page) {
		ModelAndView mav = new ModelAndView("main/main");
		System.out.println(id);
		// 리스트로 뽑기, 그리고 페이징 처리

		page = (page == null) ? "1" : page;
		int curPage = Integer.parseInt(page);
		List<BookRecommendVO> list = mypageService.rec_select(curPage, id);
		int totalPage = mypageService.recPage(id);
		int totalRow = mypageService.recRow(id);
		int block = 5;
		int fromPage = ((curPage - 1) / block * block) + 1;
		int toPage = ((curPage - 1) / block * block) + block;
		if (toPage > totalPage)
			toPage = totalPage;
		System.out.println(list.size());
		mav.addObject("totalRow", totalRow);
		mav.addObject("block", block);
		mav.addObject("toPage", toPage);
		mav.addObject("fromPage", fromPage);
		mav.addObject("totalPage", totalPage);
		mav.addObject("curPage", curPage);
		mav.addObject("id", id);
		mav.addObject("rec", list);
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/rec_select.jsp");
		return mav;
	}

	@RequestMapping(value = "/mypage/member_leave.do")
	public ModelAndView member_leave() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		mav.addObject("menu", "/WEB-INF/jsp/mypage/mypage_menu.jsp");
		mav.addObject("test", "/WEB-INF/jsp/mypage/member_leave.jsp");

		return mav;
	}

	@RequestMapping(value = "/mypage/member_leave_ok.do")
	public @ResponseBody String member_leave_ok(HttpServletRequest request,
			@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "pwd", required = true) String pwd) {

		String res = "";
		int result = mypageService.member_secession(id, pwd);

		if (result > 0) {
			request.getSession().removeAttribute("id");
			request.getSession().invalidate();
			res = "success";
		} else {
			res = "fail";
		}

		return res;
	}

}
