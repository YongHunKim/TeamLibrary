package com.sist.library.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO{
			
	// 다시 한번 더 보자.
	public int pcheck_ok(String id, String pwd){
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		return (int)selectOne("mypage.pcheck_ok", map);
	}
	
	public MemberVO member_update(String id) throws Exception{
		return (MemberVO) selectOne("mypage.member_update", id);
	}
	
	public void member_update_ok(MemberVO vo) throws Exception{
		selectOne("mypage.member_update_ok", vo);
	}
}
