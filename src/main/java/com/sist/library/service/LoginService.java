package com.sist.library.service;

import com.sist.library.dao.MemberVO;

public interface LoginService {
	public int insertMember(MemberVO vo) throws Exception;

	public int check_id(String id);

	public int login_ok(String id, String pwd);
	
}
