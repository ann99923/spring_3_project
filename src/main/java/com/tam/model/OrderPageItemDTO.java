package com.tam.model;

import lombok.Data;

@Data
public class OrderPageItemDTO {
	
	// 뷰에서 전달받을 값
	private int prodNum;		// 상품번호
	private int prodCount;		// 주문수량
	
	// DB에서 꺼내올 값
	private String prodName;	// 상품이름
	private int price;		// 상품가격
	
	// 만들어 낼 값
	private int totalPrice;		// 총 가격
	private int point;			// 한 개의 상품 구매로 받을 수 있는 포인트
	private int totalPoint;		// 총포인트
	
	public void initSaleTotal() {
		this.totalPrice = this.price * this.prodCount;
		this.point = (int)(Math.floor(this.price*0.05));
		this.totalPoint = this.point * this.prodCount;
	}
}
