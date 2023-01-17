package com.theharmm.comtroller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.experimental.Wither;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
	})
@Log4j
public class MemberControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}//end setup
	
	//email check 테스트
	//@Test
	public void EmailCheck() throws Exception {

		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/checkEmail")		
				.param("member_email", "asd")
			)
			.andReturn()
		);
	}
	//NickName Check 테스트
	@Test
	public void NickNameCheck() throws Exception {

		log.info(
			mockMvc.perform(
				MockMvcRequestBuilders.post("/member/checkNickName")		
				.param("member_nickname", "여띵")
			)
			.andReturn()
		);
	}
	
}
