package com.sist.library.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.MailVO;
import com.sist.library.dao.MemberDAO;
import com.sist.library.dao.MemberVO;

@Service("memberService")
public class LoginServiceImpl implements LoginService {
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int insertMember(MemberVO vo) throws Exception{
		return memberDAO.insertMember(vo);
	}

	@Override
	public int check_id(String id) {
		return memberDAO.check_id(id);
	}

	@Override
	public int login_ok(String id, String pwd) {
		return memberDAO.login_ok(id,pwd);
	}

	@Override
	public int findId(Map map) {
		return memberDAO.findId(map);
	}

	@Override
	public MailVO findmail(Map map) {
		return memberDAO.findmail(map);
	}

	@Override
	public int findPwd(Map map) {
		return memberDAO.findPwd(map);
	}

	@Override
	public MailVO findPwdMail(Map map) {
		return memberDAO.findPwdMail(map);
	}

	@Override
	public void changeRandomPwd(Map map) {
		memberDAO.changeRandomPwd(map);
	}

}
