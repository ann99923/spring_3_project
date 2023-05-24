package com.tam.mapper;

import java.util.List;

import com.tam.model.Criteria;
import com.tam.model.OrderVO;

public interface OrderMapper {
	// 관리자 주문 목록
	public List<OrderVO> pagingList(Criteria cri);
	
	// 주문 상태 업데이트
	public int updateOrder(OrderVO oVo);
	
	// 주문 조회
	public OrderVO readOrder(int orderNum);

	// 주문 총 갯수 + 검색 기능
	public int searchOrder(Criteria cri);
}
