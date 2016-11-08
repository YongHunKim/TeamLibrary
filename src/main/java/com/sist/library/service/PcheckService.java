package com.sist.library.service;

public interface PcheckService {
	
	public int pcheck_pwd(String pwd);
	
	public int pcheck_ok(String id, String pwd);
	
	public int select_member(String id);
}
