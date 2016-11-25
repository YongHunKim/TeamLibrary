package com.sist.library.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {


	public List<NoticeVO> topNotice(){
		return selectList("notice.topNotice");
	}//상단고정
	
	
	public void insertNotice(NoticeVO vo){
		insert("notice.insertNotice", vo);

	}

	public List<NoticeVO> getAllNotice(Map map) {
		return selectList("notice.getAllNotice", map);
	}

	public NoticeVO getNoticecontent(int content_no) {
		return (NoticeVO) selectOne("notice.getNoticecontent", content_no);
	}

	public void getNoticedelete(int nt_no) {
		delete("notice.getNoticedelete", nt_no);
	}

	public NoticeVO updateNotice(int nt_no) {
		return (NoticeVO) selectOne("notice.updateNotice", nt_no);

	}

	public void update_ok_Notice(NoticeVO vo) {
		update("notice.update_ok_Notice", vo);
	}

	public int divisionNotice(Map map) {
		return (int) selectOne("notice.divisionNotice", map);
	}
	
    public int totalRow(){
    	return (int) selectOne("notice.totalRow");
	}

	public int pageCount() {
		return (int) selectOne("notice.pageCount");
	}


	public void update_hit(int content_no) {
		selectOne("notice.update_hit", content_no);
	}
	
	public List <NoticeVO> search(Map map){
		return selectList("notice.search", map);
	}
	
	public int searchtotalRow(Map map){
	    return (int) selectOne("notice.searchtotalRow", map);
	}


	public int searchCount(Map map) {
		return (int) selectOne("notice.searchCount", map); 
	}

}
