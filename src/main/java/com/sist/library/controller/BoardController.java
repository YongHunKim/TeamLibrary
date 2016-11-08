package com.sist.library.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.ListVO;
import com.sist.library.service.ListService;

public class BoardController {

	@Resource(name="listService")
	private ListService listService;
	
	@RequestMapping(value="/list/list.do")
    public ModelAndView board_form() throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	
    	List<ListVO> list = listService.boardList();
    	mv.addObject("list", list);

    	
    	//log.debug("인터셉터 테스트");
    	mv.addObject("jsp", "/WEB-INF/jsp/list/list.jsp");
    	
    	return mv;
    }
	/*
	@RequestMapping(value="/list/insert.do")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	mv.addObject("jsp", "/WEB-INF/jsp/list/insert.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/list/delete.do")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	mv.addObject("jsp", "/WEB-INF/jsp/list/delete.jsp");
    	
    	return mv;
    }
	
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
	*/
	
}
