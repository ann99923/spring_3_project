package com.tam.model;

import lombok.Data;

@Data
public class ProductVO {
	
	private int prodNum;			// 상품코드
	private int categoryNum;		// 카테고리 번호
	private String prodName;		// 상품이름
	private int price;				// 가격
	private String img1;			// 이미지1
	private String img2;			// 이미지2
	private String img3;			// 이미지3
	private String prodInfo;		// 상품정보
	private int stock;				// 재고량
	
	

}
