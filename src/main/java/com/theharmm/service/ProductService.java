package com.theharmm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.theharmm.dto.product.Criteria;
import com.theharmm.dto.product.ProductPageDTO;
import com.theharmm.dto.product.ProductVo;
import com.theharmm.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductService {
	private ProductMapper mapper;
	
	// 제품 코드로 제품 별 색상 가져오기
//	public List<ProductPageDTO> getAllProduct(Criteria cri) {
//		/* return mapper.selectAllProducts(); */
//	}
}
