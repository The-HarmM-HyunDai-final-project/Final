package com.theharmm.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.theharmm.service.MemberService;
import com.theharmm.domain.AuthVO;
import com.theharmm.domain.MemberVO;
import com.theharmm.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void Join() throws Exception{
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		String password = scpwd.encode("asd");
		
		log.warn("---------------------pw------------" + password);
		
		MemberVO member = new MemberVO();
		member.setMember_email("asd@naver.com");
		member.setMember_password(password);
		member.setMember_name("박여명");
		member.setMember_nickname("여띵");
		member.setMember_phone("01040818409");
		member.setMember_shoes_size(275);
		member.setMember_register("2020-01-01");
		member.setMember_login("2020-01-01");
		member.setMember_messege_info("이건 뭐하는 컬럼이야");
		member.setMember_email_info("이건 뭐하는 컬럼이야");
		
		AuthVO auth = new AuthVO();
		auth.setUsername("asd");
		auth.setAuthority("ROLE_MEMBER");
		
		mapper.joinMember(member);
		mapper.joinMemberAuthority(auth);
	}
	
	//@Test
	public void Login() throws Exception{
		MemberVO member = new MemberVO();
		member.setMember_email("asd");
		member.setMember_password("asd");
		
		MemberVO member2 = mapper.login(member);
		log.info(member2.toString());
		
	}
	
	//@Test
	public void Read() throws Exception{
		MemberVO member = new MemberVO();
		member.setMember_email("asd");
		
		MemberVO member2 = mapper.read(member);
		member2.getAuthList().forEach(authVO -> log.info(authVO));
	}
}
