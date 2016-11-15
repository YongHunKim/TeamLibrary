package com.sist.library.service;

import com.sist.library.dao.MemberVO;

public interface PcheckService {
		
	public int pcheck_ok(String id, String pwd);
	
	public MemberVO member_update(String id, String pwd) throws Exception;
	
	public int member_update_ok(MemberVO vo);
}
