package com.sist.library.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookManagerVO;
import com.sist.library.dao.MemberVO;
import com.sist.library.dao.MyPageDAO;


// 다시 한번 더 보자
@Service("mypageService")
public class PcheckServiceImpl implements PcheckService {

	@Resource(name="mypageDAO")
	private MyPageDAO mypageDAO;
	
	
	@Override
	public int pcheck_ok(String id, String pwd) {
		return mypageDAO.pcheck_ok(id, pwd);
	}

	@Override
	public MemberVO member_update(String id, String pwd) throws Exception{
		return mypageDAO.member_update(id, pwd);
	}

	@Override
	public int member_update_ok(MemberVO vo){
		return mypageDAO.member_update_ok(vo);
	}

	@Override
	public List<BookManagerVO> getRentList(Map map) {
		return mypageDAO.getRentList(map);
	}

	@Override
	public int rentPageCount(String id) {
		return mypageDAO.rentPageCount(id);
	}

	@Override
	public int rentTotalRow(String id) {
		return mypageDAO.rentTotalRow(id);
	}

	@Override
	public int rentReturn(String book_code) {
		return mypageDAO.rentReturn(book_code);
	}

	@Override
	public List<BookManagerVO> getReserveList(Map map) {
		return mypageDAO.getReserveList(map);
	}

	@Override
	public int reservePageCount(String id) {
		return mypageDAO.reservePageCount(id);
	}

	@Override
	public int reserveTotalRow(String id) {
		return mypageDAO.reserveTotalRow(id);
	}

	@Override
	public int reserveCancel(String book_code) {
		return mypageDAO.reserveCancel(book_code);
	}

	@Override
	public int rentDelay(Map map) {
		return mypageDAO.rentDelay(map);
	}

}
