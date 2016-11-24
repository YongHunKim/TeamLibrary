package com.sist.library.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.AdminDAO;
import com.sist.library.dao.BookVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Resource(name = "AdminDAO")
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

}
