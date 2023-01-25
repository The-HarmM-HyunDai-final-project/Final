package com.theharmm.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theharmm.domain.ReplyDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTest {
	
	@Autowired
	public ReplyService service;
	// 제품 가져오기 test
	@Test
	public void testSelects() {
		List<ReplyDTO> list = service.getReplyList(138);
		list.forEach(i -> log.info(i));
	}
}
