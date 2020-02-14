package com.biz.rbooks.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.biz.rbooks.domain.MemberVO;

public interface MemberDao {
	
	@Select("SELECT COUNT(*) FROM tbl_member")
	public int memberCount();
	
	@Select("SELECT * FROM tbl_member WHERE m_id = #{m_id}")
	public MemberVO findById(String m_id);
	
	@Insert("INSERT INTO tbl_member(m_id, m_password, m_login_date, m_rem) "
			+ " VALUES(#{m_id}, #{m_password}, #{m_login_date, jdbcType=VARCHAR}, #{m_rem, jdbcType=VARCHAR}) ")
	public int memberJoin(MemberVO memberVO);
	
}
