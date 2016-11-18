package com.sist.library.dao;

import java.util.*;

import org.springframework.stereotype.Repository;

@Repository("bookmanagerDAO")
public class BookManagerDAO extends AbstractDAO {
		
	public List<BookManagerVO> rental_history(int curPage, String id){
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (curPage * pageRow)-(pageRow-1);
		int end = start+(pageRow-1);
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		return selectList("rental.rental_history", map);
	}
	
	public int rentalPage(String id){
		return (int) selectOne("rental.rentalPage", id);
	}
	
	public int rentalRow(String id){
		return (int) selectOne("rental.rentalRow", id);
	}
	
	public List<BookManagerVO> reservation_history(int curPage, String id){
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (curPage * pageRow)-(pageRow-1);
		int end = start + (pageRow-1);
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		System.out.println(map);
		return selectList("rental.reservation_history", map);
	}
	
	public int reservePage(String id){
		return (int) selectOne("rental.reservePage", id);
	}
	
	public int reserveRow(String id){
		return (int) selectOne("rental.reserveRow", id);
	}
	
}
