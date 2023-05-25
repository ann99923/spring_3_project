package com.tam.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noticeNum;			// 글번호
	private String noticeTitle;		// 글제목
	private String noticeContent;	// 글내용
	private Date postDate;			// 등록일

}
