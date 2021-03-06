package com.sist.library.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.sist.library.dao.NoticeDAO;
import com.sist.library.dao.NoticeVO;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Resource(name = "noticeDAO")
	private NoticeDAO noticeDAO;

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		noticeDAO.insertNotice(vo);
	}

	@Override
	public void contentNotice(NoticeVO vo) throws Exception {

	}

	@Override
	public List<NoticeVO> getAllNotice(Map map) throws Exception {

		return noticeDAO.getAllNotice(map);
	}

	@Override
	public NoticeVO getNoticecontent(int content_no) {
		return noticeDAO.getNoticecontent(content_no);

	}

	@Override
	public void getNoticedelete(int nt_no) throws Exception {
		noticeDAO.getNoticedelete(nt_no);
	}

	@Override
	public NoticeVO updateNotice(int nt_no) {
		return noticeDAO.updateNotice(nt_no);
	}

	@Override
	public void update_ok_Notice(NoticeVO vo) {
		noticeDAO.update_ok_Notice(vo);
	}

	@Override
	public int divisionNotice(Map map) {
		return noticeDAO.divisionNotice(map);
	}

	@Override
	public int pageCount() {
		return noticeDAO.pageCount();
	}

	@Override
	public int totalRow() {
		return noticeDAO.totalRow();
	}

	@Override
	public void update_hit(int content_no) {
		noticeDAO.update_hit(content_no);
	}

	@Override
	public List<NoticeVO> topNotice() throws Exception {
		return noticeDAO.topNotice();
	}

	@Override
	public List<NoticeVO> search(Map map) throws Exception {
		return noticeDAO.search(map);

	}

	@Override
	public int searchtotalRow(Map map) {
		return noticeDAO.searchtotalRow(map);
	}

	@Override
	public int searchCount(Map map) {
		return noticeDAO.searchCount(map);
	}
}
