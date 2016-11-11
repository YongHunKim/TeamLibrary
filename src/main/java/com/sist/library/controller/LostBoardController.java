package com.sist.library.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.ListVO;
import com.sist.library.service.ListService;

@Controller
public class LostBoardController {
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
	
	@RequestMapping(value="/list/insert.do")
    public ModelAndView insert(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	
    	mv.addObject("jsp", "/WEB-INF/jsp/list/insert.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/list/insert_ok.do")
    public ModelAndView lostboard_insert_ok(ListVO vo) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	
    	System.out.println(vo.getLb_subject());
    	listservice.insertList(vo);
    	
    	
    	mv.addObject("jsp", "/WEB-INF/jsp/list/insert_ok.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/list/delete.do")
    public ModelAndView lostboard_delete(int lb_no) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	listservice.getlostdelete(lb_no);
    	mv.addObject("jsp", "/WEB-INF/jsp/list/delete_ok.jsp");
    	
    	return mv;
    }

	@RequestMapping(value="/list/content.do")
    public ModelAndView content(@RequestParam(value="lb_no")String lb_no) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	int content_no = Integer.parseInt(lb_no);
    	ListVO vo = listservice.getlostcontent(content_no);    	
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/list/content.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/list/update.do")
    public ModelAndView lostboard_update(@RequestParam(value="lb_no")String lb_no) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	int Update_no = Integer.parseInt(lb_no);
    	ListVO vo = listservice.getlostupdate(Update_no); 	
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/list/update.jsp");
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/list/update_ok.do")
    public ModelAndView getlostupdate_ok(ListVO vo) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	System.out.println(vo.getLb_no());
    	System.out.println(vo.getLb_subject());
    	System.out.println(vo.getLb_content());
    	listservice.getlostupdate_ok(vo);
    	System.out.println(vo.getLb_subject());
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/list/update_ok.jsp");
    	
    	return mv;
    }
	
	
}