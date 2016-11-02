package com.sist.library.dao;

import java.util.*;

import org.springframework.stereotype.Repository;

@Repository("bookDAO")
public class BookDAO extends AbstractDAO{

	public List<BookVO> search(int page,String searchWord) {
		Map map = new HashMap<>();
		int pageRow = 10;
		int start = (page*pageRow)-(pageRow-1);
		int end = start+(pageRow-1);
		map.put("start", start);
		map.put("end", end);
		map.put("searchWord", searchWord);
		return selectList("search.search",map);
	}

}
