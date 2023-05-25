package com.tam.model;

import lombok.Data;

@Data
public class PointVO {
	
	private int pointNum;			// 적립금번호
	private String id;				// 회원아이디
	private int point;				// 금액
	private String pointStatus;		// 상태

}
