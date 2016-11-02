package com.sist.library.service;

import javax.annotation.Resource;

import com.sist.library.dao.MemberDAO;

// 다시 한번 더 보자
public class PcheckServiceImpl implements PcheckService {

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int pcheck_pwd(String pwd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int pcheck_ok(String pwd) {
		// TODO Auto-generated method stub
		return 0;
	}

}
