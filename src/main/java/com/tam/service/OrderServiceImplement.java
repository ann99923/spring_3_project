package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.OrderMapper;
import com.tam.model.Criteria;
import com.tam.model.OrderVO;

@Service
public class OrderServiceImplement implements OrderService {
	@Autowired
	private OrderMapper oMapper;

	@Override
	public List<OrderVO> pagingList(Criteria cri) {
		return oMapper.pagingList(cri);
	}

	@Override
	public int updateOrder(OrderVO oVo) {
		return oMapper.updateOrder(oVo);
	}

	@Override
	public OrderVO readOrder(int ono) {
		return oMapper.readOrder(ono);
	}

	@Override
	public int searchOrder(Criteria cri) {
		return oMapper.searchOrder(cri);
	}
	
	
}
