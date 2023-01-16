package com.theharmm.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.theharmm.domain.PostVO;
import com.theharmm.domain.SocialVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class PostEnrollTest {

	@Autowired
	private PostMapper mapper;

	@Test
	public void postenrolltest() {
		PostVO post = new PostVO();

		post.setMember_email("asd@naver.com");


		// 이미지 정보
		List<SocialVO> socialList = new ArrayList<SocialVO>();

		SocialVO social1 = new SocialVO();
		SocialVO social2 = new SocialVO();

		social1.setFile_name("test social 1");
		social1.setUpload_path("test social 1");
		social1.setUuid("test1111");

		social2.setFile_name("test social 2");
		social2.setUpload_path("test social 2");
		social2.setUuid("test2222");

		socialList.add(social1);
		socialList.add(social2);

		post.setSocialList(socialList);

		mapper.postEnroll(post);
		
		System.out.println("등록된 VO : " + post);
	}
}