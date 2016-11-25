package com.sist.library.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("AdminDAO")
public class AdminDAO extends AbstractDAO{

	public void bookPlus(BookVO vo) {
		insert("admin.bookPlus", vo);
	}

	public void book_delete(long book_code) {
		delete("admin.book_delete", book_code);	
	}

	public BookVO book_update(long book_code) {
		return (BookVO) selectOne("admin.book_update", book_code);
	}

	public void book_update_ok(BookVO vo) {
		update("admin.book_update_ok", vo);	
	}

	public int wishTotalPage() {
		return (int) selectOne("admin.wishTotalPage");
	}

	public int wishTotalRow() {
		return (int) selectOne("admin.wishTotalRow");
	}

	public List<WishBookVO> wishBookList(Map map) {
		return selectList("admin.wishBookList", map);
	}

}
