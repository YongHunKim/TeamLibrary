package com.sist.library.dao;

import org.springframework.stereotype.Repository;
import java.util.*;


@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{

	public void insertMember(MemberVO vo) {
		insert("member.insertMember", vo);
	}

	public int check_id(String id) {
		return (int) selectOne("member.check_id", id);
	}

	public int login_ok(String id, String pwd) {
		Map map = new HashMap<>();
		System.out.println(id);
		System.out.println(pwd);
		map.put("id", id);
		map.put("pwd", pwd);	
		return (int) selectOne("member.login_ok",map);
	}

/*	// 다시 한번 더 보자
	public int pcheck_pwd(String pwd){
		return (int) selectOne("member.pcheck_pwd", pwd);
	}
	
	// 다시 한번 더 보자.
	public int pcheck_ok(String pwd){
		return (int)selectOne("member.pcheck_ok", pwd);
	}*/
}
