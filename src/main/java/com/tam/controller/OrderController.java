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

import com.tam.model.Criteria;
import com.tam.model.OrderVO;
import com.tam.model.PageMakerDTO;
import com.tam.service.OrderService;

@Controller
@RequestMapping("/adminOrder/*")
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService oService;
	
	// 주문 목록
	@GetMapping("/orderList")
	public void adminOrderListGET(Model model,Criteria cri) {		
		log.info("주문 목록 페이지 진입");
		model.addAttribute("olist", oService.pagingList(cri));
		int total = oService.searchOrder(cri);
		PageMakerDTO pDto = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pDto);
	}
	
	// 주문 상세 페이지
	@GetMapping("/orderDetail")
	public void adminOrderDetailGET(int orderNum, Model model, RedirectAttributes rttr) {
		log.info("주문 목록 상세 페이지 진입");
		model.addAttribute("olist", oService.readOrder(orderNum));
		rttr.addFlashAttribute("result", "조회 성공"); 
	}
	
	// 주문 상태 수정
	@GetMapping("/orderUpdate")
	public void adminOrderUpdateGET(int orderNum, Model model) {
		String num = Integer.toString(orderNum);
		log.info(num);
		log.info("주문 상태 수정 페이지 진입");
		model.addAttribute("olist", oService.readOrder(orderNum));
	}
	
	@PostMapping("/orderUpdate")
	public String adminOrderUpdatePOST(OrderVO oVo, RedirectAttributes rttr) {
		log.info("update 시작");
		oService.updateOrder(oVo);
		log.info(oVo.getOrderStatus());
		rttr.addFlashAttribute("result", "수정 성공");
		
		return "redirect:/adminOrder/orderList";
	}
	
}
