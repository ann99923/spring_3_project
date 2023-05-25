package com.tam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tam.model.CosmeticsVO;
import com.tam.model.Criteria;
import com.tam.model.PageDTO;
import com.tam.service.CosmeticsService;

@Controller
public class CosmeticsController {

	private static final Logger logger = LoggerFactory.getLogger(UserCateController.class);

	@Autowired
	private CosmeticsService cosService;

	// 메인 페이지
	@GetMapping("/cosmeticsMain")
	public void mainGET(Model model) throws Exception {

		logger.info("메인 페이지 접속");

		model.addAttribute("cate1", cosService.getCateCode1());
		model.addAttribute("cate2", cosService.getCateCode2());
		model.addAttribute("cate3", cosService.getCateCode3());
		model.addAttribute("cate4", cosService.getCateCode4());

	}

	// 상품 검색
	@GetMapping("cosmeticsCate")
	public String searchProdGET(Criteria cri, Model model) {

		logger.info("cri : " + cri);

		List<CosmeticsVO> list = cosService.getProdList(cri);

		logger.info("pre list : " + list);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);

		} else {
			model.addAttribute("listcheck", "empty");

			return "cosmeticsCate";

		}

		model.addAttribute("pageMaker", new PageDTO(cri, cosService.prodGetTotal(cri)));

		return "cosmeticsCate";

	}

}
