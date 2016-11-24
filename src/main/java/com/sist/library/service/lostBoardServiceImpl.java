package com.sist.library.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.lostBoardVO;

import com.sist.library.dao.lostBoardDAO;


@Service("lostservice")
public class lostBoardServiceImpl implements lostBoardService {
	
	@Resource(name="lostBoardDAO")
	private lostBoardDAO lostBoardDAO;

	@Override
	public List<lostBoardVO> boardList(Map map) throws Exception{
		return lostBoardDAO.boardList(map);
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
	public lostBoardVO getlostupdate(int update_no){
		return lostBoardDAO.getlostupdate(update_no);
	}

	@Override
	public void getlostupdate_ok(lostBoardVO vo) {
		
		lostBoardDAO.getlostupdate_ok(vo);
	}

	public void getlostdelete(int lb_no) throws Exception{
		lostBoardDAO.getlostdelete(lb_no);
	}
	
	@Override
	public void getlosthit(int lb_no) {
		lostBoardDAO.getlosthit(lb_no);
	}

	@Override
	public int getlosttotalRow() {
		
		return lostBoardDAO.getlosttotalRow();
	}

	@Override
	public int getlostpageCount() {
		
		return lostBoardDAO.getlostpageCount();
	}
	
	@Override
	public int divisionlostBoard(Map map){
		return lostBoardDAO.divisionlostBoard(map);
	}

	@Override
	public List<lostBoardVO> boardSearch(Map map){
		
		return lostBoardDAO.boardSearch(map);
	}

}
