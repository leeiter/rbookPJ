package com.biz.rbooks.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("rbVO")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ReadBookVO {
	
	private long rb_seq; 		// 독서록 일련번호	number
	private String rb_bcode; 	// IBSN 도서코드	varchar2(20 byte)
	private String rb_bname; 	// 도서명
	private String rb_date; 	// 작성날짜	varchar2(10 byte)
	private String rb_stime; 	// 시작시간	varchar2(10 byte)
	private String rb_rtime; 	// 독서시간	number(10,3)
	private String rb_subject; 	// 한줄소감	nvarchar2(20 char)
	private String rb_text; 	// 긴줄소감	nvarchar2(400 char)
	private int rb_star; 		//	별점 number

}
