package com.tam.service;

import java.util.List;

import com.tam.model.CartVO;

public interface CartService {
	//장바구니 추가
	public int addCart(CartVO cart);

	//장바구니 리스트
	public List<CartVO> getCartList(String id);
	
	//카트 수량수정
	public int modifyCount(CartVO cart);
	
	//카트 삭제
	public int deleteCart(int cartNum);
}
