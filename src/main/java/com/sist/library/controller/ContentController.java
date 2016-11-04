package com.sist.library.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.ListVO;
import com.sist.library.service.ListService;

@Controller
public class ContentController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="listservice")
	private ListService listservice;
	
	@RequestMapping(value="/list/content.do")
    public ModelAndView openSampleList(@RequestParam(value="lb_no")String lb_no) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	int content_no = Integer.parseInt(lb_no);
    	System.out.println(content_no);
    	ListVO vo = listservice.getlostcontent(content_no);    	
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/list/content.jsp");
    	
    	return mv;
    }
	

}
