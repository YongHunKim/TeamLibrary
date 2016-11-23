package com.sist.library.service;

import java.util.List;

import com.sist.library.dao.BookRecommendVO;
import com.sist.library.dao.BookVO;
import com.sist.library.dao.MemberVO;
import com.sist.library.dao.WishListVO;

public interface PcheckService {
		
	public int pcheck_ok(String id, String pwd);
	
	public MemberVO member_update(String id, String pwd) throws Exception;
	
	public int member_update_ok(MemberVO vo);
	
	public List<BookRecommendVO> rec_select(int page, String id);
	
	// 페이징 처리
	
	public int recPage(String id);
	
	public int recRow(String id);
	
	public int member_secession(String id, String pwd);
	
	public List<WishListVO> wishlist(int page, String id);
		
	public int wishPage(String id);
	
	public int wishRow(String id);
}
