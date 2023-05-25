package com.tam.model;

import lombok.Data;

@Data
public class AnswerVO {
	
	private int qaNum;				// 글번호
	private int qNum;				// qna글번호
	private String qaContent;		// 답글내용

}
