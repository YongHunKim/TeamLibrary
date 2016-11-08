package com.sist.library.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.MyPageDAO;


// 다시 한번 더 보자
@Service("mypageService")
public class PcheckServiceImpl implements PcheckService {

	@Resource(name="mypageDAO")
	private MyPageDAO mypageDAO;
	
	@Override
	public int pcheck_pwd(String pwd) {
		// TODO Auto-generated method stub
		return mypageDAO.pcheck_pwd(pwd);
	}

	@Override
	public int pcheck_ok(String id, String pwd) {
		// TODO Auto-generated method stub
		return mypageDAO.pcheck_ok(id, pwd);
	}

	@Override
	public int select_member(String id) {
		// TODO Auto-generated method stub
		return mypageDAO.select_member(id);
	}

}
