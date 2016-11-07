package com.sist.library.dao;

import java.util.*;

import org.springframework.stereotype.Repository;

@Repository("bookDAO")
public class BookDAO extends AbstractDAO{

	public List<BookVO> search(int page,String searchWord) {
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (page*pageRow)-(pageRow-1);
		int end = start+(pageRow-1);
		map.put("start", start);
		map.put("end", end);
		map.put("searchWord", searchWord);
		return selectList("search.search",map);
	}

	public int pageCount(String searchWord) {
		return (int) selectOne("search.pageCount", searchWord);
	}

	public int totalRow(String searchWord) {
		return (int) selectOne("search.totalRow",searchWord);
	}

	public List<BookVO> newbook(int curPage) {
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (curPage*pageRow)-(pageRow-1);
		int end = start+(pageRow-1);
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
		return selectList("search.popular",map);
	}

	public BookVO bookInfo(String book_code) {		
		return (BookVO) selectOne("book.bookInfo",book_code);
	}

	public int bookRent(String book_code, String id) {
		Map map = new HashMap<>();
		map.put("book_code", book_code);
		map.put("id", id);
		return (int) insert("book.bookRent", map);
	}

}
