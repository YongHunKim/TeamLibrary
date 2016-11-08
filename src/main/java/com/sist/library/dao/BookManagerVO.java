package com.sist.library.dao;

import java.util.Date;

public class BookManagerVO {
	private int book_management_code;
//	private String id;
	private long book_code;
	private String book_name;
	private String book_author;
	private Date rent_date;
	private Date return_date;
	private Date reserve_date;
//	private BookVO book;

	public int getBook_management_code() {
		return book_management_code;
	}

	public void setBook_management_code(int book_management_code) {
		this.book_management_code = book_management_code;
	}

/*	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}*/



	public Date getRent_date() {
		return rent_date;
	}

	public long getBook_code() {
		return book_code;
	}

	public void setBook_code(long book_code) {
		this.book_code = book_code;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
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

/*	public BookVO getBook() {
		return book;
	}

	public void setBook(BookVO book) {
		this.book = book;
	}*/
	
}
