package com.sist.library.dao;

import java.util.Date;

public class BookManagerVO {
	private int book_management_code;
	private String id;
	private int book_code;
	private Date rent_date;
	private Date return_date;
	private Date reserve_date;
	private BookVO book;

	public int getBook_management_code() {
		return book_management_code;
	}

	public void setBook_management_code(int book_management_code) {
		this.book_management_code = book_management_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBook_code() {
		return book_code;
	}

	public void setBook_code(int book_code) {
		this.book_code = book_code;
	}

	public Date getRent_date() {
		return rent_date;
	}

	public void setRent_date(Date rent_date) {
		this.rent_date = rent_date;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}

	public Date getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}

	public BookVO getBook() {
		return book;
	}

	public void setBook(BookVO book) {
		this.book = book;
	}

}
