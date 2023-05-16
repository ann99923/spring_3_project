package com.tam.model;

import lombok.Data;

@Data
public class QnaVO {
	
	private int qNum;			// 글번호
	private int prodNum;		// 상품번호
	private String id;			// 회원아이디
	private int qPw;			// 글비밀번호
	private String qContent;	// 글내용

}
