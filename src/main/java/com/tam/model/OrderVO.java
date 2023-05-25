package com.tam.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private int orderNum;			// 주문번호
	private String id;				// 회원아이디
	private int orderPrice;			// 금액
	private Date orderDate;			// 주문일자
	private String orderPay;		// 결제수단
	private String orderStatus;		// 주문상태
	private String orderRecv;		// 수령인
	private String orderPost;		// 수령 우편번호
	private String orderAddr1;		// 수령주소1
	private String orderAddr2;		// 수령주소2
	private String orderMsg;		// 배송메시지
	private int orderPointIn;		// 받는적립금
	private int orderPointOut;		// 내는적립금

}
