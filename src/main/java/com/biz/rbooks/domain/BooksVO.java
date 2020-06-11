package com.biz.rbooks.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class BooksVO {
	
	private String b_code; 		// ISBN 도서코드	varchar2(20 byte)
	private String b_name; 		// 도서명			nvarchar2(125 char)
	private String b_auther; 	// 저자				nvarchar2(125 char)
	private String b_comp; 		// 출판사			nvarchar2(125 char)
	private String b_year; 		// 구입연도			varchar2(10 byte)
	private int b_iprice; 		// 구입가격			number
	
}
