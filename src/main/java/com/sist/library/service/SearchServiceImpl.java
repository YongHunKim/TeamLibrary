package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookDAO;
import com.sist.library.dao.BookVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Resource(name="bookDAO")
	private BookDAO bookDAO;
	
	@Override
	public List<BookVO> search(int page,String searchWord) {
		return bookDAO.search(page,searchWord);
	}

}
