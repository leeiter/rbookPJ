package com.biz.rbooks.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class MemberVO {
	
	private String m_id; 			// 회원 ID				varchar2(20 byte)
	private String m_password; 		// 회원 비밀번호		nvarchar2(125 char)
	private String m_login_date; 	// 회원 최종로그인 날짜	varchar2(10 byte)
	private String m_rem; 			// 기타					nvarchar2(125 char)

}
