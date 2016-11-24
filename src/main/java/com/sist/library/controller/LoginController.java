package com.sist.library.controller;

import javax.annotation.Resource;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import com.sist.library.dao.MailVO;
import com.sist.library.dao.MemberVO;
import com.sist.library.mail.MailManager;
import com.sist.library.service.LoginService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberService")
	private LoginService memberService;
	
	@Autowired
	private MailManager mail;

	@RequestMapping(value = "/login/join.do")
	public ModelAndView join_form() {
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/login/join.jsp");

		return mav;
		
	}
	

	@RequestMapping(value = "/login/join_ok.do")
	public @ResponseBody String memberJoin(MemberVO vo) throws Exception {
		//ModelAndView mav = new ModelAndView("main/main");
		String res="";
		int result = memberService.insertMember(vo);
		//mav.addObject("jsp", "/WEB-INF/jsp/main/default.jsp");
		if(result>0){
			res="success";
		}else{
			res="fail";
		}
		return res;
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
	public @ResponseBody String logout(HttpServletRequest request){
		request.getSession().removeAttribute("id");
		request.getSession().invalidate();

		return "success";
	}
	
	@RequestMapping(value="/login/findid.do")
	public ModelAndView findIdView(){
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/login/findid.jsp");

		return mav;
	}
	
	@RequestMapping(value="/login/findid_ok.do")
	public @ResponseBody String findIdOk(@RequestParam(value="name" ,required=true)String name,
			@RequestParam(value="email" ,required=true)String email) throws AddressException, MessagingException{
		String res = "";
		Map map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		int result = memberService.findId(map);
		if(result>0){
			String type="findid";
			MailVO vo = memberService.findmail(map);
			mail.sendMail(vo, type);
			res = "success";
		}else{
			res = "fail";
		}
		return res;
	}
	
	@RequestMapping(value="/login/findpwd.do")
	public ModelAndView findPwdView(){
		ModelAndView mav = new ModelAndView("main/main");

		mav.addObject("jsp", "/WEB-INF/jsp/login/findpwd.jsp");

		return mav;
	}
	
	@RequestMapping(value="/login/findpwd_ok.do")
	public @ResponseBody String findpwdOk(@RequestParam(value="id" ,required=true)String id,
			@RequestParam(value="email" ,required=true)String email) throws AddressException, MessagingException{
		String res = "";
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		int result = memberService.findPwd(map);
		if(result>0){
			String type="findpwd";
			MailVO vo = memberService.findPwdMail(map);
			char[] charset = new char[]{'1','2','3','4','5','6','7','8','9','0',
					'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u',
					'v','w','x','y','z'
			};
			String randomPwd = "";
			for(int i=0;i<8;i++){
				randomPwd += charset[(int)(Math.random()*35)];
			}
			vo.setPwd(randomPwd);
			Map changeMap = new HashMap<>();
			changeMap.put("id", id);
			changeMap.put("pwd", randomPwd);
			memberService.changeRandomPwd(changeMap);
			mail.sendMail(vo, type);
			res = "success";
		}else{
			res = "fail";
		}
		return res;
	}
	
}	
	
