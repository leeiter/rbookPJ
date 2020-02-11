package com.biz.rbooks.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.BooksVO;
import com.biz.rbooks.domain.PageVO;
import com.biz.rbooks.domain.ReadBookVO;
import com.biz.rbooks.repository.BooksDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BooksService {
	
	private final PageService pService;
	private final BooksDao bDao;

	public List<BooksVO> selectAll() {
		return bDao.selectAll();
	}

	public List<BooksVO> findByBNames(String strText) {
		List<String> names = Arrays.asList(strText.split(" "));
		List<BooksVO> bList = bDao.findByBNames(names);
		return bList;
	}

	public BooksVO findByBCode(String b_code) {
		BooksVO booksVO = bDao.findByBCode(b_code);
		return booksVO;
	}
	
	public long totalCount(String b_name) {
		String[] b_names = b_name.split(" ");
		List<String> b_nameList = Arrays.asList(b_names);
		return bDao.proTotalCount(b_nameList);
	}
	
	public List<BooksVO> findByBNameListAndPagiNation(String b_name, PageVO pageVO) {
		List<String> b_names = Arrays.asList(b_name.split(" "));
		return bDao.findByBNameListAndPagiNation(b_names, pageVO);
	}

	public int save(BooksVO booksVO) {
		String b_code = booksVO.getB_code();
		if(b_code != null) {
			bDao.update(booksVO);
		} else {
			bDao.insert(booksVO);
		}
		return 0;	
	}

	public int delete(String b_code) {
		return bDao.delete(b_code);
	}

}
	