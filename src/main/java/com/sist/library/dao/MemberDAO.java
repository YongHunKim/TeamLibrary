package com.sist.library.dao;

import org.springframework.stereotype.Repository;
import java.util.*;


@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{

	public int insertMember(MemberVO vo) {
		return (int) insert("member.insertMember", vo);
	}

	public int check_id(String id) {
		return (int) selectOne("member.check_id", id);
	}

	public int login_ok(String id, String pwd) {
		Map map = new HashMap<>();		
		map.put("id", id);
		map.put("pwd", pwd);	
		return (int) selectOne("member.login_ok",map);
	}

	public int findId(Map map) {
		return (int) selectOne("member.findId",map);
	}

	public MailVO findmail(Map map) {
		return (MailVO) selectOne("member.findmail", map);
	}

	public int findPwd(Map map) {
		return (int) selectOne("member.findPwd",map);
	}

	public MailVO findPwdMail(Map map) {
		return (MailVO) selectOne("member.findPwdMail",map);
	}

	public void changeRandomPwd(Map map) {
		update("member.changeRandomPwd", map);
	}
}
