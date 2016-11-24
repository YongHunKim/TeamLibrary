package com.sist.library.dao;

public class WishListVO {
	private long book_code;
	private int wish_num;
	private String id;

	private String book_name;
	private String book_author;
	private String book_image;

	public long getBook_code() {
		return book_code;
	}

	public void setBook_code(long book_code) {
		this.book_code = book_code;
	}

	public int getWish_num() {
		return wish_num;
	}

	public void setWish_num(int wish_num) {
		this.wish_num = wish_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

}
