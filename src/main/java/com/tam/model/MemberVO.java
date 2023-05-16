package com.tam.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;			// 아이디
	private String pw;			// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private Date birth;			// 생년월일
	private String post;		// 우편번호
	private String addr1;		// 주소1
	private String addr2;		// 주소2
	private String tel;			// 전화번호
	private int adminCk;		// 관리자여부

}
