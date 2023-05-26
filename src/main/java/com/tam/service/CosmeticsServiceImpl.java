package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.CosmeticsMapper;
import com.tam.model.CateCriteria;
import com.tam.model.CateVO;
import com.tam.model.CosmeticsVO;
import com.tam.model.Criteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CosmeticsServiceImpl implements CosmeticsService {

	@Autowired
	private CosmeticsMapper cosMapper;

	/* 상품 검색 */
	@Override
	public List<CosmeticsVO> getProdList(CateCriteria ccri) {

		log.info("getProdList().......");

		return cosMapper.getProdList(ccri);
	}

	/* 상품 총 갯수 */
	@Override
	public int prodGetTotal(CateCriteria ccri) {

		log.info("prodGetTotal().......");

		return cosMapper.prodGetTotal(ccri);
	}

	/* 기초 카테고리 */
	@Override
	public List<CateVO> getCateCode1() {

		log.info("getCateCode1().........");

		return cosMapper.getCateCode1();
	}

	/* 색조 카테고리 */
	@Override
	public List<CateVO> getCateCode2() {

		log.info("getCateCode2().........");

		return cosMapper.getCateCode2();
	}

	/* 향수 카테고리 */
	@Override
	public List<CateVO> getCateCode3() {

		log.info("getCateCode3().........");

		return cosMapper.getCateCode3();
	}

	/* 도구 카테고리 */
	@Override
	public List<CateVO> getCateCode4() {

		log.info("getCateCode4().........");

		return cosMapper.getCateCode4();
	}

}
