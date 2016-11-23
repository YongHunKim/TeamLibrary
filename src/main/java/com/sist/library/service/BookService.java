package com.sist.library.service;

import java.util.List;

import com.sist.library.dao.BookRecommendVO;
import com.sist.library.dao.BookVO;
import com.sist.library.dao.MailVO;
import com.sist.library.dao.ReserveVO;
import com.sist.library.dao.WishListVO;

public interface BookService {

	BookVO bookInfo(String book_code);

	int bookRent(String book_code, String id);

	int getBookManagementCode(String book_code, String id);

	MailVO mailInfo(int book_management_code, String id);

	ReserveVO getReserveInfo(String book_code);

	int bookReserve(String book_code, String id);

	int bookRentyn(String book_code);

	int bookReserveyn(String book_code);

	int insertRec(BookRecommendVO vo);

	List<BookRecommendVO> bookRecommed(String book_code);

	int bookRecommedCount(String book_code);

	int bookRecommendModify(BookRecommendVO vo);

	int bookRecommendDelete(String book_code, String book_recommend_code);
	
	int wishInsert(WishListVO vo);

	int wishCheck(String id, String book_code);
}
