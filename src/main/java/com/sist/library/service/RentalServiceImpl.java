package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookManagerDAO;
import com.sist.library.dao.BookManagerVO;

@Service("rentalService")
public class RentalServiceImpl implements RentalService{

	@Resource(name="bookmanagerDAO")
	private BookManagerDAO bookmanagerDAO;

	@Override
	public List<BookManagerVO> rental_history(String id) throws Exception{
		return bookmanagerDAO.rental_history(id);
	}

	@Override
	public List<BookManagerVO> reservation_history(String id) throws Exception{
		return bookmanagerDAO.reservation_history(id);
	}
}
