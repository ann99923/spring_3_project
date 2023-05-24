package com.tam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.JoinMapper;
import com.tam.model.MemberVO;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	JoinMapper joinMapper;

	// 회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		joinMapper.memberJoin(member);	
	}
	
	// 아이디 중복검사
	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return joinMapper.idCheck(id);
	}

}
