package com.tam.model;

import lombok.Data;

@Data
public class CartVO {
	
	private int cartNum;		// 장바구니 번호
	private int prodNum;		// 상품번호
	private String id;			// 회원아이디
	private int cartCount;		// 수량
	
	// product

	private String prodName;
	private int price;
	private int totalPrice;

	public void initSaleTotal() {
		this.totalPrice = this.price * this.cartCount;
	}

}
