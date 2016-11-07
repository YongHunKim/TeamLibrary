package com.sist.library.service;

import com.sist.library.dao.BookVO;

public interface BookService {

	BookVO bookInfo(String book_code);

	int bookRent(String book_code, String id);

}
