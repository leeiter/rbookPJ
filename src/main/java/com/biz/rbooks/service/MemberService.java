package com.biz.rbooks.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.MemberVO;
import com.biz.rbooks.repository.MemberDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberService {
	
	private final BCryptPasswordEncoder passwordEncoder;
	private final MemberDao mDao;
	
	// 회원가입
	public int memberJoin(MemberVO memberVO) {
		if(mDao.memberCount() < 1) {
			memberVO.setM_rem("ADMIN");
		} else {
			memberVO.setM_rem("USER");
		}
		
		String cryptText = passwordEncoder.encode(memberVO.getM_password());
		memberVO.setM_password(cryptText);
		return mDao.memberJoin(memberVO);
	}
	
	// 아이디 중복검사
	public boolean memberIdCheck(String m_id, String m_password) {
		MemberVO memberVO = mDao.findById(m_id);
		
		if(memberVO != null && memberVO.getM_id().equalsIgnoreCase(m_id)) {
			return true;
		}
		return false;
	}
	
	// 로그인 확인
	public MemberVO memberLoginCheck(String m_id, String m_password) {
		MemberVO loginMemberVO = mDao.findById(m_id);
		
		if(loginMemberVO != null) {
			String cryptPassword = loginMemberVO.getM_password();
			if(passwordEncoder.matches(m_password, cryptPassword)) {
				return loginMemberVO;
			}
		}
		return null;
	}
	
	public MemberVO getMember(String m_id) {
		return mDao.findById(m_id);
	}

}
