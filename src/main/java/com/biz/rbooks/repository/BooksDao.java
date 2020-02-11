package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.biz.rbooks.domain.BooksVO;
import com.biz.rbooks.domain.PageVO;

public interface BooksDao {
	
	@Select("SELECT * FROM tbl_books")
	public List<BooksVO> selectAll();

	public List<BooksVO> findByBNames(@Param("names") List<String> names);

	@Select("SELECT * FROM tbl_books WHERE b_code = #{b_code}")
	public BooksVO findByBCode(String b_code);

	public List<BooksVO> findByBNameListAndPagiNation(
			@Param("b_name") List<String> b_name,
			@Param("pageVO") PageVO pageVO);
	
	public long proTotalCount(@Param("b_name") List<String> b_name);

	public int insert(BooksVO booksVO);

	public int update(BooksVO booksVO);

	@Delete("DELETE FROM tbl_books WHERE b_code = #{b_code}")
	public int delete(String b_code);
	
	public String getMaxBCode();

}
