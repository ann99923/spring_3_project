package com.tam.model;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private int odNum;			// 주문 상세번호
	private int orderNum;		// 주문번호
	private int prodNum;		// 상품번호
	private int odStock;		// 수량
	private int odPrice;		// 금액

}
