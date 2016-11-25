package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookManagerDAO;
import com.sist.library.dao.BookManagerVO;

@Service("rentalService")
public class RentalServiceImpl implements RentalService {

	@Resource(name = "bookmanagerDAO")
	private BookManagerDAO bookmanagerDAO;

	@Override
	public List<BookManagerVO> rental_history(int page, String id) {
		return bookmanagerDAO.rental_history(page, id);
	}

	@Override
	public int rentalPage(String id) {
		// TODO Auto-generated method stub
		return bookmanagerDAO.rentalPage(id);
	}

	@Override
	public int rentalRow(String id) {
		// TODO Auto-generated method stub
		return bookmanagerDAO.rentalRow(id);
	}

	@Override
	public List<BookManagerVO> reservation_history(int page, String id) {
		return bookmanagerDAO.reservation_history(page, id);
	}

	@Override
	public int reservePage(String id) {
		// TODO Auto-generated method stub
		return bookmanagerDAO.reservePage(id);
	}

	@Override
	public int reserveRow(String id) {
		// TODO Auto-generated method stub
		return bookmanagerDAO.reserveRow(id);
	}
}
