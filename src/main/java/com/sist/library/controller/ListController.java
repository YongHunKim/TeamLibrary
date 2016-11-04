package com.sist.library.controller;


import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.ListVO;
import com.sist.library.service.ListService;

@Controller
public class ListController {
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="listservice")
	private ListService listservice;
	
	@RequestMapping(value="/list/list.do")
    public ModelAndView board_form() throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	
    	List<ListVO> list = listservice.boardList();
    	mv.addObject("list", list);

    	
    	//log.debug("인터셉터 테스트");
    	mv.addObject("jsp", "/WEB-INF/jsp/list/list.jsp");
    	
    	return mv;
    }
	

}