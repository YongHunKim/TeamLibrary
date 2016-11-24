package com.sist.library.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.library.dao.BookDAO;
import com.sist.library.dao.BookVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Resource(name = "bookDAO")
	private BookDAO bookDAO;

	@Override
	public List<BookVO> search(int page, String searchWord) {
		return bookDAO.search(page, searchWord);
	}

	@Override
	public int pageCount(String searchWord) {
		return bookDAO.pageCount(searchWord);
	}

	@Override
	public int totalRow(String searchWord) {
		return bookDAO.totalRow(searchWord);
	}

	@Override
	public List<BookVO> newbook(int curPage) {
		return bookDAO.newbook(curPage);
	}

	@Override
	public int newBookCount() {
		return bookDAO.newBookCount();
	}

	@Override
	public int newBookRow() {
		return bookDAO.newBookRow();
	}

	@Override
	public List<BookVO> popularBook() {
		return bookDAO.popularBook();
	}

}
