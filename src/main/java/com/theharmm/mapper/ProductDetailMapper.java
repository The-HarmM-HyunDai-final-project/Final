package com.theharmm.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.theharmm.dto.product.ProductDetailDTO;
import com.theharmm.dto.product.ProductSizeDTO;
import com.theharmm.dto.product.ProductVo;


@Mapper
public interface ProductDetailMapper {
	
		public ProductDetailDTO selectProductDetail(int pid);

		public List<ProductSizeDTO> selectProductSizeList(ProductDetailDTO productDetailDTO);

		public ProductSizeDTO selectProductSize(Map<String, Object> productInfoMap);
}
