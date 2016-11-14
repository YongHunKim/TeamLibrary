package com.sist.library.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	public MemberVO member_update(String id) throws Exception{
		return mypageDAO.member_update(id);
	}

	@Override
	public void member_update_ok(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		mypageDAO.member_update_ok(vo);
	}

}
