package com.tam.model;

import lombok.Data;

@Data
public class OrderDetailDTO {
	
	private int odNum;	// 주문 상세번호
	private int orderNum;	// 주문 번호
	private int prodNum;	// 상품 번호
	private int prodCount;	// 주문 상품 수량
	private int prodPrice;	// 상품 한개 가격
	
	/* DB에 안들어가는 데이터 */
	private int savePoint;	// 상품 한개 구매 시 획득 포인트
	private int totalPrice;	// 총 가격(하나 가격 * 수량)
	private int totalSavePoint;	// 총 획득 포인트(하나 포인트 * 수량)
	
	public void initSaleTotal() {
		this.totalPrice = this.prodPrice * this.prodCount;
		this.savePoint = (int)(Math.floor(this.prodPrice * 0.05));
		this.totalSavePoint = this.savePoint * this.prodCount;
	}

}
