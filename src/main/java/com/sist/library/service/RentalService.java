package com.sist.library.service;

import java.util.List;

import com.sist.library.dao.BookManagerVO;

public interface RentalService {
	public List<BookManagerVO> rental_history(int page, String id);

	public int rentalPage(String id);
	
	public int rentalRow(String id);
	
	public List<BookManagerVO> reservation_history(int page, String id);
	
	public int reservePage(String id);
	
	public int reserveRow(String id);
	
}
