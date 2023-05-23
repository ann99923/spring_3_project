package com.tam.model;

import lombok.Data;


public class CartVO {
	
	private int cartNum;		// 장바구니 번호
	private int prodNum;		// 상품번호
	private String id;			// 회원아이디
	private int cartCount;		// 수량
	
	
	//포인트 유무 나중에 넣기
	
	//product	
	private String prodName;
	private int price;
	private int totalPrice;
	
	
	public void initSaleTotal() {
		this.totalPrice = this.price*this.cartCount;
		
	}


	public int getCartNum() {
		return cartNum;
	}


	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}


	public int getProdNum() {
		return prodNum;
	}


	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getCartCount() {
		return cartCount;
	}


	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}


	public String getProdName() {
		return prodName;
	}


	public void setProdName(String prodName) {
		this.prodName = prodName;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", prodNum=" + prodNum + ", id=" + id + ", cartCount=" + cartCount
				+ ", prodName=" + prodName + ", price=" + price + ", totalPrice=" + totalPrice + "]";
	}
	
	
	

}
