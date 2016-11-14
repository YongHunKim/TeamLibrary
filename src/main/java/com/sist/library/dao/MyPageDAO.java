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
		Map map = new HashMap<>();
		map.put("id", vo.getId());
		map.put("pwd", vo.getPwd());
		map.put("tel", vo.getTel());
		map.put("post", vo.getPost());
		map.put("addr1", vo.getAddr1());
		map.put("addr2", vo.getAddr2());
		map.put("email", vo.getEmail());
		selectOne("mypage.member_update_ok", map);
	}
}
