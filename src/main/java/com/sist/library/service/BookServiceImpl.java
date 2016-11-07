package com.sist.library.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookDAO;
import com.sist.library.dao.BookVO;

@Service("bookService")
public class BookServiceImpl implements BookService{
	
	@Resource(name="bookDAO")
	private BookDAO bookDAO;
	
	
	
	@Override
	public BookVO bookInfo(String book_code) {		
		return bookDAO.bookInfo(book_code);
	}


	@Override
	public int bookRent(String book_code, String id) {
		return bookDAO.bookRent(book_code,id);
	}

}
