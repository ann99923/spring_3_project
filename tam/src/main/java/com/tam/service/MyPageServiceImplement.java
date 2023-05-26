package com.tam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.tam.mapper.MyPageMapper;
import com.tam.model.MemberVO;

@Service
public class MyPageServiceImplement implements MyPageService{
	@Autowired
	private MyPageMapper mpMapper;
	@Override
	public void secession(String id) throws Exception {
		mpMapper.secession(id);
	}
	@Override
	public int updateMyPage(MemberVO mVo) throws Exception {
		return mpMapper.updateMyPage(mVo);
	} 
	@Override
	public int pwCheck(String pw) throws Exception {
		return mpMapper.pwCheck(pw);
	}
	@Override
	public void pwChange(MemberVO mVo) throws Exception {
		//회원 비밀번호를 인코딩하기 위해 객체 선언
		BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전 비밀번호 : " + mVo.getPw());

		//회원 비밀번호를 암호화하여 user객체에 다시 저장
		String encodePw = pwEncoder.encode(mVo.getPw());
		mVo.setPw(encodePw);
		
		System.out.println("암호화 후 비밀번호 : " + mVo.getPw());
		
		mpMapper.pwChange(mVo);
	} 
}
