package com.sist.library.service;

import java.util.List;

import com.sist.library.dao.BookManagerVO;

public interface RentalService {
	public List<BookManagerVO> rental_history(String id);
	
	public List<BookManagerVO> reservation_history(String id);
	
}
