package com.sist.library.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("ListDAO")
public class ListDAO extends AbstractDAO{

	public List<ListVO> boardList() {
		return selectList("list.boardlist");
		
	}

	public ListVO getlostcontent(int content_no) {
		return (ListVO) selectOne("list.getlostcontent", content_no);
	}

	

}
