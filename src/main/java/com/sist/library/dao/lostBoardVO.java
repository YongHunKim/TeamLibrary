package com.sist.library.dao;

import java.util.*;
public class lostBoardVO {	
	private int lb_no;
	private String id;
	private String lb_subject;
	private String lb_content;
	private int lb_hit;
	private int lb_root;
	private int lb_depth;
	private Date lb_regdate;
	private int lb_group_id;
	private int lb_group_step;
	private int lb_group_tab;

	public int getLb_no() {
		return lb_no;
	}
	public void setLb_no(int lb_no) {
		this.lb_no = lb_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLb_subject() {
		return lb_subject;
	}
	public void setLb_subject(String lb_subject) {
		this.lb_subject = lb_subject;
	}
	public String getLb_content() {
		return lb_content;
	}
	public void setLb_content(String lb_content) {
		this.lb_content = lb_content;
	}
	public int getLb_hit() {
		return lb_hit;
	}
	public void setLb_hit(int lb_hit) {
		this.lb_hit = lb_hit;
	}
	public int getLb_root() {
		return lb_root;
	}
	public void setLb_root(int lb_root) {
		this.lb_root = lb_root;
	}
	public int getLb_depth() {
		return lb_depth;
	}
	public void setLb_depth(int lb_depth) {
		this.lb_depth = lb_depth;
	}
	public Date getLb_regdate() {
		return lb_regdate;
	}
	public void setLb_regdate(Date lb_regdate) {
		this.lb_regdate = lb_regdate;
	}
	public int getLb_group_id() {
		return lb_group_id;
	}
	public void setLb_group_id(int lb_group_id) {
		this.lb_group_id = lb_group_id;
	}
	public int getLb_group_step() {
		return lb_group_step;
	}
	public void setLb_group_step(int lb_group_step) {
		this.lb_group_step = lb_group_step;
	}
	public int getLb_group_tab() {
		return lb_group_tab;
	}
	public void setLb_group_tab(int lb_group_tab) {
		this.lb_group_tab = lb_group_tab;
	}	
}
