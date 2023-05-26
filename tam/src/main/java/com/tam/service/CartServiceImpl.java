package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.CartMapper;
import com.tam.model.CartVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public int addCart(CartVO cart) {
		//장바구니 데이터 체크
		CartVO checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		//장바구니 등록 & 에러 시 0 반환
		try {
		return cartMapper.addCart(cart);
	}catch (Exception e) {
		return 0;
	}
	}

	@Override
	public List<CartVO> getCartList(String id) {
		List<CartVO> cart = cartMapper.getCart(id);
		
		for(CartVO vo : cart) {
			vo.initSaleTotal();
		}
		return cart;
	}

	@Override
	public int modifyCount(CartVO cart) {
		return cartMapper.modifyCount(cart);
	}

	@Override
	public int deleteCart(int cartNum) {
		
		return cartMapper.deleteCart(cartNum);
	}
}
