package com.biz.rbooks.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.rbooks.domain.BooksVO;
import com.biz.rbooks.domain.PageVO;
import com.biz.rbooks.domain.ReadBookVO;
import com.biz.rbooks.service.BooksService;
import com.biz.rbooks.service.PageService;
import com.biz.rbooks.service.ReadBookService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value = "/rbook")
@Controller
public class ReadBookController {

	private final ReadBookService rbService;
	private final BooksService bService;
	private final PageService pService;
	
	@ModelAttribute("rbVO")
	public ReadBookVO makeReadBookVO() {
		return new ReadBookVO();
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String list(Model model,
			@RequestParam(value = "search", required = false, defaultValue = "") String rb_subject,
			@RequestParam(value = "currentPageNo", required = false, defaultValue = "1") int currentPageNo) {
		long totalCount = rbService.totalCount(rb_subject);
		
		if(totalCount == 0) {
			return null;
		}
		
		PageVO pageVO = pService.getPagination(totalCount, currentPageNo);
		List<ReadBookVO> rbList = rbService.findByRbSubjectListAndPagiNation(rb_subject, pageVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("url","list");
		model.addAttribute("search", rb_subject);
		model.addAttribute("RBLIST", rbList);
	
		return "rbook/list";
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Model model) {
		ReadBookVO rbVO = new ReadBookVO();
		
		LocalDate localDate = LocalDate.now();
		String curDate = localDate.toString();
		
		DateTimeFormatter dt = DateTimeFormatter.ofPattern("HH:mm:ss");
		LocalTime localTime = LocalTime.now();
		String curTime = localTime.format(dt).toString();
		
		rbVO.setRb_date(curDate);
		rbVO.setRb_stime(curTime);
		
		model.addAttribute("rbVO", rbVO);
		model.addAttribute("BODY", "RB_INPUT");
		return "rbook/list";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String input(@ModelAttribute ReadBookVO rbVO) {
		rbService.save(rbVO);
		return "redirect:/rbook/list";
	}
	
	@RequestMapping(value = "/view/{rb_seq}", method = RequestMethod.GET)
	public String view(@PathVariable("rb_seq") long rb_seq, Model model) {
		ReadBookVO rbVO = rbService.findBySeq(rb_seq);
		model.addAttribute("RBOOK", rbVO);
	
		String b_code = rbVO.getRb_bcode();
		BooksVO booksVO = bService.findByBCode(b_code);
		model.addAttribute("BOOK", booksVO);
	
		List<ReadBookVO> rbList = rbService.findByBCode(b_code);
		model.addAttribute("RBLIST", rbList);

		model.addAttribute("BODY", "RB_VIEW");
		return "rbook/list";
	}
		
	@RequestMapping(value = "/update/{rb_seq}", method = RequestMethod.GET)
	public String update(@ModelAttribute ReadBookVO rbVO, @PathVariable("rb_seq") long rb_seq, Model model) {
		rbVO = rbService.findBySeq(Long.valueOf(rb_seq));
		model.addAttribute("rbVO", rbVO);
		model.addAttribute("BODY", "RB_INPUT");
		return "rbook/list";
	}
	
	@RequestMapping(value = "/update/{rb_seq}",method = RequestMethod.POST)
	public String update(@ModelAttribute ReadBookVO rbVO) {
		rbService.save(rbVO);
		return "redirect:/rbook/list";
	}
	
	@RequestMapping(value = "/delete/{rb_seq}", method = RequestMethod.GET)
	public String delete(@PathVariable("rb_seq") String rb_seq) {
		int ret = rbService.delete(Long.valueOf(rb_seq));
		return "redirect:/rbook/list";
	}
	
}
