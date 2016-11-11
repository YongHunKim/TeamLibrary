package com.sist.library.service;

import java.util.*;
import com.sist.library.dao.NoticeDAO;
import com.sist.library.dao.NoticeVO;

public interface NoticeService {
	public void insertNotice(NoticeVO vo)throws Exception;//입력
	public NoticeVO getNoticecontent(int content_no);
	//게시판 내용보기
	public void contentNotice(NoticeVO vo)throws Exception;

	//게시판리스트
	public List<NoticeVO> getAllNotice(Map map)throws Exception;
	
	//삭제
	public void getNoticedelete(int nt_no) throws Exception;
	
	
	//수정
	public NoticeVO updateNotice(int nt_no);
	
	public void update_ok_Notice(NoticeVO vo) throws Exception;
	
	
	
	
	
	//리플
	
	
	
	
}
