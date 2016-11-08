package com.sist.library.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("bookmanagerDAO")
public class BookManagerDAO extends AbstractDAO {
		
	public List<BookManagerVO> rental_history(String id){
		System.out.println(id);
		return selectList("rental.rental_history", id);
	}
	
	public List<BookManagerVO> reservation_history(String id){
		System.out.println(id);
		return selectList("rental.reservation_history", id);
	}
	
}
