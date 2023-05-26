package com.tam.service;

import com.tam.model.MemberVO;

public interface MyPageService {
	//회원 탈퇴
	public void secession(String id) throws Exception;
	//회원 정보 수정
	public int updateMyPage(MemberVO mVo) throws Exception;	
	//비밀번호 중복검사
	public int pwCheck(String pw) throws Exception;
	//비밀번호 변경
	public void pwChange(MemberVO mVo) throws Exception; 
}
