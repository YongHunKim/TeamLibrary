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
import com.sist.library.dao.lostBoardDAO;
import com.sist.library.dao.lostBoardVO;
import com.sist.library.service.lostBoardService;
import com.sist.library.service.lostBoardServiceImpl;

@Controller
public class LostBoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="lostservice")
	private lostBoardService lostservice;
	
	@RequestMapping(value="/lostBoard/list.do")
    public ModelAndView lostboard_list(String page) throws Exception{
    	  ModelAndView mav = new ModelAndView("main/main");
  
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
    	  List<lostBoardVO> list = lostservice.boardList(map);
    	  
    	  int totalPage = lostservice.getlostpageCount();
    	  if(topage>totalPage){
    	   topage = totalPage;
    	  }
    	  int totalRow = lostservice.getlosttotalRow();

    	  mav.addObject("totalRow", totalRow);
    	  mav.addObject("block",block);
    	  mav.addObject("topage",topage);
    	  mav.addObject("frompage", frompage);
    	  mav.addObject("totalPage",totalPage);
    	  mav.addObject("curPage",curpage);
    	  mav.addObject("list", list);
    	  mav.addObject("jsp", "/WEB-INF/jsp/lostBoard/list.jsp");
    	  
   
		return mav;
    	
    	
    }

	@RequestMapping(value="/lostBoard/insert.do")
    public ModelAndView listboard_insert(Map<String,Object> commandMap) throws Exception{
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
    public ModelAndView lostboard_content(@RequestParam(value="lb_no")String lb_no, lostBoardVO vo) throws Exception{
    	ModelAndView mv = new ModelAndView("main/main");
    	//log.debug("인터셉터 테스트");
    	int content_no = Integer.parseInt(lb_no);
    	lostservice.getlosthit(Integer.parseInt(lb_no));
    	vo = lostservice.getlostcontent(content_no); 
    	int hit_no = Integer.parseInt(lb_no);
    	
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
    public ModelAndView lostboardupdate_ok(lostBoardVO vo) throws Exception{
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
	@RequestMapping(value="/lostboard/search.do")
    public ModelAndView boardSearch(@RequestParam(required=false) String page,@RequestParam(required=false)Integer nowBlock,
            @RequestParam(required=false) String keyField, @RequestParam(required=false) String keyWord) throws Exception
    {
		ModelAndView mav = new ModelAndView("main/main");
		  
   	  	page = (page==null) ? "1" : page;
   	  	int curpage = Integer.parseInt(page);
   	  	Map map=new HashMap();
   	  	int rowSize=10;
   	  	int start=(curpage*rowSize)-(rowSize-1);
   	  	int end=curpage*rowSize;
   	  	int block=5;
   	  	int frompage=((curpage-1)/block*block)+1;
   	  	int topage=((curpage-1)/block*block)+block;
   	  	map.put("keyField", keyField);
   	  	map.put("keyWord", keyWord);
   	  	map.put("start", start);
   	  	map.put("end", end);
        List<lostBoardVO> list = lostservice.boardSearch(map);
        System.out.println(list.size());
        
        mav.addObject("block",block);
        mav.addObject("topage",topage);
        mav.addObject("frompage", frompage);
        mav.addObject("curPage",curpage);
        mav.addObject("list", list);
        mav.addObject("jsp", "/WEB-INF/jsp/lostBoard/list.jsp");
        
        return mav;
    }
	
}