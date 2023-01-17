
package com.theharmm.service;

import java.util.List;
import java.util.Map;

import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;

public interface ProductDetailService {

	//구매관련 
	ProductDetailDTO selectProductDetail(int pid);

	List<ProductSizeDTO> selectProductSizeList(ProductDetailDTO productDetailDTO);

	ProductSizeDTO selectProductSize(Map<String, Object> productInfoMap);
	
	
	//판매관련
	ProductDetailDTO selectSellProductDetail(int pid);

	List<ProductSizeDTO> selectSellProductSizeList(ProductDetailDTO productDetailDTO);

	ProductSizeDTO selectSellProductSize(Map<String, Object> productInfoMap);

}

