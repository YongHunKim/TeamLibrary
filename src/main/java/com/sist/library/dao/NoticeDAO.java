package com.sist.library.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;

import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{
	
	public void insertNotice(NoticeVO vo){
		insert("notice.insertNotice", vo);
		
	}
	
	
	public List<NoticeVO> getAllNotice(Map map){
	/*	int total = 0;
		try {
		String sql = "SELECT CEIL(COUNT(*)/10) FROM "+nt_no;
		ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		total = rs.getInt(1);
		rs.close();*/
		
		
		
		return selectList("notice.getAllNotice", map);
	}


	public NoticeVO getNoticecontent(int content_no) {
		System.out.println(content_no);
		return (NoticeVO) selectOne("notice.getNoticecontent",content_no);
	}
	
	public void getNoticedelete(int nt_no) {
		System.out.println(nt_no);
		delete("notice.getNoticedelete", nt_no);
	}


	public NoticeVO updateNotice(int nt_no){
		return (NoticeVO) selectOne("notice.updateNotice", nt_no);
		
	}


	public void update_ok_Notice(NoticeVO vo) {
		update("notice.update_ok_Notice", vo);
	}
}
		


