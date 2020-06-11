package com.biz.rbooks.controller;

import java.time.LocalDate;
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
import com.biz.rbooks.service.BooksService;
import com.biz.rbooks.service.PageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/book")
@Controller
public class BooksController {
	
	private final BooksService bService;
	private final PageService pService;
	
	@ModelAttribute("booksVO")
	public BooksVO makeBooksVO() {
		return new BooksVO();
	}
	
	
	/*
	 * @RequestParam(value="search", required = false,defaultValue = "") String b_name,
	 * @RequestParam : 단일 파라메터(매개변수)를 전달 받을 때 사용
	 * value="search" 매개변수 이름
	 * required = false 해당 파라미터가 반드시 필수인지 여부, 기본값은 true, 해당 키값이 존재 하지 않으면 null
	 * defaultValue = "" 해당 파라미터의 기본값
	 * 
	 * equals() : 객체 비교 method
	 * 객체 비교 메서드(Method) 이다.
	 * 두 객체의 값이 같은지 확인한다.
	 * 즉, 문자열의 데이터/내용을 기반으로 비교한다. 
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String list(Model model,
			@RequestParam(value="search", required = false,defaultValue = "") String b_name,
			@RequestParam(value="currentPageNo", required = false,defaultValue = "1") int currentPageNo) {
		long totalCount = bService.totalCount(b_name);
		
		if(totalCount == 0) {
			return null;
		}
		
		PageVO pageVO = pService.getPagination(totalCount, currentPageNo);
		List<BooksVO> bList = bService.findByBNameListAndPagiNation(b_name, pageVO);
		
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("url","list");
		model.addAttribute("search", b_name);
		model.addAttribute("BLIST", bList);
		return "book/list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam(value = "strText", required = false, defaultValue = "") String strText, Model model) {
		List<BooksVO> bList = bService.findByBNames(strText);
		model.addAttribute("BLIST", bList);
		return "book/list-body";
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input(Model model) {
		BooksVO booksVO = new BooksVO();
		
		LocalDate localDate = LocalDate.now();
		String curDate = localDate.toString();
		
		booksVO.setB_year(curDate);
		
		model.addAttribute("booksVO", booksVO);
		model.addAttribute("BODY", "B_INPUT");
		return "book/list";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String input(@ModelAttribute("booksVO") BooksVO booksVO) {
		// log.debug("save controller" + booksVO.toString());
		bService.save(booksVO);
		return "redirect:/book/list";
	}
	
	@RequestMapping(value = "/update/{b_code}", method = RequestMethod.GET)
	public String update(@ModelAttribute BooksVO booksVO, @PathVariable("b_code") String b_code, Model model) {
		booksVO = bService.findByBCode(b_code);
		model.addAttribute("booksVO", booksVO);
		model.addAttribute("BODY", "B_INPUT");
		return "book/list";
	}
	
	@RequestMapping(value = "/update/{b_code}", method = RequestMethod.POST)
	public String update(@ModelAttribute BooksVO booksVO) {
		bService.save(booksVO);
		return "redirect:/book/list";
	}
	
	@RequestMapping(value = "/delete/{b_code}", method = RequestMethod.GET)
	public String delete(@PathVariable("b_code") String b_code) {
		int ret = bService.delete(b_code);
		return "redirect:/book/list";
	}

}
