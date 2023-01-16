package com.theharmm.service;

import java.util.List;
import java.util.Map;

import com.theharmm.dto.product.ProductDetailDTO;
import com.theharmm.dto.product.ProductSizeDTO;

public interface ProductDetailService {

	ProductDetailDTO selectProductDetail(int pid);

	List<ProductSizeDTO> selectProductSizeList(ProductDetailDTO productDetailDTO);

	ProductSizeDTO selectProductSize(Map<String, Object> productInfoMap);

}
