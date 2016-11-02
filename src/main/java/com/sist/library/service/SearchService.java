package com.sist.library.service;

import java.util.List;
import com.sist.library.dao.BookVO;


public interface SearchService {
	public List<BookVO> search(int page,String searchWord);
}
