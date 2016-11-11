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

	public void insertList (ListVO vo){
		insert("list.insertList", vo);
	}
	
	public ListVO getlostupdate(int update_no){
		return (ListVO) selectOne("list.getlostupdate", update_no);
	}
	
	public void getlostupdate_ok(ListVO vo){
		update("list.getlostupdate_ok", vo);
		
	}
	
	public void getlostdelete (int lb_no){
		insert("list.getlostdelete", lb_no);
	}

}
