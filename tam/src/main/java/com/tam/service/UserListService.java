package com.tam.service;

import java.util.List;

import com.tam.model.Criteria;
import com.tam.model.MemberVO;

public interface UserListService {

	public List<MemberVO> getList();

	// �Խ��� ���(����¡ ����)
	public List<MemberVO> getListPaging(Criteria cri);

	// �Խ��� �� ����
	public int getTotal();
}
