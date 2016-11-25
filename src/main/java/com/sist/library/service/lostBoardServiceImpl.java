package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.lostBoardVO;
import com.sist.library.dao.lostBoardDAO;

@Service("lostservice")
public class lostBoardServiceImpl implements lostBoardService {

	@Resource(name = "lostBoardDAO")
	private lostBoardDAO lostBoardDAO;

	@Override
	public List<lostBoardVO> boardList() throws Exception {
		return lostBoardDAO.boardList();
	}

	@Override
	public lostBoardVO getlostcontent(int content_no) {
		return lostBoardDAO.getlostcontent(content_no);
	}

	@Override
	public void insertList(lostBoardVO vo) throws Exception {
		lostBoardDAO.insertList(vo);
	}

	@Override
	public lostBoardVO getlostupdate(int update_no) {
		return lostBoardDAO.getlostupdate(update_no);
	}

	@Override
	public void getlostupdate_ok(lostBoardVO vo) {

		lostBoardDAO.getlostupdate_ok(vo);
	}

	public void getlostdelete(int lb_no) throws Exception {
		lostBoardDAO.getlostdelete(lb_no);
	}

}
