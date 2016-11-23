package com.sist.library.dao;

public class BookRecommendVO {
	private int book_recommend_code;
	private Long book_code;
	private String book_recommend_subject;
	private String id;
	private String book_name;
	private String book_author;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBook_recommend_code() {
		return book_recommend_code;
	}

	public void setBook_recommend_code(int book_recommend_code) {
		this.book_recommend_code = book_recommend_code;
	}

	public Long getBook_code() {
		return book_code;
	}

	public void setBook_code(Long book_code) {
		this.book_code = book_code;
	}

	public String getBook_recommend_subject() {
		return book_recommend_subject;
	}

	public void setBook_recommend_subject(String book_recommend_subject) {
		this.book_recommend_subject = book_recommend_subject;
	}

}
