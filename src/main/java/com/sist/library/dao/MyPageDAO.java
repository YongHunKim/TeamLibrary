package com.sist.library.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO{
		// 다시 한번 더 보자
	public int pcheck_pwd(String pwd){
		return (int) selectOne("mypage.pcheck_pwd", pwd);
	}
	
	
	// 다시 한번 더 보자.
	public int pcheck_ok(String pwd){
		return (int)selectOne("mypage.pcheck_ok", pwd);
	}
}
