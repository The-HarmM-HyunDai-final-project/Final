package com.theharmm.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;


public interface ProductDetailMapper{
	
		public ProductDetailDTO selectProductDetail(int pid);

		public List<ProductSizeDTO> selectSaleProductSizeList(ProductDetailDTO productDetailDTO);

		public ProductSizeDTO selectSaleProductSize(Map<String, Object> productInfoMap);
		
		
		//판매관련

		public List<ProductSizeDTO> selectBuyProductSizeList(ProductDetailDTO productDetailDTO);

		public ProductSizeDTO selectBuyProductSize(Map<String, Object> productInfoMap);

		public Long updateBuyOrder(Map<String, Object> saleInfoMap);

		public Long updateSaleOrder(Map<String, Object> buyInfoMap);

		public Long insertSaleOrder(Map<String, Object> saleInfoMap);

		public Long insertBuyOrder(Map<String, Object> buyInfoMap);
}
