package com.sist.library.service;

import java.util.List;
import java.util.Map;


import com.sist.library.dao.lostBoardVO;

public interface lostBoardService {

	public List<lostBoardVO> boardList(Map map) throws Exception;

	public lostBoardVO getlostcontent(int content_no);
	
	public void insertList(lostBoardVO vo) throws Exception;
	
	public lostBoardVO getlostupdate(int update_no);
	
	public void getlostupdate_ok(lostBoardVO vo) throws Exception;
	
	public void getlostdelete(int lb_no) throws Exception;
	
	public void getlosthit(int lb_no);
	
	public int getlosttotalRow();
	
	public int getlostpageCount();
	
	public int divisionlostBoard(Map map);
	
	public List<lostBoardVO> boardSearch (Map map);
	
}
