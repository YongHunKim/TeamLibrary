package com.sist.library.dao;

import java.util.HashMap;
import java.util.List;
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
	
	public MemberVO member_update(String id, String pwd) throws Exception{
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		return (MemberVO) selectOne("mypage.member_update", map);
	}
	
	public int member_update_ok(MemberVO vo){		
		return (int) update("mypage.member_update_ok", vo);
	}

	public int rentPageCount(String id) {
		return (int) selectOne("rental.rentPageCount", id);
	}

	public int rentTotalRow(String id) {
		return (int) selectOne("rental.rentTotalRow",id);
	}

	public List<BookManagerVO> getRentList(Map map) {
		return selectList("rental.getRentList",map);
	}

}
