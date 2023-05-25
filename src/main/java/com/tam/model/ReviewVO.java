package com.tam.model;

import lombok.Data;

@Data
public class ReviewVO {

	private int reNum;			// 글번호
	private int prodNum;		// 상품번호
	private String id;			// 회원아이디
	private String reContent;	// 글내용
}
