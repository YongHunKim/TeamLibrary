package com.sist.library.service;

import java.util.List;
import java.util.Map;

import com.sist.library.dao.BookVO;
import com.sist.library.dao.WishBookVO;

public interface AdminService {
	public void book_plus(BookVO vo) throws Exception;

	public void book_delete(long book_code) throws Exception;
	
	public BookVO book_update(long book_code) throws Exception;
	
	public void book_update_ok(BookVO vo) throws Exception;
	
	public int wishTotalPage();
	
	public int wishTotalRow();
	
	public List<WishBookVO> wishBookList(Map map);
	
}
