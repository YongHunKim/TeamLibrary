package com.sist.library.service;

import java.util.*;

import com.sist.library.dao.BookManagerVO;
import java.util.List;
import com.sist.library.dao.BookRecommendVO;
import com.sist.library.dao.BookVO;
import com.sist.library.dao.MemberVO;
import com.sist.library.dao.WishListVO;

public interface PcheckService {

	public int pcheck_ok(String id, String pwd);

	public MemberVO member_update(String id, String pwd) throws Exception;

	public int member_update_ok(MemberVO vo);

	public List<BookManagerVO> getRentList(Map map);

	public int rentPageCount(String id);

	public int rentTotalRow(String id);

	public int rentReturn(String book_code);

	public List<BookManagerVO> getReserveList(Map map);

	public int reservePageCount(String id);

	public int reserveTotalRow(String id);

	public int reserveCancel(String book_code);

	public int rentDelay(Map map);

	public List<BookRecommendVO> rec_select(int page, String id);

	// 페이징 처리

	public int recPage(String id);

	public int recRow(String id);

	public int member_secession(String id, String pwd);

	public List<WishListVO> wishlist(int page, String id);

	public int wishPage(String id);

	public int wishRow(String id);
}
