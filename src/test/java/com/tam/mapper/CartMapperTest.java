package com.tam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tam.model.CartVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTest {

	@Autowired
	private CartMapper mapper;
	
	/*
	@Test
	public void addCart() {
		
		int prodNum = 3;
		String Id = "12345";
		int cartCount = 5;
		
		
		CartVO cart = new CartVO();
		
		cart.setProdNum(prodNum);
		cart.setId(Id);
		cart.setCartCount(cartCount);
		
		
		int result = 0;
		result = mapper.addCart(cart);
		
		System.out.println("결과 : " + result);
		
	}	
	*/
	
	/*카트 삭제*/
	/*
	@Test
	public void deleteCartTest() {
		int prodNum = 49;
		
		mapper.deleteCart(prodNum);
	}
	*/
	
	/*카트 수량 수정*/
	/*
	@Test
	public void modifyCartTest() {
		int prodNum =1;
		int cartCount = 5;
		
		CartVO cart = new CartVO();
		cart.setProdNum(prodNum);
		cart.setCartCount(cartCount);
		
		mapper.modifyCount(cart);
	}
	*/
	
	
	/*카트 목록*/
	/*
	@Test
	public void getCartTest() {
		String id = "admin";
		
		
		List<CartVO> list = mapper.getCart(id);
		for(CartVO cart : list) {
			System.out.println(cart);
			cart.initSaleTotal();
			System.out.println("total : " + cart);

		}
	}
	*/
	
	/*카트 확인*/
	@Test
	public void checkCartTest() {
		String id = "admin";
		int prodNum = 1;
		
		CartVO cart = new CartVO();
		cart.setId(id);
		cart.setProdNum(prodNum);
		
		
		CartVO resultCart = mapper.checkCart(cart);
		System.out.println("결과 : "+resultCart);
	}
}
