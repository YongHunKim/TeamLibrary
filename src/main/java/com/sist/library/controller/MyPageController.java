package com.sist.library.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookManagerVO;
import com.sist.library.service.PcheckService;

@Controller
public class MyPageController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "mypageService")
	private PcheckService mypageService;
	
	@RequestMapping(value="/mypage/mypage.do")
    public ModelAndView mypage(){
    	ModelAndView mv = new ModelAndView("main/main");
    
    	mv.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
    	mv.addObject("submenu", "/WEB-INF/jsp/mypage/mypage_submenu.jsp");
    	mv.addObject("subpage", "/WEB-INF/jsp/mypage/member_pcheck.jsp");
    	return mv;
    }
	
	@RequestMapping(value="/mypage/mypage_submenu.do")
	public ModelAndView mypage_submenu(){
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/mypage_submenu.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/mypage/member_update.do")
	public ModelAndView member_update(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("main/main");
		String id = request.getParameter("id");
		HttpSession session = request.getSession(true);
		session.setAttribute("id", id);
		
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/member_update.jsp");
	
		return mv;
	}
	
	@RequestMapping(value="/mypage/member_pcheck.do")
	public ModelAndView member_pcheck(){
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/member_pcheck.jsp");
		
		return mv;
	}

	
	@RequestMapping(value="/mypage/member_pcheck_ok.do")
	public @ResponseBody String pcheck_ok(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		String id = request.getParameter("id");
		String pwd = request.getParameter("check_pwd");
		int result = mypageService.pcheck_ok(pwd);
		if(result > 0){
			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
			sb.append("<script type='text/javascript'>");
			sb.append("location.href = '/mypage/member_update.do';");
			sb.append("</script>");
		}else{
			sb.append("<script type='text/javascript'>");
			sb.append("alert('보안암호를 확인하세요.');");
			sb.append("location.href = '/mypage/member_pcheck.do';");
			sb.append("</script>");
		}
		
		return sb.toString();
	}

}
