package com.biz.rbooks.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.BooksVO;
import com.biz.rbooks.domain.PageVO;
import com.biz.rbooks.domain.ReadBookVO;
import com.biz.rbooks.repository.BooksDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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

	/*
	 * 현재 INSERT와 UPDATE가 되기는 하지만
	 * DB에서 자동생성 아닌 B_CODE 이기 때문에
	 * findByBCode로 한번 찾은 다음
	 * if문으로 한번 더 확인한 다음에 구현을 하고 있다.
	 */
	public int save(BooksVO booksVO) {
		String b_code = booksVO.getB_code();
		
		// b_code 구별하기 위해 찾는다.
		BooksVO bVO = bDao.findByBCode(b_code);
		
		log.debug("세이브 : " + b_code);
		
		if(bVO != null) {
			bDao.update(booksVO);
			// log.debug("BooksService save / b_code != null");
		} else {
			b_code = bDao.getMaxBCode();
			String b_prefixCode = "97911";
			
			int intBCode = 1;
			try {
				b_prefixCode = b_code.substring(0,5);
				String b_surfixCode = b_code.substring(5);
				
				intBCode = Integer.valueOf(b_surfixCode) + 1;
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			b_code = String.format("%s%07d", b_prefixCode, intBCode);
			booksVO.setB_code(b_code);

			bDao.insert(booksVO);
			//log.debug("BooksService save / else");
		}
		return 0;	
	}

	public int delete(String b_code) {
		return bDao.delete(b_code);
	}

}
	