package com.tam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.ProductVO;
import com.tam.model.Criteria;
import com.tam.model.PageMakerDTO;
import com.tam.service.ProductService;

@Controller
@RequestMapping("/admin/*")
public class ProductController {
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService pService;
	
	//메인 페이지
	@GetMapping("/main")
	public void mainPageGET(Model model) {
		log.info("메인 페이지 진입");
	}
	
	//상품 목록 + 페이징
	@GetMapping("/list")
	public void adminListGET(Model model, Criteria cri) {
		log.info("상품 목록 페이지 진입");
		model.addAttribute("list", pService.pagingList(cri));
		int total = pService.searchProd(cri);
		PageMakerDTO pDto = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pDto);
	}
	
	//상품 등록
	@GetMapping("/create")
	public void adminCreateGET() {
		log.info("상품 등록 페이지 진입");
	}
	
	@PostMapping("/create")
	public String adminCreatePOST(ProductVO pVo, RedirectAttributes rttr) {
		log.info("ProductVO : "+pVo);
		pService.createProd(pVo);
		rttr.addFlashAttribute("result", "등록 성공");
		
		return "redirect:/admin/list";
	}
	
	//상품 조회
	@GetMapping("/read")
	public void adminReadGET(int pno, RedirectAttributes rttr, Model model) {
		log.info("상품 조회 페이지 진입");
		model.addAttribute("pageInfo", pService.readProd(pno));
		rttr.addFlashAttribute("result", "조회 성공");
	}
	
	//상품 수정					
	@GetMapping("/update")
	public void adminUpdateGET(int prodNum, Model model) {
		log.info("상품 목록 수정 페이지 진입");
		model.addAttribute("pageInfo", pService.readProd(prodNum));
	}
	
	@PostMapping("/update")
	public String adminUpdatePOST(ProductVO pVo, RedirectAttributes rttr) {
		pService.updateProd(pVo);		
		rttr.addFlashAttribute("result" ,"수정 성공");
		
		return "redirect:/admin/list";
	}
	
	//상품 삭제
	@PostMapping("/delete")
	public String adminDeleteGET(int prodNum, RedirectAttributes rttr) {
		pService.deleteProd(prodNum);
		rttr.addFlashAttribute("result", "삭제 성공");
		return "redirect:/admin/list";
	}
	
}
