package com.biz.rbooks.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.rbooks.domain.MemberVO;
import com.biz.rbooks.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value = "/member")
@Controller
public class MemberController {
	
	private final MemberService mService;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Model model) {
		MemberVO memberVO = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("BODY", "JOIN");
		return "member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@Valid @ModelAttribute("memberVO") MemberVO memberVO, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "member/join";
		} else {
			int ret = mService.memberJoin(memberVO);
			return "redirect:/member/login";
		}
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return null;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("m_id") String m_id, @RequestParam("m_password") String m_password,
			Model model, HttpSession httpSession) {
		MemberVO memberVO = mService.memberLoginCheck(m_id, m_password);
		
		if(memberVO != null) {
			httpSession.setAttribute("MEMBER", memberVO);
			return "redirect:/rbook/list";
		} else {
			httpSession.removeAttribute("MEMBER");
			return "redirect:/member/login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		httpSession.removeAttribute("MEMBER");
		return "redirect:/rbook/list";
	}
	
}
