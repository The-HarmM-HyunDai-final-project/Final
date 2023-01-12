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
	
	// �젣�뭹 肄붾뱶濡� �젣�뭹 蹂� �깋�긽 媛��졇�삤湲�
//	public List<ProductPageDTO> getAllProduct(Criteria cri) {
//		/* return mapper.selectAllProducts(); */
//	}
}
