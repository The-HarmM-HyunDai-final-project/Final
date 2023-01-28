package com.theharmm.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.theharmm.domain.Criteria;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.ProductPageDTO;
import com.theharmm.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductService {
	private ProductMapper mapper;
	
	// 필터링 적용 후 데이터 가져오기
	public ProductPageDTO getProducts(Criteria cri) {
		log.info("getListPageService.............." + cri);
		HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		categoryPager.put("cri", cri);
		return new ProductPageDTO(mapper.countProducts(categoryPager), mapper.selectProducts(categoryPager));
	}
	
	// pid로 제품 하나 가져오기
	public ProductDTO getProduct(int pid) {
		log.info("getProduct.............." + pid);
		//HashMap<String, Object> categoryPager = new HashMap<String, Object>();
		//categoryPager.put("cri", cri);
		return mapper.selectOneProduct(pid);
	}
	
	/*
	 * // 필터링 적용 후 데이터 가져오기 public ProductDTO searchProducts(Criteria cri) {
	 * log.info("searchProductService.............." + cri); HashMap<String, Object>
	 * categoryPager = new HashMap<String, Object>(); categoryPager.put("cri", cri);
	 * return new ProductPageDTO(mapper.countProducts(categoryPager),
	 * mapper.selectProducts(categoryPager)); }
	 */

}