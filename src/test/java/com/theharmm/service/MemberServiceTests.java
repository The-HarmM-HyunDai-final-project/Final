package com.theharmm.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;
import com.theharmm.service.MemberService;
import com.theharmm.service.MemberServiceTests;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
	})
@Log4j
public class MemberServiceTests {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private MemberService service;
	
	//이메일 중복확인
	//@Test
	public void checkEmail() throws Exception{
		MemberVO member = new MemberVO();
		member.setMember_email("asd");
		
		log.info(" 이메일은 중복? :" + service.checkEmail(member));
	}
	
	//닉네임 중복확인
	@Test
	public void checkNickName() throws Exception{
		MemberVO member = new MemberVO();
		member.setMember_nickname("여띵");
		
		log.info(" 닉네임 중복? :" + service.checkNickName(member));
	}
	
	//@Test
	public void Join() throws Exception{
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String password = scpwd.encode("asd");
		
		MemberVO member = new MemberVO();
		member.setMember_email("asd");
		member.setMember_password(password);
		member.setMember_name("박여명");
		member.setMember_nickname("여띵");
		member.setMember_phone("01040818409");
		member.setMember_shoes_size(275);
		member.setMember_register("2020/01/01");
		member.setMember_login("2020/01/01");
		member.setMember_messege_info("이건 뭐하는 컬럼이야");
		member.setMember_email_info("이건 뭐하는 컬럼이야");
		
		service.joinMember(member);
	}
	
}
