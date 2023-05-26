package com.tam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.MemberVO;
import com.tam.service.LoginService;


@Controller
@RequestMapping(value="/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService LoginService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//로그인페이지 이동
	@GetMapping("/login")
	public void loginGET() {
		logger.info("로그인 페이지 진입");
	}
	
	/* 로그인 */
	@PostMapping("/login")
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw ="";
		
		MemberVO lvo = LoginService.memberLogin(member);
		logger.info(""+lvo);
		
		 if(lvo != null) {       // 일치하지 않는 아이디, 비밀번호 입력 경우
	         rawPw = member.getPw(); //사용자가 제출한 비밀번호
			encodePw = lvo.getPw(); //db에 저장된 암호화(인코딩)된 비밀번호
				
				if(true == pwEncoder.matches(rawPw, encodePw)) {
					lvo.setPw("");
					session.setAttribute("member", lvo);
					return "redirect:/main";
				}else {
					rttr.addFlashAttribute("result", 0);
					return "redirect:/login/login";
				}
				
			}else { //일치하는 아이디가 없을때 로그인 실패 시
				rttr.addFlashAttribute("result", 0);
				return "redirect:/login/login"; //로그인 페이지로 이동
			}
		}
	
	 /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";        
        
}
}