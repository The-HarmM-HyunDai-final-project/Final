package com.theharmm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@ControllerAdvice
public class MemberController {

	@GetMapping("/join")
	public String Join() {
		return "member/join";
	}
		
	@GetMapping("/loginpage")
	public String LoginPage(HttpServletRequest request, Model mode) {
		//로그인 전에 페이지로 돌아가기위한 Referer헤더값(이전 URL)을 세션의 prevPage라는 이름으로 저장
		String uri = request.getHeader("Referer");
		if(uri != null && uri.contains("/loginpage")) {
			request.getSession().setAttribute("prevPage", uri);
		}
		return "member/loginpage";
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public void LoginAction() {
//		
//	}
	
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied, 회원님은 다음등급 입니다. : " + auth );
		
		return "/";
	}

	@GetMapping("/my")
	public String MyPage() {
		return "member/my";
	}
}
