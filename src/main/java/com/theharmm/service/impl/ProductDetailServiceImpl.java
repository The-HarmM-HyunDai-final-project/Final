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
	public List<ProductSizeDTO> selectProductSizeList(ProductDetailDTO productDetailDTO) {
		return productDetailMapper.selectProductSizeList(productDetailDTO);
	}


	@Override
	public ProductSizeDTO selectProductSize(Map<String, Object> productInfoMap) {
		return productDetailMapper.selectProductSize(productInfoMap);
	}

	//판매관련 

	@Override
	public ProductDetailDTO selectSellProductDetail(int pid) {
	    return productDetailMapper.selectSellProductDetail(pid);
	}


	@Override
	public List<ProductSizeDTO> selectSellProductSizeList(ProductDetailDTO productDetailDTO) {
		
		return productDetailMapper.selectSellProductSizeList(productDetailDTO);
	}


	@Override
	public ProductSizeDTO selectSellProductSize(Map<String, Object> productInfoMap) {
		
		return productDetailMapper.selectSellProductSize(productInfoMap);
	}
}
