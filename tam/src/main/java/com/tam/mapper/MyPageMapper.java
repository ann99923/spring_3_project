package com.tam.mapper;

import com.tam.model.MemberVO;

public interface MyPageMapper {
	//회원 탈퇴
	public void secession(String id);
	//회원 정보 수정
	public int updateMyPage(MemberVO mVo);
	//비밀번호 중복검사
	public int pwCheck(String pw);
	//비밀번호 변경
	public void pwChange(MemberVO mVo);
} 
