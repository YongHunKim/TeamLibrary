package com.sist.library.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.lostBoardVO;
import com.sist.library.service.lostBoardService;

@Controller
public class LostBoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="lostservice")
	private lostBoardService lostservice;
	
	@RequestMapping(value="/lostBoard/list.do")
    public ModelAndView board_form() throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    
    	List<lostBoardVO> list = lostservice.boardList();
    	mv.addObject("list", list);
    	
    	
    	
    	//log.debug("인터셉터 테스트");
    	mv.addObject("jsp", "/WEB-INF/jsp/lostBoard/list.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/lostBoard/insert.do")
    public ModelAndView insert(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	
    	mv.addObject("jsp", "/WEB-INF/jsp/lostBoard/insert.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/lostBoard/insert_ok.do")
    public ModelAndView lostboard_insert_ok(lostBoardVO vo) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	
    	System.out.println(vo.getLb_subject());
    	lostservice.insertList(vo);
    	
    	
    	mv.addObject("jsp", "/WEB-INF/jsp/lostBoard/insert_ok.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/lostBoard/delete.do")
    public ModelAndView lostboard_delete(int lb_no) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	lostservice.getlostdelete(lb_no);
    	mv.addObject("jsp", "/WEB-INF/jsp/lostBoard/delete_ok.jsp");
    	
    	return mv;
    }

	@RequestMapping(value="/lostBoard/content.do")
    public ModelAndView content(@RequestParam(value="lb_no")String lb_no) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	int content_no = Integer.parseInt(lb_no);
    	lostBoardVO vo = lostservice.getlostcontent(content_no);    	
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/lostBoard/content.jsp");
    	
    	return mv;
    }
	
	@RequestMapping(value="/lostBoard/update.do")
    public ModelAndView lostboard_update(@RequestParam(value="lb_no")String lb_no) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	int Update_no = Integer.parseInt(lb_no);
    	lostBoardVO vo = lostservice.getlostupdate(Update_no); 	
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/lostBoard/update.jsp");
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/lostBoard/update_ok.do")
    public ModelAndView getlostupdate_ok(lostBoardVO vo) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	System.out.println(vo.getLb_no());
    	System.out.println(vo.getLb_subject());
    	System.out.println(vo.getLb_content());
    	lostservice.getlostupdate_ok(vo);
    	System.out.println(vo.getLb_subject());
    	mv.addObject("vo", vo);
    	mv.addObject("jsp", "/WEB-INF/jsp/lostBoard/update_ok.jsp");
    	
    	return mv;
    }
	
	
}