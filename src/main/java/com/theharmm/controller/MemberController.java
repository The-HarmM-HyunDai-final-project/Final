package com.theharmm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.domain.MemberVO;
import com.theharmm.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@ControllerAdvice
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/join")
	public String Join() {
		return "member/join";
	}
	//�̸��� �ߺ�Ȯ��
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmail(MemberVO member) {
		int cnt = memberService.checkEmail(member);
		return (cnt == 0 ? "true" : "false");
	}
	//�г��� �ߺ�Ȯ��
	@RequestMapping(value = "/checkNickName", method = RequestMethod.POST)
	@ResponseBody
	public String checkNickName(MemberVO member) {
		int cnt = memberService.checkNickName(member);
		return (cnt > 0 ? "false" : "true");
	}
		
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public String LoginPage(HttpServletRequest request, Model mode) {
		//�α��� ���� �������� ���ư������� Referer�����(���� URL)�� ������ prevPage��� �̸����� ����
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
	
	@RequestMapping(value = "/accessError", method = RequestMethod.GET)
	public String accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied, ȸ������ ������� �Դϴ�. : " + auth );
		
		return "/";
	}

	@RequestMapping(value = "/my", method = RequestMethod.GET)
	public String MyPage() {
		return "member/my";
	}
}
