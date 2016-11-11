package com.sist.library.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.sist.library.dao.MemberVO;
import com.sist.library.service.LoginService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberService")
	private LoginService memberService;

	@RequestMapping(value = "/login/join.do")
	public ModelAndView join_form() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/login/join.jsp");

		return mav;
		
	}
	

	@RequestMapping(value = "/login/join_ok.do")
	public ModelAndView memberJoin(MemberVO vo) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");
		memberService.insertMember(vo);
		mav.addObject("jsp", "/WEB-INF/jsp/main/default.jsp");
		return mav;
	}

	@RequestMapping(value = "/login/check_id.do")	
	public @ResponseBody String check_id(String id) {
		String result = "";
		int res = memberService.check_id(id);
		if (res > 0) {			
			result = "사용할 수 없는 ID입니다.";
		} else {
			result = "사용가능한 ID입니다.";
		}
		return result;
	}
	
	@RequestMapping(value="/login/login.do")
	public ModelAndView login_form(){
		ModelAndView mav = new ModelAndView("main/main");
		mav.addObject("jsp", "/WEB-INF/jsp/login/login.jsp");
		return mav;
	}
	
	@RequestMapping(value="/login/login_ok.do",method=RequestMethod.POST)
	public @ResponseBody String login_ok(HttpServletRequest request){
		String res = "";
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		int result = memberService.login_ok(id,pwd);
		if(result>0){
			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60*30);
			res = "success";			
		}else{
			res = "fail";			
		}
		return res;
	}
	
	@RequestMapping(value="/login/logout.do")
	public ModelAndView logout(HttpServletRequest request){
		request.getSession().removeAttribute("id");
		request.getSession().invalidate();
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/main/default.jsp");

		return mav;
	}
}	
	
