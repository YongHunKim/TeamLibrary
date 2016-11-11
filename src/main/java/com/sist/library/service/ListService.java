package com.sist.library.service;

import java.util.List;

import com.sist.library.dao.ListVO;

public interface ListService {

	public List<ListVO> boardList() throws Exception;

	public ListVO getlostcontent(int content_no);
	
	public void insertList(ListVO vo) throws Exception;
	
	public ListVO getlostupdate(int update_no);
	
	public void getlostupdate_ok(ListVO vo) throws Exception;
	
	public void getlostdelete(int lb_no) throws Exception;
	
	
}
