package com.theharmm.service;

import java.util.List;
import java.util.Map;

import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;

public interface ProductDetailService {

	ProductDetailDTO selectProductDetail(int pid);

	List<ProductSizeDTO> selectProductSizeList(ProductDetailDTO productDetailDTO);

	ProductSizeDTO selectProductSize(Map<String, Object> productInfoMap);

}
