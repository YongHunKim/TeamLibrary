package com.sist.library.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.service.PcheckService;

@Controller
public class MyPageController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "pcheckService")
	private PcheckService pcheckService;
	
	@RequestMapping(value="/mypage/mypage.do")
    public ModelAndView mypage(){
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	mv.addObject("jsp", "/WEB-INF/jsp/mypage/mypage.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/mypage/member_pcheck.do")
	public ModelAndView member_pcheck(){
		ModelAndView mv = new ModelAndView("main/main");
		
		mv.addObject("jsp", "/WEB-INF/jsp/mypage/member_pcheck.jsp");
		
		return mv;
	}

/*	@RequestMapping(value="/mypage/member_pcheck_ok.do")
	public @ResponseBody String pcheck_ok(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		int result = pcheckService.pcheck_ok(pwd);
		if(result > 0){
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("pwd", pwd);
			sb.append("<script type='text/javascript'>");
			sb.append("location.href = 'mypage/member_update.do';");
			sb.append("</script>");
		}else{
			sb.append("<script type='text/javascript'>");
			sb.append("alert('보안암호를 확인하세요.');");
			sb.append("</script>");
		}
		
		return sb.toString();
	}*/
}
