package com.tam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tam.model.CaptchaUtil;
import com.tam.model.MemberVO;
import com.tam.service.LoginService;
import com.tam.service.MyPageService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MyPageService mpService;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@GetMapping("/loginConfirm")
	public void loginConfirmGET() {
		log.info("재로그인 페이지 진입");
	}
	// 재로그인
	@PostMapping("/loginConfirm")
	public String loginPOST(HttpServletRequest request, MemberVO mVo, RedirectAttributes rttr) throws Exception {		
		log.info("로그인 method 진입");
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		MemberVO mVo2 = loginService.memberLogin(mVo);

		if (mVo2 != null) {// 아이디 비밀번호 일치(로그인 성공시)
			rawPw = mVo.getPw(); // 사용자가 제출한 비밀번호
			encodePw = mVo2.getPw(); // DB에 있는 인코딩된 비밀번호
			if (true == pwEncoder.matches(rawPw, encodePw)) {
				// mVo2.setPw(""); 이유가 뭘까?
				session.setAttribute("member", mVo2);
				return "redirect:/mypage/updateMyPage";
			} else { // 비밀번호가 불일치시
				rttr.addFlashAttribute("result", 0);
				return "redirect:/mypage/loginConfirm";
			}
		} else { // 아이디 비밀번호 불일치시
			rttr.addFlashAttribute("result", 0);
			return "redirect:/mypage/loginConfirm";
		}
	}

	@GetMapping("/updateMyPage")
	public void updateMyPageGET() {
		log.info("회원정보수정 페이지 진입");
	}
	// 회원 정보 수정(비밀번호 제외)
	@PostMapping("/updateMyPage")
	public String updateMyPagePOST(HttpServletRequest request, MemberVO mVo, RedirectAttributes rttr) throws Exception {
		log.info("update 시작");
		String rawPw = "";
		String encodePw = "";
		// MemberVO mVo2 = mService.memberLogin(mVo);
		rawPw = mVo.getPw();
		encodePw = pwEncoder.encode(rawPw);
		mVo.setPw(encodePw);
		mpService.updateMyPage(mVo);
		return "redirect:/mypage/loginConfirm";
	}

	@GetMapping("/secessionConfirm")
	public void secessionGET() {
		log.info("회원 탈퇴 페이지 진입");
	}

	// 회원 탈퇴
	@PostMapping("/secessionConfirm")
	public String secessionPOST(HttpServletRequest request, MemberVO mVo, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");
		MemberVO mVo2 = loginService.memberLogin(mVo);

		if (mVo2 != null) {// 아이디 비밀번호 일치(로그인 성공시)
			rawPw = mVo.getPw(); // 사용자가 제출한 비밀번호
			encodePw = mVo2.getPw(); // DB에 있는 인코딩된 비밀번호
			if (true == pwEncoder.matches(rawPw, encodePw)) {
				if (getAnswer.equals(answer)) {
					mpService.secession(mVo2.getId());
					session.invalidate();
					request.setAttribute("msg", "이용해주셔서 감사합니다");
					return "/mypage/alert";
				} else {
					rttr.addFlashAttribute("result", "자동 방지 문자 틀림");
					return "redirect:/mypage/secessionConfirm";
				}

				// mVo2.setPw("");
				// mService.secession(mVo2.getId());
				// session.invalidate();
				// request.setAttribute("msg", "이용해주셔서 감사합니다");
				// return "/mypage/alert";
			} else { // 비밀번호가 불일치시
				rttr.addFlashAttribute("result", "비밀 번호 틀림");
				return "redirect:/mypage/secessionConfirm";
			}
		}
		return "redirect:/member/join";
	}
	// 자동방지문자 이미지
	@RequestMapping(value = "captchaImg.do")
	public void cpatchaImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		new CaptchaUtil().captchaImg(request, response);
	}
	// 자동방지문자 오디오
	@RequestMapping(value = "captchaAudio.do")
	public void cpatchaAudio(HttpServletRequest request, HttpServletResponse response) throws Exception {
		new CaptchaUtil().captchaAudio(request, response);
	}

	// 비밀번호 확인 처리 요청
	@PostMapping("/pwCheck")
	@ResponseBody
	public String checkPw(String pw, HttpSession session) throws Exception {

		log.info("비밀번호 확인 요청 발생");

		String result = null;

		MemberVO mVo = (MemberVO) session.getAttribute("member");

		log.info("DB 회원의 비밀번호 : " + mVo.getPw());
		log.info("폼에서 받아온 비밀번호 : " + pw);

		if (pwEncoder.matches(pw, mVo.getPw())) {
			result = "ok";
		} else {
			result = "fail";
		}
		return result;

	}

	// 비밀번호 변경 요청
	@PostMapping("/pwChange")
    @ResponseBody
    public String pwChange(MemberVO mVo, HttpSession session) throws Exception {
    	
    	log.info("비밀번호 변경 요청 발생");
    	
    	//비밀번호 변경
    	mpService.pwChange(mVo);
    	
    	//비밀번호 변경 성공시 로그인 세션 객체 다시 담음    	
    	loginService.memberLogin(mVo);
    	
    	log.info("회원정보 불러오기 : " + mVo);
    	session.setAttribute("member", mVo);
    	
    	return "changeSuccess";
    }
	
	@PostMapping("/new_pwCheck")
	@ResponseBody
	public String new_pwCheck(String new_pw, String new_pwck) throws Exception {
		String result = null;
		if (new_pw.equals(null)) {
			result = "null";
		} else if (!new_pw.equals(new_pwck)) {
			result = "not_eq";
		} else {
			result = "eq";
		}
		return result;
	}

}
