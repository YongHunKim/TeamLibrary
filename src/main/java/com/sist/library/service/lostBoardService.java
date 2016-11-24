package com.sist.library.service;

import java.util.List;

import com.sist.library.dao.lostBoardVO;

public interface lostBoardService {

	public List<lostBoardVO> boardList() throws Exception;

	public lostBoardVO getlostcontent(int content_no);

	public void insertList(lostBoardVO vo) throws Exception;

	public lostBoardVO getlostupdate(int update_no);

	public void getlostupdate_ok(lostBoardVO vo) throws Exception;

	public void getlostdelete(int lb_no) throws Exception;

}
