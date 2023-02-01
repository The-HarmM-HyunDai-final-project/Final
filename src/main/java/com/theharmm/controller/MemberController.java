package com.theharmm.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theharmm.auth.SNSLogin;
import com.theharmm.auth.SnsValue;
import com.theharmm.domain.MemberVO;
import com.theharmm.security.domain.CustomUser;
import com.theharmm.service.MemberService;
import com.theharmm.util.JoinUtil;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@ControllerAdvice
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Inject
	private SnsValue naverSns;
	
	@GetMapping("/join")
	public String Join() {
		return "member/join";
	}
	//이메일 중복확인
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmail(MemberVO member) {
		int cnt = memberService.checkEmail(member);
		return (cnt == 0 ? "true" : "false");
	}
	//닉네임 중복확인
	@RequestMapping(value = "/checkNickName", method = RequestMethod.POST)
	@ResponseBody
	public String checkNickName(MemberVO member) {
		int cnt = memberService.checkNickName(member);
		return (cnt > 0 ? "false" : "true");
	}
	
	@RequestMapping(value="/joinAction", method = RequestMethod.POST)
	public String JoinAction(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String curdate = JoinUtil.builder().build().GetCurDate();// 회원가입한 날짜를 넣기위한 커스텀 유틸 메서드
		
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
			log.warn("회원가입이 제대로 안되었습니다");
			return "member/join";
		}
		
		log.info(request.getParameter("newEmail") + "님 회원가입을 축하드립니다~");
		return "member/loginpage";
	}
	
	@RequestMapping(value = "/{snsService}/callback", method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLoginCallback(@PathVariable String snsService, Model model, @RequestParam String code, HttpSession session) throws Exception {
		SnsValue sns = null;
		if (StringUtils.equals("naver", snsService))
			sns = naverSns;
		log.info("sns 로그인");
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(sns);
		
		MemberVO snsUser = snsLogin.getUserProfile(code); // 1,2번 동시
		System.out.println("Profile>>  " + snsUser);
		
		// 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가)
		MemberVO user = memberService.getBySns(snsUser);
		if (user == null) {
			model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
			//model.addAttribute("url", "/showlive/showlivelist");
			return "member/loginResult";
			//미존재시 가입페이지로!!
		} else {
			model.addAttribute("result", user.getMember_email() + "님 반갑습니다.");
			return "member/loginResult";
			// 4. 존재시 강제로그인
			//session.setAttribute(SessionNames.LOGIN, user);
		}
	}
		
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public String LoginPage(HttpServletRequest request, Model model) {
		//로그인 전에 페이지로 돌아가기위한 Referer헤더값(이전 URL)을 세션의 prevPage라는 이름으로 저장
		String uri = request.getHeader("Referer");
		if(uri != null && uri.contains("/loginpage")) {
			request.getSession().setAttribute("prevPage", uri);
		}
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		return "member/loginpage";
	}
	
	@RequestMapping(value = "/accessError", method = RequestMethod.GET)
	public String accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied, 회원님은 다음등급 입니다: " + auth );
		
		return "/";
	}

	@RequestMapping(value = "/my", method = RequestMethod.GET)
	public String MyPage(Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("member_email", user.getUsername());
		return "member/my";
	}
	
	@RequestMapping(value = "/auction", method = RequestMethod.GET)
	public String Auction(Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("member_email", user.getUsername());
		return "member/auction";
	}
	

}
