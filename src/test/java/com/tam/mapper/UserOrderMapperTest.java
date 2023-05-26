package com.tam.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tam.mapper.UserOrderMapper;
import com.tam.model.CartVO;
import com.tam.model.Order2DTO;
import com.tam.model.OrderDetailDTO;
import com.tam.model.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserOrderMapperTest {

	@Autowired
	private UserOrderMapper mapper;
	
	// 주문 테이블 등록
	@Test
	public void enrollUserOrderTest() {
		Order2DTO ord = new Order2DTO();
		List<OrderDetailDTO> orders = new ArrayList<>();
		
		OrderDetailDTO order1 = new OrderDetailDTO();
		
		order1.setProdNum(1);
		order1.setProdCount(1);
		order1.setProdPrice(40000);
		order1.initSaleTotal();
		orders.add(order1);
		
		ord.setOrders(orders);
		
		ord.setId("111");
		ord.setOrderPay("카카오페이");
		ord.setOrderRecv("수령인");
		ord.setOrderPost("123456");
		ord.setOrderAddr1("주소1");
		ord.setOrderAddr2("주소2");
		ord.setOrderMsg("메시지");
		ord.setOrderPointOut(10000);
		ord.getOrderPriceInfo();
		
		mapper.enrollUserOrder(ord);	
	}
	
	// 주문 상세 테이블 등록
//	@Test
//	public void enrollOrderDetailTest() {
//		OrderDetailDTO od = new OrderDetailDTO();
//		
//		od.setOrderNum(1);
//		od.setProdNum(1);
//		od.setProdCount(2);
//		od.setProdPrice(10000);
//		od.initSaleTotal();
//		
//		mapper.enrollOrderDetail(od);
//	}
	
	// 포인트 적립
//	@Test
//	public void pointInTest() {
//		Order2DTO ord = new Order2DTO();
//		List<OrderDetailDTO> orders = new ArrayList<>();
//		
//		OrderDetailDTO order1 = new OrderDetailDTO();
//		
//		order1.setProdNum(1);
//		order1.setProdCount(1);
//		order1.setProdPrice(40000);
//		order1.initSaleTotal();
//		orders.add(order1);
//		
//		ord.setOrders(orders);
//		
//		ord.setId("111");
//		ord.getOrderPriceInfo();
//		
//		mapper.pointIn(ord);
//	}
	
	// 포인트 차감
//	@Test
//	public void pointOutTest() {
//		Order2DTO ord = new Order2DTO();
//		
//		ord.setId("111");
//		ord.setOrderPointOut(5000);
//		
//		mapper.pointOut(ord);
//	}
	
	// 장바구니 삭제
//	@Test
//	public void deleteCartTest() {
//		String id = "111";
//		
//		mapper.deleteCart(id);
//	}
	
	// 주문 재고 차감
//	@Test
//	public void deductStock() {
//		ProductVO prod = new ProductVO();
//		
//		prod.setProdNum(1);
//		prod.setStock(1);
//		
//		mapper.deductStock(prod);
//	}
	
}
