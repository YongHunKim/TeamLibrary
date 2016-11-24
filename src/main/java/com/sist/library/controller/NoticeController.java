package com.sist.library.controller;

import java.io.File;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sist.library.dao.BookVO;
import com.sist.library.dao.NoticeDAO;
import com.sist.library.dao.NoticeVO;
import com.sist.library.service.NoticeService;
import com.sist.library.service.LoginService;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value = "/notice/list.do")
	public ModelAndView notice_list(String page, String fs, String sk, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");
		mav.addObject("type","list");
		mav.addObject("jsp", "/WEB-INF/jsp/notice/list.jsp");
/*		System.out.println("검사 : "+fs);
		System.out.println("검사 : "+sk);*/
		
		page = (page==null) ? "1" : page;
		int curpage = Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		int block=5;
		int frompage=((curpage-1)/block*block)+1;
		int topage=((curpage-1)/block*block)+block;
		map.put("start", start);
		map.put("end", end);
		
		int totalpage=0;
		int totalRow=0;				
		List<NoticeVO> list=null;
		List<NoticeVO> list2=noticeService.topNotice();
		
		if(sk==null){
			list = noticeService.getAllNotice(map);		
			totalpage = noticeService.pageCount();
			if(topage>totalpage){
				topage = totalpage;
			}
			totalRow = noticeService.totalRow();
		}else{
			/* 검색select , 검색Text*/
			map=new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("fs", fs);
			map.put("sk", sk);
			
			list= noticeService.search(map);
			
			Map map2=new HashMap();
			map2.put("fs", fs);
			map2.put("sk", sk);
			totalpage=noticeService.searchCount(map2);
			if(topage>totalpage){
				topage = totalpage;
			}
			totalRow = noticeService.searchtotalRow(map2);
		}		
		
		mav.addObject("list2", list2);
		mav.addObject("totalRow", totalRow);
		mav.addObject("block",block);
		mav.addObject("topage",topage);
		mav.addObject("frompage", frompage);
		mav.addObject("totalpage",totalpage);
		mav.addObject("curpage",curpage);
		mav.addObject("list", list);
		mav.addObject("fs",fs);
		mav.addObject("sk",sk);
		mav.addObject("jsp", "/WEB-INF/jsp/notice/list.jsp");
		
		return mav;		
	}
	

	@RequestMapping(value = "/notice/insert.do")
	public ModelAndView notice_insert(NoticeVO vo) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");				
		mav.addObject("jsp", "/WEB-INF/jsp/notice/insert.jsp");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/notice/insert_ok.do")
	public ModelAndView notice_insert_ok(NoticeVO vo) throws Exception{
		//List<NoticeVO> list= noticeService.getAllNotice();
		ModelAndView mav=new ModelAndView("main/main");
		noticeService.insertNotice(vo);
		mav.addObject("jsp", "/WEB-INF/jsp/notice/insert_ok.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/notice/content.do")
	public ModelAndView notice_content(@RequestParam(value="nt_no") String nt_no) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");	
		NoticeVO vo = noticeService.getNoticecontent(Integer.parseInt(nt_no));
		int content_no=Integer.parseInt(nt_no);
		noticeService.update_hit(content_no);	
		mav.addObject("vo", vo);
		mav.addObject("jsp", "/WEB-INF/jsp/notice/content.jsp");
		
		return mav;
	}
	
	@RequestMapping(value = "/notice/delete.do")
	public ModelAndView notice_delete(int nt_no) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");
		noticeService.getNoticedelete(nt_no);
		mav.addObject("jsp", "/WEB-INF/jsp/notice/delete.jsp");
		

		return mav;
	}
	
	@RequestMapping(value = "/notice/update.do")
	public ModelAndView notice_update(@RequestParam(value="nt_no") String nt_no)throws Exception{
		ModelAndView mav=new ModelAndView("main/main");
		NoticeVO vo = noticeService.updateNotice(Integer.parseInt(nt_no));
		mav.addObject("vo",vo);
		mav.addObject("jsp", "/WEB-INF/jsp/notice/update.jsp");
		
		
		return mav;
	}
	
	
	@RequestMapping(value = "/notice/update_ok.do")
	public ModelAndView notice_update_ok(NoticeVO vo)throws Exception{
		ModelAndView mav=new ModelAndView("main/main");
		noticeService.update_ok_Notice(vo);
		System.out.println(vo.getNt_subject());
		mav.addObject("vo",vo);
		mav.addObject("jsp", "/WEB-INF/jsp/notice/update_ok.jsp");
		
		return mav;
	}
	
}