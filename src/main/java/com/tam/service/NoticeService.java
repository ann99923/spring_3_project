package com.tam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tam.model.Criteria;
import com.tam.model.NoticeVO;
@Service
public interface NoticeService {
	// 게시글 전체 조회 - 페이징
		public List<NoticeVO> selectAll(Criteria cri) throws Exception;
		// 전체 게시글 수 - 페이징
		public int selectCount(Criteria cri) throws Exception;
		// 게시글 하나 조회
		public NoticeVO selectOne(int noticeNum) throws Exception;
		// 게시글 등록
		public void postNotice(NoticeVO nVo) throws Exception;
		// 게시글 삭제
		public int deleteNotice(int noticeNum) throws Exception; 
		// 게시글 수정
		public int updateNotice(NoticeVO nVo) throws Exception;
}
