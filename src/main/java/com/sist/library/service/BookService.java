package com.sist.library.service;

import com.sist.library.dao.BookVO;
import com.sist.library.dao.MailVO;
import com.sist.library.dao.ReserveVO;

public interface BookService {

	BookVO bookInfo(String book_code);

	int bookRent(String book_code, String id);

	int getBookManagementCode(String book_code, String id);

	MailVO mailInfo(int book_management_code, String id);

	ReserveVO getReserveInfo(String book_code);

	int bookReserve(String book_code, String id);

	int bookRentyn(String book_code);

	int bookReserveyn(String book_code);

}
