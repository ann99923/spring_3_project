package com.tam.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tam.model.CartVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartServiceTest {
	
	@Autowired
	private CartService service;
	
	//등록 테스트
		@Test
		public void addCartTest() {
			//given
				String id = "admin";
				int prodNum = 22;
				int cartCount = 5;
				
				CartVO vo = new CartVO(); 
				
				vo.setId(id);
				vo.setProdNum(prodNum);
				vo.setCartCount(cartCount);
				
			
			//when
				int result = service.addCart(vo);
			
			//then
				System.out.println("** result : " + result);
			
			
		}
	
}
