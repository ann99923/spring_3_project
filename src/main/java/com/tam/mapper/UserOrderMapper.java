package com.tam.mapper;

import java.util.List;

import com.tam.model.CartVO;
import com.tam.model.Criteria;
import com.tam.model.CriteriaUser;
import com.tam.model.MemberVO;
import com.tam.model.Order2DTO;
import com.tam.model.OrderDetailDTO;
import com.tam.model.OrderPageItemDTO;
import com.tam.model.Point2DTO;
import com.tam.model.ProductVO;

public interface UserOrderMapper {
	
	// 주문 상품 정보(주문 페이지)
	public OrderPageItemDTO prodInfo(int bookId);
	
	// 유저 정보
	public MemberVO userInfo(String id);
	
	// 유저 포인트 정보
	public List<Point2DTO> userPoint(String id);	// 사용가능 포인트
	public List<Point2DTO> userPoint2(String id);	// 사용한 포인트
	
	//-----------------------------------------------
	
	// 주문 상품 정보(주문 처리)
	public OrderDetailDTO orderInfo(int prodNum);
	
	// 주문 테이블 등록
	public int enrollUserOrder(Order2DTO ord);
	
	// 주문 상세 테이블 등록
	public int enrollOrderDetail(OrderDetailDTO od);
	
	// 포인트 적립
	public int pointIn(Order2DTO ord);
	
	// 포인트 차감
	public int pointOut(Order2DTO ord);

	// 장바구니 삭제
	public void deleteCart(CartVO cart);
	
	// 주문 재고 차감
	public int deductStock(ProductVO prod);
	
	// 상품 정보
	public ProductVO productInfo(int prodNum);
	
	// ---------------------------------------------
	
	// 주문 정보 리스트
	public List<Order2DTO> myOrderList(CriteriaUser cri);
	
	// 주문 총 개수
	public int myOrderTotal(CriteriaUser cri);
	
	// 주문 상세 정보
	public List<OrderDetailDTO> myOrderDetail(int orderNum);
	
	// 주문 정보
	public Order2DTO myOrder(int orderNum);
}
