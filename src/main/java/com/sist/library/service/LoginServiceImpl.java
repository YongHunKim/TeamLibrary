package com.sist.library.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.MemberDAO;
import com.sist.library.dao.MemberVO;

@Service("memberService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberVO vo) throws Exception{
		memberDAO.insertMember(vo);
	}

	@Override
	public int check_id(String id) {
		return memberDAO.check_id(id);
	}

	@Override
	public int login_ok(String id, String pwd) {
		return memberDAO.login_ok(id,pwd);
	}

}
