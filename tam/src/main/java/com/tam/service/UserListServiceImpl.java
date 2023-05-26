package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.UserListMapper;
import com.tam.model.Criteria;
import com.tam.model.MemberVO;

@Service
public class UserListServiceImpl implements UserListService {

	@Autowired
	private UserListMapper mapper;

	@Override
	public List<MemberVO> getList() {

		return mapper.getList();
	}

	@Override
	public List<MemberVO> getListPaging(Criteria cri) {

		return mapper.getListPaging(cri);
	}

	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}
}
