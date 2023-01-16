package com.theharmm.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.theharmm.dto.product.Criteria;
import com.theharmm.dto.product.ProductDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest {
	@Autowired
	private ProductMapper mapper;
	
	@Test
	public void selectTest() {
		Criteria cri = new Criteria();
		cri.setAmount(12);
		cri.setPageNum(1);
		cri.setType("BSC");
		cri.setBkeyword("Adidas,Prada");
		cri.setSsize("240,250");
		cri.setCkeyword(2);
		
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri",cri);
		
		List<ProductDTO> list = mapper.selectProducts(categoryPager);
		list.forEach( i -> log.info( i));
	}
	
	@Test
	public void countTest() {
		Criteria cri = new Criteria();
		cri.setAmount(12);
		cri.setPageNum(1);
		
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri",cri);
		
		int count = mapper.countProducts(categoryPager);
		log.info(count);
	}
}
