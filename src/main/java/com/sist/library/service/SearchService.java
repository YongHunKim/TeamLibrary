package com.sist.library.service;

import java.util.List;
import com.sist.library.dao.BookVO;

public interface SearchService {
	public List<BookVO> search(int page, String searchWord);

	public int pageCount(String searchWord);

	public int totalRow(String searchWord);

	public List<BookVO> newbook(int curPage);

	public int newBookCount();

	public int newBookRow();

	public List<BookVO> popularBook();

}
