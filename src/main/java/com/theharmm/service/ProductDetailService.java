
package com.theharmm.service;

import java.util.List;
import java.util.Map;

import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;

public interface ProductDetailService {

	
	ProductDetailDTO selectProductDetail(int pid);
	
	//상품에 대한 사이즈 및 사이즈별 판매입찰 최소금액 리스트 조회 
	List<ProductSizeDTO> selectSaleProductSizeList(ProductDetailDTO productDetailDTO);

	//판매입찰에 등록된 데이터 조회
	ProductSizeDTO selectSaleProductSize(Map<String, Object> productInfoMap);
	
	
	//상품에 대한 사이즈 및 사이즈별 구매입찰 최대금액 리스트 조회
	List<ProductSizeDTO> selectBuyProductSizeList(ProductDetailDTO productDetailDTO);
	
	//구매입찰에 등록된 데이터 조회
	ProductSizeDTO selectBuyProductSize(Map<String, Object> productInfoMap);

}

