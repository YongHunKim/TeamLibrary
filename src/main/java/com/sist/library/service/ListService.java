package com.sist.library.service;

import java.util.List;

import com.sist.library.dao.ListVO;

public interface ListService {

	public List<ListVO> boardList() throws Exception;

	public ListVO getlostcontent(int content_no);

	
}
