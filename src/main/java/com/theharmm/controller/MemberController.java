package com.theharmm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.domain.MemberAuthVO;
import com.theharmm.domain.MemberVO;
import com.theharmm.service.MemberService;
import com.theharmm.util.JoinUtil;

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
	
	@RequestMapping(value="/joinAction", method = RequestMethod.POST)
	public String JoinAction(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String curdate = JoinUtil.builder().build().GetCurDate();// ȸ�������� ��¥�� �ֱ����� Ŀ���� ��ƿ �޼���
		
		member.setMember_email(request.getParameter("newEmail")); 
		member.setMember_password(request.getParameter("newPwd"));
		member.setMember_name(request.getParameter("newName"));
		member.setMember_nickname(request.getParameter("newNickName"));
		member.setMember_phone(request.getParameter("newPhone"));
		member.setMember_shoes_size(Integer.parseInt(request.getParameter("newShoes")));
		member.setMember_register(curdate);
		member.setMember_login(curdate);
		member.setMember_messege_info("true");
		member.setMember_email_info("true");
		//pw ��ȣȭ
		String password = scpwd.encode(member.getMember_password());
		member.setMember_password(password);
		
		log.warn(member.toString());
		
		int result = memberService.joinMember(member);

		if(result < 2) {
			log.warn("ȸ�������� ����� �ȵǾ����ϴ�!!!");
			return "member/join";
		}
		
		log.info(request.getParameter("newEmail") + "�� ȸ�������� ���ϵ帳�ϴ�~");
		return "member/loginpage";
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
