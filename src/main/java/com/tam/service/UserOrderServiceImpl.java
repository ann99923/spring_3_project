package com.tam.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.UserOrderMapper;
import com.tam.model.CartVO;
import com.tam.model.Criteria;
import com.tam.model.CriteriaUser;
import com.tam.model.MemberVO;
import com.tam.model.Order2DTO;
import com.tam.model.OrderDetailDTO;
import com.tam.model.OrderPageItemDTO;
import com.tam.model.Point2DTO;
import com.tam.model.ProductVO;

@Service
public class UserOrderServiceImpl implements UserOrderService {
	
	@Autowired
	private UserOrderMapper uoMapper;

	// 주문 상품 정보
	@Override
	public List<OrderPageItemDTO> prodInfo(List<OrderPageItemDTO> orders) {
		// TODO Auto-generated method stub
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord : orders) {
			System.out.println(ord);
			OrderPageItemDTO prodInfo = uoMapper.prodInfo(ord.getProdNum());
			prodInfo.setProdCount(ord.getProdCount());
			prodInfo.initSaleTotal();
			result.add(prodInfo);
		}
		return result;
	}
	
	// 유저 정보
	@Override
	public MemberVO userInfo(String id) {
		// TODO Auto-generated method stub
		return uoMapper.userInfo(id);
	}
	
	// 유저 포인트 정보
	@Override
	public int userPoint(String id) {
		// 사용 가능 포인트
		List<Point2DTO> point = uoMapper.userPoint(id);
		int utPoint = 0;
		for(Point2DTO p : point) {
			utPoint += p.getPoint();
		}
		
		// 사용한 포인트
		List<Point2DTO> point2 = uoMapper.userPoint2(id);
		int utPoint2 = 0;
		for(Point2DTO p : point2) {
			utPoint2 += p.getPoint();
		}
		return utPoint - utPoint2;
	}
	
	// 주문
	@Override
	public void order(Order2DTO ord) {
		// TODO Auto-generated method stub
		
		// 주문 정보
		List<OrderDetailDTO> ords = new ArrayList<>();
		System.out.println("11: " + ord.getOrders());
		for(OrderDetailDTO od : ord.getOrders()) {
			OrderDetailDTO orderDetail = uoMapper.orderInfo(od.getProdNum());
			System.out.println("12: " + orderDetail.getProdPrice());
			// 수량 세팅
			orderDetail.setProdCount(od.getProdCount());
			// 기본정보 세팅
			orderDetail.initSaleTotal();
			// List 객체 추가
			ords.add(orderDetail);
			System.out.println(orderDetail);
		}
		
		// Order2DTO 세팅
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		System.out.println(ord);
		
		// orderId 만들기
		int orId = (int)(Math.random() * 88888) + 11111;
		ord.setOrderNum(orId);
		
		// DB 추가
		uoMapper.enrollUserOrder(ord);		// order 등록
		for(OrderDetailDTO od : ord.getOrders()) {
			od.setOrderNum(orId);
			uoMapper.enrollOrderDetail(od);	// orderDetail 등록
		}
		
		// 포인트 DB 추가
		uoMapper.pointIn(ord);
		uoMapper.pointOut(ord);
		
		// 상품 재고 변동
		for(OrderDetailDTO od : ord.getOrders()) {
			// 변동 재고 값
			ProductVO prod = uoMapper.productInfo(od.getProdNum());
			prod.setStock(prod.getStock() - od.getProdCount());
			
			// 변동 값 적용
			uoMapper.deductStock(prod);
		}
		
		// 장바구니 삭제
		for(OrderDetailDTO od : ord.getOrders()) {
			CartVO cart = new CartVO();
			cart.setId(ord.getId());
			cart.setProdNum(od.getProdNum());
			
			uoMapper.deleteCart(cart);
		}
	}
	
	// myOrder
	
	// 주문 정보 리스트
	@Override
	public List<Order2DTO> myOrderList(CriteriaUser cri) {
		// TODO Auto-generated method stub
		return uoMapper.myOrderList(cri);
	}

	// 주문 총 개수
	@Override
	public int myOrderTotal(CriteriaUser cri) {
		// TODO Auto-generated method stub
		return uoMapper.myOrderTotal(cri);
	}
	
	// 주문 상세정보
	@Override
	public List<OrderDetailDTO> myOrderDetail(int orderNum) {
		// TODO Auto-generated method stub
		return uoMapper.myOrderDetail(orderNum);
	}
	
	// 주문 정보
	@Override
	public Order2DTO myOrder(int orderNum) {
		// TODO Auto-generated method stub
		return uoMapper.myOrder(orderNum);
	}
	
	// 주문 취소처리
	@Override
	public int cancelMyOrder(int orderNum) {
		// TODO Auto-generated method stub
		return uoMapper.cancelMyOrder(orderNum);
		
	}
}
