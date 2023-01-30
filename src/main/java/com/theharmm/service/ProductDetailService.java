
package com.theharmm.service;

import java.util.List;
import java.util.Map;

import com.theharmm.domain.BuyDTO;
import com.theharmm.domain.ProductDTO;
import com.theharmm.domain.ProductDetailDTO;
import com.theharmm.domain.ProductSizeDTO;
import com.theharmm.domain.SellDTO;

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

	Long updateBuyOrder(Map<String, Object> saleInfoMap);

	Long updateSaleOrder(Map<String, Object> buyInfoMap);

	Long insertSaleOrder(Map<String, Object> saleInfoMap);

	Long insertBuyOrder(Map<String, Object> buyInfoMap);
	
	//상품상세페이지 구매, 판매 가장 작은 값 가져오기 
	BuyDTO selectMinBuyProductPrice(int pid); 
	
	SellDTO selectMinSellProductPrice(int pid); 
	
	//체결거래, 판매입찰, 구매입찰 
	List<BuyDTO> selectAllSignContract(int pid); 
	
	List<SellDTO> selectAllSellBid(int pid);

	List<BuyDTO> selectAllBuyBid(int pid);
	//같은 브랜드 상품리스트
	List<ProductDTO> selectProductBrandList(int pid);
}

