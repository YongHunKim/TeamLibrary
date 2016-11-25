package com.sist.library.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.AdminDAO;
import com.sist.library.dao.BookVO;
import com.sist.library.dao.WishBookVO;


@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Resource(name="AdminDAO")
	private AdminDAO AdminDAO;

	@Override
	public void book_plus(BookVO vo) throws Exception {
		AdminDAO.bookPlus(vo);
	}

	@Override
	public void book_delete(long book_code) throws Exception {
		AdminDAO.book_delete(book_code);
		
	}

	@Override
	public BookVO book_update(long book_code) throws Exception {
		return AdminDAO.book_update(book_code);
	}

	@Override
	public void book_update_ok(BookVO vo) throws Exception {
		AdminDAO.book_update_ok(vo);
	}

	@Override
	public int wishTotalPage() {
		return AdminDAO.wishTotalPage();
	}

	@Override
	public int wishTotalRow() {
		return AdminDAO.wishTotalRow();
	}

	@Override
	public List<WishBookVO> wishBookList(Map map) {
		return AdminDAO.wishBookList(map);
	}
	
	

	

}
