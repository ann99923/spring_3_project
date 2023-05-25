package com.tam.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tam.model.Criteria;
import com.tam.model.PageMakerDTO;
import com.tam.service.UserListService;

@Controller
@RequestMapping("/user")
public class UserListController {

	private static final Logger log = org.slf4j.LoggerFactory.getLogger(UserListController.class);

	@Autowired
	private UserListService aservice;

	@GetMapping("/userList")
	public void userListGET(Model model, Criteria cri) {
		log.info("유저 리스트 진입");

		model.addAttribute("list", aservice.getListPaging(cri));

		int total = aservice.getTotal();

		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		
		model.addAttribute("pageMaker", pageMake);
	}
}
