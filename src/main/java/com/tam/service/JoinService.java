package com.tam.service;

import com.tam.model.MemberVO;

public interface JoinService {
	
	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	// 아이디 중복검사
	public int idCheck(String id) throws Exception;

}
