package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.ListVO;
import com.sist.library.dao.ListDAO;


@Service("listservice")
public class ListServiceImpl implements ListService {
	
	@Resource(name="ListDAO")
	private ListDAO ListDAO;

	@Override
	public List<ListVO> boardList() throws Exception{
		return ListDAO.boardList();
	}

	@Override
	public ListVO getlostcontent(int content_no) {
		return ListDAO.getlostcontent(content_no);
	}

	@Override
	public void insertList(ListVO vo) throws Exception {
		ListDAO.insertList(vo);
	}

	@Override
	public ListVO getlostupdate(int update_no){
		return ListDAO.getlostupdate(update_no);
	}

	@Override
	public void getlostupdate_ok(ListVO vo) {
		
		ListDAO.getlostupdate_ok(vo);
	}

	public void getlostdelete(int lb_no) throws Exception{
		ListDAO.getlostdelete(lb_no);
	}

	


}
