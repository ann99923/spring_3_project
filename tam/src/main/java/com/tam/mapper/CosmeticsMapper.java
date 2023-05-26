package com.tam.mapper;

import java.util.List;

import com.tam.model.CateVO;
import com.tam.model.CosmeticsVO;
import com.tam.model.Criteria;

public interface CosmeticsMapper {

	/* 상품 검색 */
	public List<CosmeticsVO> getProdList(Criteria cri);

	/* 상품 총 갯수 */
	public int prodGetTotal(Criteria cri);

	/* 기초 카테고리 리스트 */
	public List<CateVO> getCateCode1();

	/* 색조 카테고리 리스트 */
	public List<CateVO> getCateCode2();
	
	/* 향수 카테고리 리스트 */
	public List<CateVO> getCateCode3();
	
	/* 화장도구 카테고리 리스트 */
	public List<CateVO> getCateCode4();

}
