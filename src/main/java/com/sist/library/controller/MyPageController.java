package com.sist.library.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.service.PcheckService;

@Controller
public class MyPageController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mypageService")
	private PcheckService mypageService;

	@RequestMapping(value = "/mypage/mypage.do")
	public ModelAndView mypage() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
		
		mav.addObject("submenu", "/WEB-INF/jsp/mypage/mypage_submenu.jsp");
		return mav;
	}

	@RequestMapping(value = "/mypage/mypage_submenu.do")
	public ModelAndView mypage_submenu() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/mypage/mypage_submenu.jsp");

		return mav;
	}

	@RequestMapping(value = "/mypage/member_pcheck.do")
	public ModelAndView member_pcheck() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/mypage/member_pcheck.jsp");

		return mav;
	}

	@RequestMapping(value = "/mypage/member_pcheck_ok.do")
	public @ResponseBody String pcheck_ok(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer();
		String id = request.getParameter("id");
		String pwd = request.getParameter("check_pwd");
		int result = mypageService.pcheck_ok(id, pwd);
		if (result > 0) {
			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60 * 30);
			sb.append("<script type='text/javascript'>");
			sb.append("location.href = '/mypage/member_update.do';");
			sb.append("</script>");
		} else {
			sb.append("<script type='text/javascript'>");
			sb.append("alert('보안암호를 확인하세요.');");
			sb.append("location.href = '/mypage/mypage.do';");
			sb.append("</script>");
		}
		
		return sb.toString();
	}

	@RequestMapping(value = "/mypage/member_update.do")
	public ModelAndView member_update(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("main/main");

		HttpSession session = request.getSession(true);
		String id = request.getParameter("id");
		
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/member_update.jsp");

		return mav;
	}
	
	@RequestMapping(value = "/mypage/member_leave.do")
	public ModelAndView member_leave(){
		ModelAndView mav = new ModelAndView("main/main");
		
		mav.addObject("jsp", "/WEB-INF/jsp/mypage/member_leave.jsp");
		
		return mav;
	}

}
