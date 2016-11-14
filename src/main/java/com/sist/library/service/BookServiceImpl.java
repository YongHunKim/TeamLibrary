package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookDAO;
import com.sist.library.dao.BookRecommendVO;
import com.sist.library.dao.BookVO;
import com.sist.library.dao.MailVO;
import com.sist.library.dao.ReserveVO;

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


	@Override
	public int getBookManagementCode(String book_code, String id) {
		return bookDAO.getBookManagementCode(book_code,id);
	}


	@Override
	public MailVO mailInfo(int book_management_code, String id) {
		return bookDAO.getMailInfo(book_management_code,id);
	}


	@Override
	public ReserveVO getReserveInfo(String book_code) {
		return bookDAO.getReserveInfo(book_code);
	}


	@Override
	public int bookReserve(String book_code, String id) {
		return bookDAO.bookReserve(book_code,id);
	}


	@Override
	public int bookRentyn(String book_code) {
		return bookDAO.bookRentyn(book_code);
	}


	@Override
	public int bookReserveyn(String book_code) {
		return bookDAO.bookReserveyn(book_code);
	}


	@Override
	public int insertRec(BookRecommendVO vo) {
		return bookDAO.insertRec(vo);
	}


	@Override
	public List<BookRecommendVO> bookRecommed(String book_code) {
		return bookDAO.bookRecommed(book_code);
	}


	@Override
	public int bookRecommedCount(String book_code) {
		return bookDAO.bookRecommedCount(book_code);
	}


	@Override
	public int bookRecommendModify(BookRecommendVO vo) {
		return bookDAO.bookRecommendModify(vo);
	}


	@Override
	public int bookRecommendDelete(String book_code, String book_recommend_code) {
		return bookDAO.bookRecommendDelete(book_code,book_recommend_code);
	}

}
