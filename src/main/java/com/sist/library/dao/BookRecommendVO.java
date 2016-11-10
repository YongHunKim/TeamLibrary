package com.sist.library.dao;

public class BookRecommendVO {
	private int book_recommend_code;
	private Long book_code;
	private String book_recommend_subject;
	private String id;
	
	

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
