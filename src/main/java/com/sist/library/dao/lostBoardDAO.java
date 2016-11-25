package com.sist.library.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("lostBoardDAO")
public class lostBoardDAO extends AbstractDAO {

	public List<lostBoardVO> boardList() {
		return selectList("list.boardlist");
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

}
