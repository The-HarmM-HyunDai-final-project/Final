package com.theharmm.service;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theharmm.dto.product.Criteria;
import com.theharmm.dto.product.ProductPageDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class ProductServiceTest {
	@Autowired
	private ProductService service;
	
	// 제품 가져오기 test
	@Test
	public void testSelects() {		
		log.info("select test--------------------------------------------");
		ProductPageDTO list = service.getProducts(new Criteria(1,12));
		list.getList().forEach(product -> log.info(product.getPid()));
		log.info("select test2--------------------------------------------");
	}// end test
	
}
