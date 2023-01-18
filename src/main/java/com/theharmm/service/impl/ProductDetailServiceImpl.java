package com.theharmm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;
import com.theharmm.mapper.ProductDetailMapper;
import com.theharmm.service.ProductDetailService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductDetailServiceImpl implements ProductDetailService{
	
	private ProductDetailMapper productDetailMapper;
	

	@Override
	public ProductDetailDTO selectProductDetail(int pid) {
		return productDetailMapper.selectProductDetail(pid);
	}


	@Override
	public List<ProductSizeDTO> selectSaleProductSizeList(ProductDetailDTO productDetailDTO) {
		return productDetailMapper.selectSaleProductSizeList(productDetailDTO);
	}


	@Override
	public ProductSizeDTO selectSaleProductSize(Map<String, Object> productInfoMap) {
		return productDetailMapper.selectSaleProductSize(productInfoMap);
	}

	//판매관련 




	@Override
	public List<ProductSizeDTO> selectBuyProductSizeList(ProductDetailDTO productDetailDTO) {
		
		return productDetailMapper.selectBuyProductSizeList(productDetailDTO);
	}


	@Override
	public ProductSizeDTO selectBuyProductSize(Map<String, Object> productInfoMap) {
		
		return productDetailMapper.selectBuyProductSize(productInfoMap);
	}
}
