package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.UpdateProvider;

import com.biz.rbooks.domain.PageVO;
import com.biz.rbooks.domain.ReadBookVO;

public interface ReadBookDao {

	public List<ReadBookVO> selectAll();
	
	public ReadBookVO findBySeq(long rb_seq);
	
	public List<ReadBookVO> findByBCode(String b_code);
	
	public int insert(ReadBookVO rBookVO);

	@UpdateProvider(type = ReadBookSQL.class, method = "update_sql")
	public int update(ReadBookVO rBookVO);

	@Delete("DELETE FROM tbl_read_book WHERE rb_seq = #{rb_seq}")
	public int delete(long rb_seq);

	public List<ReadBookVO> findByRbSubjectListAndPagiNation(
			@Param("rb_subject") List<String> rb_subject, 
			@Param("pageVO") PageVO pageVO);

	public long proTotalCount(@Param("rb_subject") List<String> rb_subList);

}
