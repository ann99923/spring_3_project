package com.tam.mapper;

import java.util.List;

import com.tam.model.Criteria;
import com.tam.model.MemberVO;

public interface UserListMapper {

	// 유저 리스트
	public List<MemberVO> getList();

	// 유저 리스트 페이징 처리
	public List<MemberVO> getListPaging(Criteria cri);

	// 유저리스트 총 페이지
	public int getTotal();

}
