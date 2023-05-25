package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.ProductMapper;
import com.tam.model.ProductVO;
import com.tam.model.Criteria;

@Service
public class ProductServiceImplement implements ProductService {
	@Autowired
	private ProductMapper pMapper;
	
	@Override
	public List<ProductVO> pagingList(Criteria cri) {
		return pMapper.pagingList(cri);
	}

	@Override
	public void createProd(ProductVO pVo) {
		pMapper.createProd(pVo);
	}

	@Override
	public ProductVO readProd(int pno) {
		return pMapper.readProd(pno);
	}

	@Override
	public int updateProd(ProductVO pVo) {
		return pMapper.updateProd(pVo);
	}

	@Override
	public int deleteProd(int pno) {
		return pMapper.deleteProd(pno);
	}

	@Override
	public int searchProd(Criteria cri) {
		return pMapper.searchProd(cri);
	}
	
}
