package com.tam.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Order2DTO {
	
	private int orderNum;		// 주문번호
	private String id;			// 회원 아이디
	private Date orderDate;		// 주문 날짜
	private String orderPay;	// 결제수단
	private String orderStatus;	// 주문상태
	private String orderRecv;	// 수령인
	private String orderPost;	// 우편번호
	private String orderAddr1;	// 주소
	private String orderAddr2;	// 상세주소
	private String orderMsg;	// 배송메세지
	private int orderPointIn;	// 적립포인트
	private int orderPointOut;	// 사용포인트
	private int orderPrice;		// 판매가
	private int orderFinalPrice;	// 최종 판매 비용
	
	/* DB에 안들어가는 데이터 */
	private List<OrderDetailDTO> orders;	// 주문상품
	
	public void getOrderPriceInfo() {
		// 상품 비용 & 적립포인트
		for(OrderDetailDTO order : orders) {
			orderPrice += order.getTotalPrice();
			orderPointIn += order.getTotalSavePoint();
		}
		
		int deliveryCost = 0;	// 배송비
		// 배송비용
		if(orderPrice >= 50000) {
			deliveryCost = 0;
		}else {
			deliveryCost = 3000;
		}
		
		// 최종비용(상품비용 + 배송비 - 사용포인트)
		orderFinalPrice = orderPrice + deliveryCost - orderPointOut;
	}
	

}
