package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookRecommendVO;
import com.sist.library.dao.BookVO;
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
		// TODO Auto-generated method stub
		return mypageDAO.member_update_ok(vo);
	}

	@Override
	public List<BookRecommendVO> rec_select(int page, String id) {
		// TODO Auto-generated method stub
		return mypageDAO.rec_select(page, id);
	}

	@Override
	public int recPage(String id) {
		// TODO Auto-generated method stub
		return mypageDAO.recPage(id);
	}

	@Override
	public int recRow(String id) {
		// TODO Auto-generated method stub
		return mypageDAO.recRow(id);
	}

	@Override
	public int member_secession(String id, String pwd) {
		// TODO Auto-generated method stub
		return mypageDAO.member_secession(id,pwd);
	}

	@Override
	public List wishlist(String id){
		return mypageDAO.wishlist(id);
	}
	
/*	@Override
	public List<BookVO> wishlist(int page, String id) {
		// TODO Auto-generated method stub
		return mypageDAO.wishlist(page, id);
	}

	@Override
	public int wishPage(String id) {
		// TODO Auto-generated method stub
		return mypageDAO.wishPage(id);
	}

	@Override
	public int wishRow(String id) {
		// TODO Auto-generated method stub
		return mypageDAO.wishRow(id);
	}*/

}
