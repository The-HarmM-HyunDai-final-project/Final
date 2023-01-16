package com.theharmm.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;

@Mapper
public interface ProductDetailMapper {
	
		public ProductDetailDTO selectProductDetail(int pid);

		public List<ProductSizeDTO> selectProductSizeList(ProductDetailDTO productDetailDTO);

		public ProductSizeDTO selectProductSize(Map<String, Object> productInfoMap);
}
