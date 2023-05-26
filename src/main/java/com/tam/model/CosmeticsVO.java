package com.tam.model;

import lombok.Data;

@Data
public class CosmeticsVO {

	// 상품 코드
	private int prodCode;

	// 카테고리 코드
	private String cateCode;

	// 상품이름
	private String prodName;

	// 가격
	private int price;

	// 상품 상세 설명
	private String prodInfo;

	// 재고
	private int stock;

	// 카테고리 이름
	private String cateName;
}
