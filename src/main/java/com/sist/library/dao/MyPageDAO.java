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

	public List<BookRecommendVO> rec_select(int curPage, String id){
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (curPage * pageRow) - (pageRow - 1);
		int end = start + (pageRow - 1);
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		return selectList("mypage.rec_select", map);
	}
	
	public int recPage(String id){
		return (int) selectOne("mypage.recPage", id);
	}
	
	public int recRow(String id){
		return (int) selectOne("mypage.recRow", id);
	}
	
	public int member_secession(String id, String pwd){
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		return (int) delete("mypage.member_secession", map);
	}
	
	public List<WishListVO> wishlist(int curPage, String id){
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (curPage * pageRow) - (pageRow - 1);
		int end = start + (pageRow - 1);
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		return selectList("mypage.wishlist", map);
	}
	
	
/*	public List wishlist(int curPage, String id){
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (curPage * pageRow) - (pageRow - 1);
		int end = start + (pageRow - 1);
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		System.out.println(map);
		return selectList("mypage.wishlist", map);
	}*/
	
	public int wishPage(String id){
		return (int) selectOne("mypage.wishPage", id);
	}
	
	public int wishRow(String id){
		return (int) selectOne("mypage.wishRow", id);
	}
}
