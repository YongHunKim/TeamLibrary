package com.sist.library.service;

import com.sist.library.dao.BookVO;

public interface AdminService {
	public void book_plus(BookVO vo) throws Exception;

	public void book_delete(long book_code) throws Exception;
	
	public BookVO book_update(long book_code) throws Exception;
	
	public void book_update_ok(BookVO vo) throws Exception;
	
}
