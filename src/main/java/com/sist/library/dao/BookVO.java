package com.sist.library.dao;

import java.util.Date;

public class BookVO {
	private Long book_code;
	private String book_name;
	private String book_author;
	private String book_publish;
	private Date book_publish_date;
	private String book_info;
	private String rent_yn;
	private String reserve_yn;
	private int book_rent_count;
	private String book_image;
	private Date book_storage_date;
	private String book_category;


	public Long getBook_code() {
		return book_code;
	}

	public void setBook_code(Long book_code) {
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

	public String getBook_publish() {
		return book_publish;
	}

	public void setBook_publish(String book_publish) {
		this.book_publish = book_publish;
	}

	public Date getBook_publish_date() {
		return book_publish_date;
	}

	public void setBook_publish_date(Date book_publish_date) {
		this.book_publish_date = book_publish_date;
	}

	public String getBook_info() {
		return book_info;
	}

	public void setBook_info(String book_info) {
		this.book_info = book_info;
	}

	public String getRent_yn() {
		return rent_yn;
	}

	public void setRent_yn(String rent_yn) {
		this.rent_yn = rent_yn;
	}

	public String getReserve_yn() {
		return reserve_yn;
	}

	public void setReserve_yn(String reserve_yn) {
		this.reserve_yn = reserve_yn;
	}

	public int getBook_rent_count() {
		return book_rent_count;
	}

	public void setBook_rent_count(int book_rent_count) {
		this.book_rent_count = book_rent_count;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public Date getBook_storage_date() {
		return book_storage_date;
	}

	public void setBook_storage_date(Date book_storage_date) {
		this.book_storage_date = book_storage_date;
	}

	public String getBook_category() {
		return book_category;
	}

	public void setBook_category(String book_category) {
		this.book_category = book_category;
	}

}
