package com.sist.library.dao;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int nt_no;
	private String id;
	private String nt_subject ;
	private String nt_content;
	private String nt_hit;
	private Date nt_regdate;
	public int getNt_no() {
		return nt_no;
	}
	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNt_subject() {
		return nt_subject;
	}
	public void setNt_subject(String nt_subject) {
		this.nt_subject = nt_subject;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public String getNt_hit() {
		return nt_hit;
	}
	public void setNt_hit(String nt_hit) {
		this.nt_hit = nt_hit;
	}
	public Date getNt_regdate() {
		return nt_regdate;
	}
	public void setNt_regdate(Date nt_regdate) {
		this.nt_regdate = nt_regdate;
	}

}
	
	