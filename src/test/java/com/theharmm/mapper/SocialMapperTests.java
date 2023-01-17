package com.theharmm.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.theharmm.domain.SocialVO;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class SocialMapperTests {
	
	@Autowired
	private SocialMapper mapper;
	
	/* 이미지 등록 */
	@Test
	public void socialEnrollTest() {
		
		SocialVO vo = new SocialVO();
		
		vo.setPost_id(1);
		vo.setFile_name("test4");
		vo.setUpload_path("test5");
		vo.setUuid("test6");
		
		mapper.socialEnroll(vo);
		
	}
}