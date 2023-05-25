package com.tam.model;

import lombok.Data;

@Data
public class Point2DTO {
	
	private int pointNum;			// 적립금번호
	private String id;				// 회원아이디
	private int point;				// 금액
	private int pointStatus;		// 획득/사용 확인
	private String pointContent;	// 내용

}
