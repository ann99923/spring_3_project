package com.tam.service;

import java.util.List;

import com.tam.model.CartVO;

public interface CartService {
	//장바구니 추가
	public int addCart(CartVO cart);

	public List<CartVO> getCartList(String id);
}
