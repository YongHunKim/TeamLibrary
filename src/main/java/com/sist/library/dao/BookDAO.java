package com.sist.library.dao;

import java.util.*;

import org.springframework.stereotype.Repository;

@Repository("bookDAO")
public class BookDAO extends AbstractDAO {

	public List<BookVO> search(int page, String searchWord) {
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (page * pageRow) - (pageRow - 1);
		int end = start + (pageRow - 1);
		map.put("start", start);
		map.put("end", end);
		map.put("searchWord", searchWord);
		return selectList("search.search", map);
	}

	public int pageCount(String searchWord) {
		return (int) selectOne("search.pageCount", searchWord);
	}

	public int totalRow(String searchWord) {
		return (int) selectOne("search.totalRow", searchWord);
	}

	public List<BookVO> newbook(int curPage) {
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (curPage * pageRow) - (pageRow - 1);
		int end = start + (pageRow - 1);
		map.put("start", start);
		map.put("end", end);
		return selectList("search.newbook", map);
	}

	public int newBookCount() {
		return (int) selectOne("search.newBookCount");
	}

	public int newBookRow() {
		return (int) selectOne("search.newBookRow");
	}

	public List<BookVO> popularBook() {
		Map map = new HashMap<>();
		int start = 1;
		int end = 10;
		map.put("start", start);
		map.put("end", end);
		return selectList("search.popular", map);
	}

	public BookVO bookInfo(String book_code) {
		return (BookVO) selectOne("book.bookInfo", book_code);
	}

	public int bookRent(String book_code, String id) {
		Map map = new HashMap<>();
		map.put("book_code", book_code);
		map.put("id", id);
		return (int) insert("book.bookRent", map);
	}

	public int getBookManagementCode(String book_code, String id) {
		Map map = new HashMap<>();
		map.put("book_code", book_code);
		map.put("id", id);
		return (int) selectOne("book.getBookManagementCode", map);
	}

	public MailVO getMailInfo(int book_management_code, String id) {
		Map map = new HashMap<>();
		map.put("book_management_code", book_management_code);
		map.put("id", id);
		return (MailVO) selectOne("book.getMailInfo", map);
	}

	public ReserveVO getReserveInfo(String book_code) {
		return (ReserveVO) selectOne("book.getReserveInfo", book_code);
	}

	public int bookReserve(String book_code, String id) {
		Map map = new HashMap<>();
		map.put("book_code", book_code);
		map.put("id", id);
		return (int) insert("book.bookReserve", map);
	}

	public int bookRentyn(String book_code) {
		return (int) update("book.bookRentyn", book_code);
	}

	public int bookReserveyn(String book_code) {
		return (int) update("book.bookReserveyn", book_code);
	}

	public int insertRec(BookRecommendVO vo) {
		return (int) insert("book.insertRec", vo);
	}

	public List<BookRecommendVO> bookRecommed(String book_code) {
		return selectList("book.bookRecommed", book_code);
	}

	public int bookRecommedCount(String book_code) {
		return (int) selectOne("book.bookRecommedCount", book_code);
	}

	public int bookRecommendModify(BookRecommendVO vo) {
		System.out.println(vo.getBook_recommend_subject());
		return (int) update("book.bookRecommendModify", vo);
	}

	public int bookRecommendDelete(String book_code, String book_recommend_code) {
		Map map = new HashMap<>();
		map.put("book_code", book_code);
		map.put("book_recommend_code", book_recommend_code);
		return (int) delete("book.bookRecommendDelete", map);
	}

	public int addWishBook(WishBookVO vo) {
		return (int) insert("book.addWishBook", vo);
	}

	public int wishInsert(WishListVO vo) {
		return (int) insert("book.wishInsert", vo);
	}

	public int wishCheck(String id, String book_code) {
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("book_code", book_code);
		return (int) selectOne("book.wishCheck", map);
	}

}
