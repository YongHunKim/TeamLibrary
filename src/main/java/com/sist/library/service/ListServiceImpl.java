package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.ListVO;
import com.sist.library.dao.ListDAO;


@Service("listservice")
public class ListServiceImpl implements ListService {
	
	@Resource(name="ListDAO")
	private ListDAO ListDAO;

	@Override
	public List<ListVO> boardList() throws Exception{
		return ListDAO.boardList();
	}

	@Override
	public ListVO getlostcontent(int content_no) {
		return ListDAO.getlostcontent(content_no);
	}

	


}
