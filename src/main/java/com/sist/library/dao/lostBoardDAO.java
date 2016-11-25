package com.sist.library.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("lostBoardDAO")
public class lostBoardDAO extends AbstractDAO {

	public List<lostBoardVO> boardList(Map map) {
		return selectList("list.boardlist",map);
		
	}

	public lostBoardVO getlostcontent(int content_no) {
		return (lostBoardVO) selectOne("list.getlostcontent", content_no);
	}

	public void insertList(lostBoardVO vo) {
		insert("list.insertList", vo);
	}

	public lostBoardVO getlostupdate(int update_no) {
		return (lostBoardVO) selectOne("list.getlostupdate", update_no);
	}

	public void getlostupdate_ok(lostBoardVO vo) {
		update("list.getlostupdate_ok", vo);

	}

	public void getlostdelete(int lb_no) {
		insert("list.getlostdelete", lb_no);
	}
	
	public void getlosthit(int lb_no) {
		update("list.getlosthit", lb_no);
	}
	
	public int getlosttotalRow(){
		return (int) selectOne("list.getlosttotalRow");
	}
	public int getlostpageCount(){
		return (int) selectOne("list.getlostpageCount");
	}
	
	public int divisionlostBoard(Map map){
		return (int) selectOne("list.divisionlostBoard", map);
	}

	public List<lostBoardVO> boardSearch(Map map) {
		System.out.println(map.get("keyField"));
		System.out.println(map.get("keyWord"));
		System.out.println(map.get("start"));
		System.out.println(map.get("end"));
		return selectList("list.boardSearch", map);
	}


}
