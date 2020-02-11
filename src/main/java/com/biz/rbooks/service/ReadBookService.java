package com.biz.rbooks.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.PageVO;
import com.biz.rbooks.domain.ReadBookVO;
import com.biz.rbooks.repository.ReadBookDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReadBookService {
	
	private final PageService pService;
	private final ReadBookDao rbDao;

	public List<ReadBookVO> selectAll() {
		return rbDao.selectAll();
	}

	public int save(ReadBookVO rbVO) {
		long rb_seq = rbVO.getRb_seq();
		if(rb_seq > 0) {
			rbDao.update(rbVO);
		} else {
			rbDao.insert(rbVO);
		}
		return 0;		
	}

	public ReadBookVO findBySeq(long rb_seq) {
		return rbDao.findBySeq(rb_seq);
	}

	public List<ReadBookVO> findByBCode(String b_code) {
		return rbDao.findByBCode(b_code);
	}

	public int delete(Long rb_seq) {
		return rbDao.delete(rb_seq);
	}
	
	public long totalCount(String rb_subject) {
		String[] rb_subjects = rb_subject.split(" ");
		List<String> rb_subList = Arrays.asList(rb_subjects);
		return rbDao.proTotalCount(rb_subList);
	}
	
	public List<ReadBookVO> findByRbSubjectListAndPagiNation(String rb_subject, PageVO pageVO) {
		List<String> rb_subjects = Arrays.asList(rb_subject.split(" "));
		return rbDao.findByRbSubjectListAndPagiNation(rb_subjects, pageVO);
	}

}
