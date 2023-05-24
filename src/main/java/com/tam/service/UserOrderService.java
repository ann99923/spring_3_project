package com.tam.service;

import java.util.List;

import com.tam.model.Criteria;
import com.tam.model.CriteriaUser;
import com.tam.model.MemberVO;
import com.tam.model.Order2DTO;
import com.tam.model.OrderDetailDTO;
import com.tam.model.OrderPageItemDTO;
import com.tam.model.Point2DTO;

public interface UserOrderService {

	// 주문 정보
	public List<OrderPageItemDTO> prodInfo(List<OrderPageItemDTO> orders);
	
	// 유저 정보
	public MemberVO userInfo(String id);
	
	// 유저 포인트 정보
	public int userPoint(String id);
	
	// 주문
	public void order(Order2DTO ord);
	
	// 주문 정보 리스트
	public List<Order2DTO> myOrderList(CriteriaUser cri);
	
	// 주문 총 개수
	public int myOrderTotal(CriteriaUser cri);
	
	// 주문 상세정보
	public List<OrderDetailDTO> myOrderDetail(int orderNum);
	
	// 주문 정보
	public Order2DTO myOrder(int orderNum);
}
